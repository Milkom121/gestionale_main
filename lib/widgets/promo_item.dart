import 'package:flutter/material.dart';

class PromoItem extends StatelessWidget {

  final String title;
  final String description;
  final bool price;
  final String imageUrl;

  PromoItem(Key key, this.title, this.description, this.price, this.imageUrl);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/mainsummer_logo.png'), //TODO immagine provvisoria
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,

              ),
            ),
            Text(description),
            Text(price.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),)
          ],
        ),
      ),);
  }
}
