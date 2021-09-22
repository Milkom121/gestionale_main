import 'package:flutter/material.dart';

class CircleAvatarImagePicker extends StatelessWidget {

  CircleAvatarImagePicker(imageReference);

   var imageReference = Icon(Icons.account_circle, size: 100) ; // mi servirà per fornire l'indirizzo all'immagine da mostrare, se presente

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //TODO inserire logica per apertura della camera o della galleria
      },
      child: CircleAvatar(
        radius: 70,
        backgroundColor: Colors.transparent,
        child: imageReference //TODO inserire logica per mostrare l'immagine quando disponibile
      ),
    );
  }
}