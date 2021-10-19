import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gestionale_main/back_end/database/inventory_firestore.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/inventory_item.dart';

import 'package:gestionale_main/widgets/warehouse_item_tile.dart';
import 'package:provider/provider.dart';

class InventorySearchItemsView extends StatefulWidget {
  @override
  State<InventorySearchItemsView> createState() =>
      _InventorySearchItemsViewState();
}

class _InventorySearchItemsViewState extends State<InventorySearchItemsView> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Inventory>(
      builder: (context, inventory, child) {
        return ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),

          /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
          physics: ClampingScrollPhysics(),

          shrinkWrap: true,
          itemCount: inventory.foundInventoryElements.length,
          itemBuilder: (BuildContext context, index) {
            var _foundInventoryElement =
                inventory.foundInventoryElements[index];
            return WarehouseItemTile(
              inventoryObject: _foundInventoryElement,
              imageReference: _foundInventoryElement.imageReference,
              title: _foundInventoryElement.title,
              subtitle: _foundInventoryElement.subtitle,
              actualAvailability: _foundInventoryElement.actualAvailability,
            );
          },
        );
      },
    );
  }
}

class InventoryDefaultItemsView extends StatefulWidget {
  @override
  _InventoryDefaultItemsViewState createState() =>
      _InventoryDefaultItemsViewState();
}

class _InventoryDefaultItemsViewState extends State<InventoryDefaultItemsView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent);

    return Consumer<InventoryFirestore>(
        builder: (context, inventoryFirestore, child) {
      return Column(
        children: [
          ///Lista dei DISPOSABLES
          Theme(
            data: theme,
            child: ExpansionTile(
              title: Text('Disposable'),
              initiallyExpanded: true,
              children: [
                ///DISPOSABLE LISTVIEW
                StreamBuilder<QuerySnapshot>(
                    stream:
                        inventoryFirestore.disposablesCollection.snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              physics: ClampingScrollPhysics(),

                              /// "physics: ClampingScrollPhysics()"  mi consente lo scrolling su tutte le listview. Guarda questo post https://stackoverflow.com/questions/55180555/how-to-scroll-page-in-flutter-with-multiple-listviewbuilders
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, index) {
                                DocumentSnapshot elementMap =
                                    snapshot.data!.docs[index];

                                // var disposable = inventoryJson.disposables[index];
                                return GestureDetector(
                                  child: WarehouseItemTile(
                                    inventoryObject:
                                        Disposable.returnADisposableFromMap(
                                            elementMap),
                                    imageReference:
                                        elementMap['imageReference'],
                                    title: elementMap['title'],
                                    subtitle: elementMap['dealer'],
                                    actualAvailability:
                                        elementMap['actualAvailability'],
                                  ),
                                );
                              },
                            );
                    }),
              ],
            ),
          ),

          Theme(
            data: theme,
            child: ExpansionTile(
              title: Text('Ingredients'),
              initiallyExpanded: true,
              children: [
                ///INGREDIENTS LISTVIEW
                StreamBuilder<QuerySnapshot>(
                    stream:
                        inventoryFirestore.ingredientsCollection.snapshots(),
                    builder: (context, snapshot) {
                      return !snapshot.hasData
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              physics: ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data!.docs.length,
                              itemBuilder: (BuildContext context, index) {
                                DocumentSnapshot elementMap =
                                    snapshot.data!.docs[index];

                                // var disposable = inventoryJson.disposables[index];
                                return GestureDetector(
                                  child: WarehouseItemTile(
                                    inventoryObject:
                                        Ingredient.returnAnIngredientFromMap(
                                            elementMap),
                                    imageReference:
                                        elementMap['imageReference'],
                                    title: elementMap['title'],
                                    subtitle: elementMap['dealer'],
                                    actualAvailability:
                                        elementMap['actualAvailability'],
                                  ),
                                );
                              },
                            );
                    }),
              ],
            ),
          ),
        ],
      );
    });
  }
}
