

import 'package:flutter/material.dart';
import 'package:gestionale_main/widgets/app_navigation_bar.dart';



class HomePage extends StatelessWidget {

  static const routeName = '/HomePage';

  final int screenIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            color: Colors.black,
            onPressed: (){
              //inviare posizione gps ad amici
            }
            ,
          ),
        ],
      ),
      drawer: Drawer(),
      bottomNavigationBar: AppNavigationBar(screenIndex),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                child: Image.asset('assets/images/mainsummer_logo.png'),
              ),),
            // ListView.builder(
            //     itemCount: promo.promoItems.length  ,
            //     itemBuilder:(context, index) => PromoItem(title, imageUrl, price, description))
          ],
        ),
      ),
    );
  }
}

