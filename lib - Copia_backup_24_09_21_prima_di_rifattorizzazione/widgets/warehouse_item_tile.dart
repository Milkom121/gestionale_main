import 'package:flutter/material.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/screens/inventory/items_detail_screens/disposable_detail_screen.dart';




class WarehouseItemTile extends StatelessWidget {
  WarehouseItemTile({
    required this.disposable,
    required this.imageReference,
    required this.title,
    required this.sellingPrice,

    required this.actualAvailability,
    // required this.navigateTo,

  });

  final String imageReference;
  final String title;
  final String sellingPrice;
  // final String navigateTo;

  final String actualAvailability;

  final Disposable disposable;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>DisposableDetailScreen(disposable))),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),

        leading: CircleAvatar(
                  radius: 30,
                  child: Image.asset(imageReference),
                ),
        title: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
        subtitle: Text('€ $sellingPrice'),

        trailing: Column(

                children: [
                  SizedBox(height: 8,),
                  Text('Availability'),
                  SizedBox(height: 10,),
                  Text(actualAvailability),
                ],
              ),




      ),
    );
  }
}


void navigateToTappedItem(){



}


















// class WarehouseItemTile extends StatelessWidget {
//   WarehouseItemTile({
//     required this.imageReference,
//     required this.title,
//     required this.sellingPrice,
//     required this.dealer,
//     required this.actualAvailability,
//     required this.maxSupply,
//   });
//
//   final String imageReference;
//   final String title;
//   final String sellingPrice;
//   final String dealer;
//   final String actualAvailability;
//   final String maxSupply;
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15.0),
//       ),
//       elevation: 10,
//       child: Expanded(
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CircleAvatar(
//                 radius: 30,
//                 child: Image.asset(imageReference),
//               ),
//             ),
//             SizedBox(width: 20,),
//
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//                 SizedBox(height: 10,),
//
//                 Text('€ $sellingPrice'),
//
//
//               ],
//             ),
//
//             Expanded(child: SizedBox()),
//
//
//
//             Column(
//
//               children: [
//                 SizedBox(height: 8,),
//                 Text('Availability'),
//                 SizedBox(height: 10,),
//                 Text(actualAvailability),
//               ],
//             ),
//
//             SizedBox(width: 20,)
//           ],
//         ),
//       ),
//     );
//   }
// }
