import 'package:flutter/material.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/widgets/inventory_screen_items_listview.dart';
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


          ],
        ),
      ),
    );
  }
}


void navigateToTappedItem(){

}