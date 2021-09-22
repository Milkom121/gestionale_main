/// in questo schermo andrò a costruire la schermata che mostra tutti i dati dispoibili relativametne ad un oggetto tramite Text() widget.
/// In questa schermata inserirò un pulsante MODIFICA che consetirà di accedere ad uno schermo con i dati modificabili tramite TextFormFIeld()



import 'package:flutter/material.dart';
import 'package:gestionale_main/widgets/app_navigation_bar.dart';
import 'package:gestionale_main/widgets/circle_avatar_image_picker.dart';

class ItemOverviewScreen extends StatefulWidget {



  @override
  _ItemOverviewScreenState createState() => _ItemOverviewScreenState();
}

class _ItemOverviewScreenState extends State<ItemOverviewScreen> {
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
                child: CircleAvatarImagePicker(null),
              )
              
              Form(child: child)
            ],
          ),
        ),
      ),
    );
  }
}
