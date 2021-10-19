import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gestionale_main/back_end/database/inventory_firestore.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:provider/provider.dart';

///direttamente nel file della pagina di dettaglio dello schermo creo una pagina specifica per la modifica dei dati dell'oggetto

class ServiceToolEditScreen extends StatefulWidget {
  ServiceToolEditScreen(this._serviceToolItem);



  ServiceTool _serviceToolItem;

  @override
  _ServiceToolEditScreenState createState() => _ServiceToolEditScreenState();
}

class _ServiceToolEditScreenState extends State<ServiceToolEditScreen> {
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

              inventoryProvider.updateElement(widget._serviceToolItem.id, widget._serviceToolItem);

              InventoryFirestore().updateElementOnFirebase(widget._serviceToolItem.id, widget._serviceToolItem);

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
                  child: Image.asset(widget._serviceToolItem.imageReference),
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
                        initialValue: widget._serviceToolItem.title,
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

                          ServiceTool _serviceTool = widget._serviceToolItem;
                          print(value);
                          widget._serviceToolItem = ServiceTool(
                            id: _serviceTool.id,
                            dealer: _serviceTool.dealer,
                            imageReference: _serviceTool.imageReference,
                            title: value!,
                            actualAvailability: _serviceTool.actualAvailability,
                            variety: _serviceTool.variety,
                          );
                        },
                      ),
                    ), // NOME

                    ///form per la VARIETy -STRING-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._serviceToolItem.variety,
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
                          ServiceTool _serviceTool = widget._serviceToolItem;
                          print(value);
                          widget._serviceToolItem = ServiceTool(
                            id: _serviceTool.id,
                            dealer: _serviceTool.dealer,
                            imageReference: _serviceTool.imageReference,
                            title: value!,
                            actualAvailability: _serviceTool.actualAvailability,
                            variety: _serviceTool.variety,
                          );
                        },
                      ),
                    ),



                    /// form per Actual Availability -INT-
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 35),
                      child: TextFormField(
                        initialValue: widget._serviceToolItem.actualAvailability.toString(),
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
                          ServiceTool _serviceTool = widget._serviceToolItem;
                          print(value);
                          widget._serviceToolItem =ServiceTool(
                            id: _serviceTool.id,
                            dealer: _serviceTool.dealer,
                            imageReference: _serviceTool.imageReference,
                            title: value!,
                            actualAvailability: _serviceTool.actualAvailability,
                            variety: _serviceTool.variety,
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
