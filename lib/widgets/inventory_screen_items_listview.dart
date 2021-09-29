import 'package:flutter/material.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/screens/inventory/items_screens/disposable_item_screens/disposable_detail_screen.dart';
import 'package:gestionale_main/widgets/warehouse_item_tile.dart';
import 'package:provider/provider.dart';

class InventorySearchItemsView extends StatefulWidget {


  @override
  State<InventorySearchItemsView> createState() => _InventorySearchItemsViewState();
}

class _InventorySearchItemsViewState extends State<InventorySearchItemsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Inventory>(builder: (context, inventory, child) {
      return ListView.separated(
        separatorBuilder: (BuildContext context, int index) =>
            Divider(),
        physics: ClampingScrollPhysics(),

        /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
        shrinkWrap: true,
        itemCount: inventory.foundInventoryElements.length,
        itemBuilder: (BuildContext context, index) {
          var _foundInventoryElement = inventory.foundInventoryElements[index];
          return WarehouseItemTile(
            inventoryObject: _foundInventoryElement ,
            imageReference: _foundInventoryElement.imageReference,
            title: _foundInventoryElement.title,
            sellingPrice: '12',
            actualAvailability:
            _foundInventoryElement.actualAvailability.toString(),

          );
        },
      );
    },);
  }
}



class InventoryDefaultItemsView extends StatefulWidget {

  @override
  _InventoryDefaultItemsViewState createState() => _InventoryDefaultItemsViewState();
}

class _InventoryDefaultItemsViewState extends State<InventoryDefaultItemsView> {

  @override
  Widget build(BuildContext context) {

    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Consumer<Inventory>(builder: (context, inventory, child)
    {
      return Column(children: [

        ///Lista dei DISPOSABLES
        Theme(
          data: theme,
          child: ExpansionTile(
            title: Text('Disposable'),
            initiallyExpanded: true,
            children: [

              ListView.builder(
                physics: ClampingScrollPhysics(),

                /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
                shrinkWrap: true,
                itemCount: inventory.disposables.length,
                itemBuilder: (BuildContext context, index) {
                  var disposable = inventory.disposables[index];
                  return GestureDetector(

                    child: WarehouseItemTile(
                      inventoryObject: disposable,
                      imageReference: disposable.imageReference,
                      title: disposable.title,
                      sellingPrice: disposable.sellingPrice.toString(),
                      actualAvailability:
                      disposable.actualAvailability.toString(),
                    ),
                  );
                },
              ),



            ],
          ),
        ),


        /// Lista degli INGREDIENTS
        Theme(
          data: theme,
          child: ExpansionTile(
            title: Text('Ingredients'),
            initiallyExpanded: true,
            children: [

              ListView.builder(
                physics: ClampingScrollPhysics(),

                /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
                shrinkWrap: true,
                itemCount: inventory.ingredients.length,
                itemBuilder: (BuildContext context, index) {
                  var ingredient = inventory.ingredients[index];
                  return WarehouseItemTile(
                    inventoryObject: ingredient,
                    imageReference: ingredient.imageReference,
                    title: ingredient.title,
                    sellingPrice: '12',
                    actualAvailability:
                    ingredient.actualAvailability.toString(),
                  );
                },
              ),


            ],
          ),
        ),


        /// Lista dei RESELLING PRODUCTS
        Theme(
          data: theme,
          child: ExpansionTile(
            title: Text('Reselling Products'),
            initiallyExpanded: true,
            children: [

              ListView.builder(
                physics: ClampingScrollPhysics(),

                /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
                shrinkWrap: true,
                itemCount: inventory.resellingProducts.length,
                itemBuilder: (BuildContext context, index) {
                  var resellingProducts = inventory.resellingProducts[index];
                  return WarehouseItemTile(
                    inventoryObject: resellingProducts,
                    imageReference: resellingProducts.imageReference,
                    title: resellingProducts.title,
                    sellingPrice: '12',
                    actualAvailability:
                    resellingProducts.actualAvailability.toString(),
                  );
                },
              ),


            ],
          ),
        ),


        /// Lista dei WORK TOOLS
        Theme(
          data: theme,
          child: ExpansionTile(
            title: Text('Work Tools'),
            initiallyExpanded: true,
            children: [

              ListView.builder(
                physics: ClampingScrollPhysics(),

                /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
                shrinkWrap: true,
                itemCount: inventory.workTools.length,
                itemBuilder: (BuildContext context, index) {
                  var workTools = inventory.workTools[index];
                  return WarehouseItemTile(
                    inventoryObject: workTools,
                    imageReference: workTools.imageReference,
                    title: workTools.title,
                    sellingPrice: '12',
                    actualAvailability:
                    workTools.actualAvailability.toString(),
                  );
                },
              ),


            ],
          ),
        ),


        /// Lista dei SERVICE TOOLS
        Theme(
          data: theme,
          child: ExpansionTile(
            title: Text('Service Tools'),
            initiallyExpanded: true,
            children: [

              ListView.builder(

                physics: ClampingScrollPhysics(),

                /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
                shrinkWrap: true,
                itemCount: inventory.serviceTools.length,
                itemBuilder: (BuildContext context, index) {
                  var serviceTool = inventory.serviceTools[index];
                  return WarehouseItemTile(
                    inventoryObject: serviceTool,
                    imageReference: serviceTool.imageReference,
                    title: serviceTool.title,
                    sellingPrice: '12',
                    actualAvailability:
                    serviceTool.actualAvailability.toString(),

                  );
                },
              ),



            ],
          ),
        ),
      ],);
    });
  }
}



//if (inventory.foundInventoryElements.isEmpty) {
//
//   return Column(children: [
//
//     ///Lista dei DISPOSABLES
//     ExpansionTile(
//       title: Text('Disposable'),
//       initiallyExpanded: true,
//       children: [
//
//         ListView.separated(
//
//           separatorBuilder: (BuildContext context, int index) =>
//               Divider(),
//           physics: ClampingScrollPhysics(),
//
//           /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
//           shrinkWrap: true,
//           itemCount: inventory.disposables.length,
//           itemBuilder: (BuildContext context, index) {
//             var disposable = inventory.disposables[index];
//             return WarehouseItemTile(
//               imageReference: disposable.imageReference,
//               title: disposable.title,
//               sellingPrice: disposable.sellingPrice.toString(),
//               actualAvailability:
//               disposable.actualAvailability.toString(),
//             );
//           },
//         ),
//
//         Container(
//           height: 80,
//         )
//
//       ],
//     ),
//
//
//     /// Lista degli INGREDIENTS
//     ExpansionTile(
//       title: Text('Ingredients'),
//       initiallyExpanded: true,
//       children: [
//
//         ListView.separated(
//           separatorBuilder: (BuildContext context, int index) =>
//               Divider(),
//           physics: ClampingScrollPhysics(),
//
//           /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
//           shrinkWrap: true,
//           itemCount: inventory.ingredients.length,
//           itemBuilder: (BuildContext context, index) {
//             var ingredient = inventory.ingredients[index];
//             return WarehouseItemTile(
//               imageReference: ingredient.imageReference,
//               title: ingredient.title,
//               sellingPrice: '12',
//               actualAvailability:
//               ingredient.actualAvailability.toString(),
//             );
//           },
//         ),
//
//         Container(
//           height: 80,
//         )
//       ],
//     ),
//
//
//     /// Lista dei RESELLING PRODUCTS
//     ExpansionTile(
//       title: Text('Reselling Products'),
//       initiallyExpanded: true,
//       children: [
//
//         ListView.separated(
//           separatorBuilder: (BuildContext context, int index) =>
//               Divider(),
//           physics: ClampingScrollPhysics(),
//
//           /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
//           shrinkWrap: true,
//           itemCount: inventory.resellingProducts.length,
//           itemBuilder: (BuildContext context, index) {
//             var resellingProducts = inventory.resellingProducts[index];
//             return WarehouseItemTile(
//               imageReference: resellingProducts.imageReference,
//               title: resellingProducts.title,
//               sellingPrice: '12',
//               actualAvailability:
//               resellingProducts.actualAvailability.toString(),
//             );
//           },
//         ),
//
//         Container(
//           height: 80,
//         )
//       ],
//     ),
//
//
//     /// Lista dei WORK TOOLS
//     ExpansionTile(
//       title: Text('Work Tools'),
//       initiallyExpanded: true,
//       children: [
//
//         ListView.separated(
//           separatorBuilder: (BuildContext context, int index) =>
//               Divider(),
//           physics: ClampingScrollPhysics(),
//
//           /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
//           shrinkWrap: true,
//           itemCount: inventory.workTools.length,
//           itemBuilder: (BuildContext context, index) {
//             var workTools = inventory.workTools[index];
//             return WarehouseItemTile(
//               imageReference: workTools.imageReference,
//               title: workTools.title,
//               sellingPrice: '12',
//               actualAvailability:
//               workTools.actualAvailability.toString(),
//             );
//           },
//         ),
//
//         Container(
//           height: 80,
//         )
//       ],
//     ),
//
//
//     /// Lista dei SERVICE TOOLS
//     ExpansionTile(
//       title: Text('Service Tools'),
//       initiallyExpanded: true,
//       children: [
//
//         ListView.separated(
//           separatorBuilder: (BuildContext context, int index) =>
//               Divider(),
//           physics: ClampingScrollPhysics(),
//
//           /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
//           shrinkWrap: true,
//           itemCount: inventory.serviceTools.length,
//           itemBuilder: (BuildContext context, index) {
//             var serviceTools = inventory.serviceTools[index];
//             return WarehouseItemTile(
//               imageReference: serviceTools.imageReference,
//               title: serviceTools.title,
//               sellingPrice: '12',
//               actualAvailability:
//               serviceTools.actualAvailability.toString(),
//
//             );
//           },
//         ),
//
//         Container(
//           height: 80,
//         )
//       ],
//     ),
//   ],);
// } else {
//   return ListView.separated(
//     separatorBuilder: (BuildContext context, int index) =>
//         Divider(),
//     physics: ClampingScrollPhysics(),
//
//     /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
//     shrinkWrap: true,
//     itemCount: inventory.foundInventoryElements.length,
//     itemBuilder: (BuildContext context, index) {
//       var foundInventoryElements = inventory.foundInventoryElements[index];
//       return WarehouseItemTile(
//         imageReference: foundInventoryElements.imageReference,
//         title: foundInventoryElements.title,
//         sellingPrice: '12',
//         actualAvailability:
//         foundInventoryElements.actualAvailability.toString(),
//
//       );
//     },
//   );
// }