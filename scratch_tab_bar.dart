import 'package:flutter/material.dart';
import 'package:gestionale_main/screens/inventory/items_screens/disposable_item_screens/new_disposable_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
      home: NewItemTabBAr(),
    );
  }
}


class NewItemTabBAr extends StatefulWidget {


  @override
  _NewItemTabBArState createState() => _NewItemTabBArState();
}

class _NewItemTabBArState extends State<NewItemTabBAr> {


  Map<String , Widget> _itemsCategoryPages = {

    'Disposable' : NewDisposableItemScreen(),
    'Ingredient' : Container(child: Center(child: Text('Ciao'),),),
    'Reselling Product' : Container(child: Center(child: Text('Ciao'),),),
    'Work Tool' : Container(child: Center(child: Text('Ciao'),),),
    'Service Tool' : Container(child: Center(child: Text('Ciao'),),),


  };


  List<Widget> _tabList=[];

  List<Widget> returnListOfTabs(){
    _itemsCategoryPages.forEach((key, value) => _tabList.add(Tab(child: value,)));
    return _tabList;
  }


  String  _itemCategoryPagesName (int index) {

    return _itemsCategoryPages.keys.elementAt(index);
  }

  Widget  _itemCategoryPagesScreen (int index) {

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
            },
            tabs:
           [ Tab(text: _itemCategoryPagesName(0),),
             Tab(text: _itemCategoryPagesName(1),),
             Tab(text: _itemCategoryPagesName(2),),
             Tab(text: _itemCategoryPagesName(3),),
             Tab(text: _itemCategoryPagesName(4),),
           ]
            //returnListOfTabs(),





            // Tab(icon: Icon(Icons.card_travel)),
            // Tab(icon: Icon(Icons.add_shopping_cart)),

          ),
          title: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [

            SingleChildScrollView(
              child: Column(
                children: [
                  NewDisposableItemScreen(),
                ],
              ),
            ),
            Container(child: Center(child: Text('ciao'),),),
            Container(child: Center(child: Text('ciao'),),),
            Container(child: Center(child: Text('ciao'),),),
            Container(child: Center(child: Text('ciao'),),),

          ],
        ),
      ),

    );
  }
}
