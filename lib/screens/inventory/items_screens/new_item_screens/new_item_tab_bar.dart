import 'package:flutter/material.dart';
import 'package:gestionale_main/screens/inventory/items_screens/reselling_product_item_screen/new_reselling_product_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/service_tool_item_screens/new_service_tool_screen.dart';
import 'package:gestionale_main/screens/inventory/items_screens/work_tool_item_screen/new_work_tool_screen.dart';

import '../disposable_item_screens/new_disposable_screen.dart';
import '../ingredient_item_screens/new_ingredient_screen.dart';

class NewItemTabBAr extends StatefulWidget {
  @override
  _NewItemTabBArState createState() => _NewItemTabBArState();
}

class _NewItemTabBArState extends State<NewItemTabBAr> {

  Key _currentPageState = GlobalKey();

  Map<String, Widget> _itemsCategoryPages = {
    'Disposable': NewDisposableItemScreen(),
    'Ingredient': Container(
      child: Center(
        child: Text('Ciao'),
      ),
    ),
    'Reselling Product': Container(
      child: Center(
        child: Text('Ciao'),
      ),
    ),
    'Work Tool': Container(
      child: Center(
        child: Text('Ciao'),
      ),
    ),
    'Service Tool': Container(
      child: Center(
        child: Text('Ciao'),
      ),
    ),
  };


  int _currentPageIndex = 0;

  List<Widget> _tabList = [];

  List<Widget> returnListOfTabs() {
    _itemsCategoryPages.forEach((key, value) =>
        _tabList.add(Tab(
          child: value,
        )));
    return _tabList;
  }

  String _itemCategoryPagesName(int index) {
    return _itemsCategoryPages.keys.elementAt(index);
  }

  Widget _itemCategoryPagesScreen(int index) {
    return _itemsCategoryPages.values.elementAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: _itemsCategoryPages.length,
      child: Scaffold(


        appBar: AppBar(
          bottom: TabBar(
              isScrollable: true,
              onTap: (index) {
                // Tab index when user select it, it start from zero
                setState(() {
                  _currentPageIndex = index;
                });
              },
              tabs: [
                Tab(
                  text: _itemCategoryPagesName(0),
                ),
                Tab(
                  text: _itemCategoryPagesName(1),
                ),
                Tab(
                  text: _itemCategoryPagesName(2),
                ),
                Tab(
                  text: _itemCategoryPagesName(3),
                ),
                Tab(
                  text: _itemCategoryPagesName(4),
                ),
              ]
            //returnListOfTabs(),

            // Tab(icon: Icon(Icons.card_travel)),
            // Tab(icon: Icon(Icons.add_shopping_cart)),

          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [

            ///Nuovo DISPOSABLE
            SingleChildScrollView(
              child: Column(
                children: [
                  NewDisposableItemScreen(),
                ],
              ),
            ),

            ///Nuovo INGREDIENT
            SingleChildScrollView(
              child: Column(
                children: [
                  NewIngredientItemScreen(),
                ],
              ),
            ),

            ///Nuovo RESELLING PRODUCT
            SingleChildScrollView(
              child: Column(
                children: [
                  NewResellingProductItemScreen(),
                ],
              ),
            ),

            ///Nuovo WORK TOOL
            SingleChildScrollView(
              child: Column(
                children: [
                  NewWorkTooItemScreen(),
                ],
              ),
            ),

            ///Nuovo SERVICE TOOL
            SingleChildScrollView(
              child: Column(
                children: [
                  NewServiceTooItemScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// Container(
//   height: 80,
//   width: double.infinity,
//   child: Center(child: ElevatedButton(
//     onPressed: () {
//
//     },
//     child: const Text('Save'),
//   ),
//     ),
//
// )
