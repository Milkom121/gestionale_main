import 'package:flutter/material.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/widgets/inventory_screen_items_view.dart';
import 'package:gestionale_main/widgets/warehouse_item_tile.dart';
import 'package:gestionale_main/widgets/app_navigation_bar.dart';
import 'package:provider/provider.dart';

class WarehouseOverviewScreen extends StatefulWidget {
  static const routeName = '/WarehouseOverviewScreen';

  final int screenIndex = 6;



  @override
  _WarehouseOverviewScreenState createState() =>
      _WarehouseOverviewScreenState();
}

class _WarehouseOverviewScreenState extends State<WarehouseOverviewScreen> {
//TODO: creare metodo che si riferisca alla key della listview e consenta di creare o meno il container bianco che metto in fondo alla listView

bool isSearching = false;



  @override
  Widget build(BuildContext context) {
    final inventoryProvider = Provider.of<Inventory>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {}),
      appBar: AppBar(),
      bottomNavigationBar: AppNavigationBar(widget.screenIndex),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              color: Colors.blue,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 13.0),
                              child: Icon(Icons.search),
                            ),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 0, bottom: 11, top: 11, right: 15),
                            hintText: "Search Item"),
                        onChanged: (searchingText) {
                          setState(() {
                            inventoryProvider.findElemetsByName(searchingText);

                              searchingText.isEmpty ? isSearching  = false : isSearching = true;

                            // setState(() {
                            //   if(searchingText.isEmpty){
                            //     inventoryProvider.foundInventoryElements.clear();
                            //   }
                            // });
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: isSearching ? InventorySearchItemsView() : InventoryDefaultItemsView(),
            )

            // Column(children: [
            //
            //   ///Lista dei DISPOSABLES
            //   ExpansionTile(
            //     title: Text('Disposable'),
            //     initiallyExpanded: true,
            //     children: [
            //
            //       ListView.separated(
            //
            //         separatorBuilder: (BuildContext context, int index) =>
            //             Divider(),
            //         physics: ClampingScrollPhysics(),/// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
            //         shrinkWrap: true,
            //         itemCount: inventoryProvider.disposables.length,
            //         itemBuilder: (BuildContext context, index) {
            //           var disposable = inventoryProvider.disposables[index];
            //           return WarehouseItemTile(
            //             imageReference: disposable.imageReference,
            //             title: disposable.title,
            //             sellingPrice: disposable.sellingPrice.toString(),
            //             actualAvailability:
            //             disposable.actualAvailability.toString(),
            //           );
            //         },
            //       ),
            //
            //
            //     ],
            //   ),
            //
            //
            //
            //
            //   /// Lista degli INGREDIENTS
            //   ExpansionTile(
            //     title: Text('Ingredients'),
            //     initiallyExpanded: true,
            //     children: [
            //
            //       ListView.separated(
            //         separatorBuilder: (BuildContext context, int index) =>
            //             Divider(),
            //         physics: ClampingScrollPhysics(),/// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
            //         shrinkWrap: true,
            //         itemCount: inventoryProvider.ingredients.length,
            //         itemBuilder: (BuildContext context, index) {
            //           var ingredient = inventoryProvider.ingredients[index];
            //           return WarehouseItemTile(
            //             imageReference: ingredient.imageReference,
            //             title: ingredient.title,
            //             sellingPrice: '12',
            //             actualAvailability:
            //             ingredient.actualAvailability.toString(),
            //           );
            //         },
            //       ),
            //
            //       Container(
            //         height: 80,
            //       )
            //     ],
            //   ),
            //
            //
            //
            //
            //   /// Lista dei RESELLING PRODUCTS
            //   ExpansionTile(
            //     title: Text('Reselling Products'),
            //     initiallyExpanded: true,
            //     children: [
            //
            //       ListView.separated(
            //         separatorBuilder: (BuildContext context, int index) =>
            //             Divider(),
            //         physics: ClampingScrollPhysics(),
            //
            //         /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
            //         shrinkWrap: true,
            //         itemCount: inventoryProvider.resellingProducts.length,
            //         itemBuilder: (BuildContext context, index) {
            //           var resellingProducts = inventoryProvider.resellingProducts[index];
            //           return WarehouseItemTile(
            //             imageReference: resellingProducts.imageReference,
            //             title: resellingProducts.title,
            //             sellingPrice: '12',
            //             actualAvailability:
            //             resellingProducts.actualAvailability.toString(),
            //           );
            //         },
            //       ),
            //
            //       Container(
            //         height: 80,
            //       )
            //     ],
            //   ),
            //
            //
            //
            //   /// Lista dei WORK TOOLS
            //   ExpansionTile(
            //     title: Text('Work Tools'),
            //     initiallyExpanded: true,
            //     children: [
            //
            //       ListView.separated(
            //         separatorBuilder: (BuildContext context, int index) =>
            //             Divider(),
            //         physics: ClampingScrollPhysics(),/// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
            //         shrinkWrap: true,
            //         itemCount: inventoryProvider.workTools.length,
            //         itemBuilder: (BuildContext context, index) {
            //           var workTools = inventoryProvider.workTools[index];
            //           return WarehouseItemTile(
            //             imageReference: workTools.imageReference,
            //             title: workTools.title,
            //             sellingPrice: '12',
            //             actualAvailability:
            //             workTools.actualAvailability.toString(),
            //           );
            //         },
            //       ),
            //
            //       Container(
            //         height: 80,
            //       )
            //     ],
            //   ),
            //
            //
            //   /// Lista dei SERVICE TOOLS
            //   ExpansionTile(
            //     title: Text('Service Tools'),
            //     initiallyExpanded: true,
            //     children: [
            //
            //       ListView.separated(
            //         separatorBuilder: (BuildContext context, int index) =>
            //             Divider(),
            //         physics: ClampingScrollPhysics(),/// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
            //         shrinkWrap: true,
            //         itemCount: inventoryProvider.serviceTools.length,
            //         itemBuilder: (BuildContext context, index) {
            //           var serviceTools = inventoryProvider.serviceTools[index];
            //           return WarehouseItemTile(
            //             imageReference: serviceTools.imageReference,
            //             title: serviceTools.title,
            //             sellingPrice: '12',
            //             actualAvailability:
            //             serviceTools.actualAvailability.toString(),
            //
            //           );
            //         },
            //       ),
            //
            //       Container(
            //         height: 80,
            //       )
            //     ],
            //   ),
            // ],),
          ],
        ),
      ),
    );
  }
}
