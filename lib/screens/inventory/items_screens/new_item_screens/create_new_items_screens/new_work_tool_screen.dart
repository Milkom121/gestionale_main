import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';
import 'package:provider/provider.dart';

class NewWorkTooItemScreen extends StatefulWidget {

  WorkTool _newWorkToolItem = WorkTool(
    id: 'id',
    imageReference: 'imageReference',
    title: 'title',
    actualAvailability: 0,
    category: 'category',

  );

  @override
  _NewWorkTooItemScreenState createState() =>
      _NewWorkTooItemScreenState();
}

class _NewWorkTooItemScreenState
    extends State<NewWorkTooItemScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _inventoryProvider = Provider.of<Inventory>(context);
    WorkTool _workToolItem = widget._newWorkToolItem;
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(widget._newWorkToolItem.imageReference),
          ),
        ),
        Form(
          key: _formKey,
          child: Column(
            children: [
              ///FORM PER IL TITOLO DELL'OGGETTO
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newWorkToolItem.title,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(fontSize: 22 , color: Colors.blue)
                  ),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a name';
                    }
                    return null;
                  },
                  onSaved: (value) {


                    print(value);
                    widget._newWorkToolItem = WorkTool(
                      id: _workToolItem.id,
                      imageReference: _workToolItem.imageReference,
                      title: value!,
                      actualAvailability: _workToolItem.actualAvailability,
                      category: _workToolItem.category,
                    );
                  },
                ),
              ), // NOME

              ///form per la CATEGORY -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newWorkToolItem.category,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(labelText: 'Category',
                    labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide a Category';
                    }
                    return null;
                  },
                  onSaved: (value) {

                    print(value);
                    widget._newWorkToolItem = WorkTool(
                      id: _workToolItem.id,
                      imageReference: _workToolItem.imageReference,
                      title: _workToolItem.category,
                      actualAvailability: _workToolItem.actualAvailability,
                      category: value!,
                    );
                  },
                ),
              ),



              /// form per Actual Availability -INT-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newWorkToolItem.actualAvailability.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration:
                  InputDecoration(labelText: 'Actual Availability',
                    labelStyle: TextStyle(fontSize: 22 , color: Colors.blue),),
                  //textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please provide Actual Availability';
                    }
                    return null;
                  },
                  onSaved: (value) {

                    print(value);
                    widget._newWorkToolItem = WorkTool(
                      id: _workToolItem.id,
                      imageReference: _workToolItem.imageReference,
                      title: _workToolItem.title,
                      actualAvailability: int.parse(value!),
                      category: _workToolItem.category,
                    );
                  },
                ),
              ),


              Container(
                height: 100,
                width: double.infinity,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();

                      setState(() {
                        _inventoryProvider.addNewElementToCorrectInventoryAndID(
                            widget._newWorkToolItem);
                      });

                      Navigator.pop(context);
                    },
                    child: const Text('Save'),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
