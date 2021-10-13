import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_json.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:provider/provider.dart';

class NewServiceTooItemScreen extends StatefulWidget {

  ServiceTool _newServiceToolItem = ServiceTool(
    id: 'id',
    imageReference: 'imageReference',
    title: 'title',
    variety: 'variety',
    actualAvailability: 0,

  );

  @override
  _NewServiceTooItemScreenState createState() =>
      _NewServiceTooItemScreenState();
}

class _NewServiceTooItemScreenState
    extends State<NewServiceTooItemScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _inventoryProvider = Provider.of<Inventory>(context);
    ServiceTool _serviceToolItem = widget._newServiceToolItem;
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Center(
          child: CircleAvatar(
            radius: 50,
            child: Image.asset(widget._newServiceToolItem.imageReference),
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
                  initialValue: widget._newServiceToolItem.title,
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
                    widget._newServiceToolItem = ServiceTool(
                      id: _serviceToolItem.id,
                      imageReference: _serviceToolItem.imageReference,
                      title: value!,
                      actualAvailability: _serviceToolItem.actualAvailability,
                      variety: _serviceToolItem.variety,
                    );
                  },
                ),
              ), // NOME

              ///form per la VARIETy -STRING-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newServiceToolItem.variety,
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
                    widget._newServiceToolItem = ServiceTool(
                      id: _serviceToolItem.id,
                      imageReference: _serviceToolItem.imageReference,
                      title: value!,
                      actualAvailability: _serviceToolItem.actualAvailability,
                      variety: _serviceToolItem.variety,
                    );
                  },
                ),
              ),



              /// form per Actual Availability -INT-
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 35),
                child: TextFormField(
                  initialValue: widget._newServiceToolItem.actualAvailability.toString(),
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
                    widget._newServiceToolItem =ServiceTool(
                      id: _serviceToolItem.id,
                      imageReference: _serviceToolItem.imageReference,
                      title: value!,
                      actualAvailability: _serviceToolItem.actualAvailability,
                      variety: _serviceToolItem.variety,
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
                        _inventoryProvider.addNewElementToCorrectInventoryAndID(widget._newServiceToolItem);
                      });

                      InventoryJson().addNewElementToCorrectFirebaseDocument(widget._newServiceToolItem);

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
