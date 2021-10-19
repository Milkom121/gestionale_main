/// in questo schermo andrò a costruire la schermata che mostra tutti i dati dispoibili relativametne ad un oggetto tramite Text() widget.
/// In questa schermata inserirò un pulsante MODIFICA che consetirà di accedere ad uno schermo con i dati modificabili tramite TextFormFIeld()



import 'package:flutter/material.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/widgets/app_navigation_bar.dart';
import 'package:gestionale_main/widgets/circle_avatar_image_picker.dart';

class DisposableDetailScreen extends StatefulWidget {

  DisposableDetailScreen(this.disposableObject);

  final Disposable disposableObject;



  @override
  _DisposableDetailScreenState createState() => _DisposableDetailScreenState();
}

class _DisposableDetailScreenState extends State<DisposableDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 30,),

              Center(
                child: Column(
                  children: [
                    CircleAvatarImagePicker(null),
                    Text(widget.disposableObject.title, style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),)
                  ],
                ),
              ),

              SizedBox(height: 30,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Dealer',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(widget.disposableObject.dealer)
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Max Supply',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(widget.disposableObject.maxSupply.toString()),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Buy Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(widget.disposableObject.purchasePrice.toString())
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Sell Price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),),
                        SizedBox(height: 10,),
                        Text(widget.disposableObject.sellingPrice.toString()),
                      ],
                    )
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}


// Disposable(
//   title: 'Posate di plastica',
//   category: 'Bar',
//   trashCan: 'Plastica',
//   actualAvailability: 100,
//   dealer: 'Metro',
//   maxSupply: 1000,
//   purchasePrice: 0.20,
//   imageReference: 'image '
//   sellingPrice: 0.20,
// ),