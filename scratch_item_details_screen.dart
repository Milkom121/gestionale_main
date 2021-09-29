// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:gestionale_main/widgets/circle_avatar_image_picker.dart';
// import 'lib/models/real_items/disposable.dart';
//
// void main() {
//   runApp(MyApp2());
// }
//
//
//
//
// class MyApp2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         fontFamily: "Montserrat",
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: DisposableDetailScreen(Disposable(
//         title: 'Posate di plastica',
//         category: 'Bar',
//         trashCan: 'Plastica',
//         actualAvailability: 100,
//         dealer: 'Metro',
//         maxSupply: 1000,
//         purchasePrice: 0.20,
//         imageReference: 'image ',
//         sellingPrice: 0.20,
//       )),
//     );
//   }
// }
//
// class DisposableDetailScreen extends StatefulWidget {
//
//   DisposableDetailScreen(this.disposableObject);
//
//   final Disposable disposableObject;
//
//
//   @override
//   _DisposableDetailScreenState createState() => _DisposableDetailScreenState();
// }
//
//
// class _DisposableDetailScreenState extends State<DisposableDetailScreen> {
//
//
//   //INUTILE
// // var disposable ;
// //
// // @override
// // void initState() {
// //   super.initState();
// //   disposable = widget.disposableObject; ///per accedere alla variabile in ingresso con il costruttore del widget (disposableObject) devo usare "widget." ma dentro un initstate che richiama un super.initstate come indicato qui https://stackoverflow.com/questions/66180019/the-instance-widget-cant-be-accessed-in-an-initializer
// // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(height: 30,),
//
//               Center(
//                 child: Column(
//                   children: [
//                     CircleAvatarImagePicker(null),
//                     Text(widget.disposableObject.title, style: TextStyle(
//                       fontSize: 23,
//                       fontWeight: FontWeight.bold,
//                     ),)
//                   ],
//                 ),
//               ),
//
//               SizedBox(height: 30,),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text('Dealer',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold
//                       ),),
//                       SizedBox(height: 10,),
//                       Text(widget.disposableObject.dealer)
//                     ],
//                 ),
//
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text('Max Supply',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold
//                           ),),
//                         SizedBox(height: 10,),
//                         Text(widget.disposableObject.maxSupply.toString()),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//               SizedBox(height: 15,),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text('Buy Price',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold
//                           ),),
//                         SizedBox(height: 10,),
//                         Text(widget.disposableObject.purchasePrice.toString())
//                       ],
//                     ),
//
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text('Sell Price',
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold
//                           ),),
//                         SizedBox(height: 10,),
//                         Text(widget.disposableObject.sellingPrice.toString()),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
// // Disposable(
// //   title: 'Posate di plastica',
// //   category: 'Bar',
// //   trashCan: 'Plastica',
// //   actualAvailability: 100,
// //   dealer: 'Metro',
// //   maxSupply: 1000,
// //   purchasePrice: 0.20,
// //   imageReference: 'image '
// //   sellingPrice: 0.20,
// // )
//
