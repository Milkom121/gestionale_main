import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_json.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';
import 'package:provider/provider.dart';

///direttamente nel file della pagina di dettaglio dello schermo creo una pagina specifica per la modifica dei dati dell'oggetto

class WorkToolEditScreen extends StatefulWidget {
  WorkToolEditScreen(this._workToolItem);



  WorkTool _workToolItem;

  @override
  _WorkToolEditScreenState createState() => _WorkToolEditScreenState();
}

class _WorkToolEditScreenState extends State<WorkToolEditScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<Inventory>(context);


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {

            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            color: Colors.black,
            onPressed: (){
              _formKey.currentState!.save();

              inventoryProvider.updateElement(widget._workToolItem.id, widget._workToolItem);

              InventoryJson().updateElementOnFirebase(widget._workToolItem.id, widget._workToolItem);

              Navigator.pop(context);

            }
            ,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CircleAvatar(
                  radius:50,
                  child: Image.asset(widget._workToolItem.imageReference),
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
                        initialValue: widget._workToolItem.title,
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

                          WorkTool _workTool = widget._workToolItem;
                          print(value);
                          widget._workToolItem = WorkTool(
                            id: _workTool.id,
                            imageReference: _workTool.imageReference,
                            title: value!,
                            actualAvailability: _workTool.actualAvailability,
                            category: _workTool.category,
                          );
                        },
                      ),
                    ), // NOME

                    ///form per la VARIETy -STRING-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._workToolItem.category,
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
                          WorkTool _workTool = widget._workToolItem;
                          print(value);
                          widget._workToolItem = WorkTool(
                            id: _workTool.id,
                            imageReference: _workTool.imageReference,
                            title: _workTool.title,
                            actualAvailability: _workTool.actualAvailability,
                            category: value!,
                          );
                        },
                      ),
                    ),



                    /// form per Actual Availability -INT-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._workToolItem.actualAvailability.toString(),
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
                          WorkTool _workTool = widget._workToolItem;
                          print(value);
                          widget._workToolItem = WorkTool(
                            id: _workTool.id,
                            imageReference: _workTool.imageReference,
                            title: _workTool.title,
                            actualAvailability: int.parse(value!),
                            category: _workTool.category,
                          );
                        },
                      ),
                    ),


                  ],
                ),
              ),

              // ListView.builder(
              //     itemCount: promo.promoItems.length  ,
              //     itemBuilder:(context, index) => PromoItem(title, imageUrl, price, description))
            ],
          ),
        ),
      ),
    );
  }
}
