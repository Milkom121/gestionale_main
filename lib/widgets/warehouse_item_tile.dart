import 'package:flutter/material.dart';
import 'package:gestionale_main/back_end/database/inventory_firestore.dart';
import 'package:gestionale_main/models/real_items/disposable.dart';
import 'package:gestionale_main/models/real_items/ingredient.dart';
import 'package:gestionale_main/models/real_items/reselling_product.dart';
import 'package:gestionale_main/models/real_items/servicies_tools.dart';
import 'package:gestionale_main/models/real_items/work_tools.dart';
import 'package:gestionale_main/screens/inventory/items_screens/disposable_item_screens/disposable_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/ingredient_item_screens/ingredients_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/reselling_product_item_screen/reselling_product_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/service_tool_item_screens/service_tool_detail_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/work_tool_item_screen/work_tool_detail_screen.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:provider/provider.dart';

class WarehouseItemTile extends StatelessWidget {
  WarehouseItemTile({
    this.inventoryObject,
    required this.imageReference,
    required this.title,
    required this.subtitle,
    required this.actualAvailability,
    // required this.navigateTo,
  });

  final String imageReference;
  final String title;
  final String subtitle;
  final int actualAvailability;
  final inventoryObject;

  @override
  Widget build(BuildContext context) {
    final _inventoryProvider = Provider.of<Inventory>(context);

    return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (_) {
          _inventoryProvider.removeElementById(inventoryObject);
          InventoryFirestore().deleteItemOnFirebase(inventoryObject);
        },
        child: ListTile(
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => DisposableDetailScreen(inventoryObject)),
            // );

            ///a seconda del tipo dell'oggetto passato in costruzione del widget, creo una pagina ad hoc e ci navigo verso
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) {
                  if (inventoryObject is Disposable) {
                    return DisposableDetailScreen(inventoryObject);
                  } else if (inventoryObject is Ingredient) {
                    return IngredientDetailScreen(inventoryObject);
                  } else if (inventoryObject is ResellingProduct) {
                    return ResellingProductDetailScreen(inventoryObject);
                  } else if (inventoryObject is ServiceTool) {
                    return ServiceToolDetailScreen(inventoryObject);
                  } else if (inventoryObject is WorkTool) {
                    return WorkToolDetailScreen(inventoryObject);
                  } else {
                    return Container(
                      child: Text('No Route for this item'),
                    );
                  }
                },
              ),
            );
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          leading: CircleAvatar(
            radius: 30,
            //TODO: riattivare la riga seguente quando avrò impostato tutto il discorso delle immagini
            //child: Image.asset(imageReference),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(subtitle),
          trailing: Column(
            children: [
              SizedBox(
                height: 8,
              ),
              Text('Availability'),
              SizedBox(
                height: 10,
              ),
              Text(actualAvailability.toString()),
            ],
          ),
        ),
        background: Card(
          color: Colors.red,
          child: ListTile(
            trailing: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Icon(
                Icons.delete_forever,
                size: 35,
              ),
            ),
          ),
        ));
  }
}
