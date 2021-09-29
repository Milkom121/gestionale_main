import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

/// in questa pagina creerò un selettore che consentirà di indicare che tipo di nuovo item si vuole creare e di conseguenza presenterà il form corretto con un carousel

class PageViewNewItem extends StatefulWidget {
  @override
  _PageViewNewItemState createState() => _PageViewNewItemState();
}

class _PageViewNewItemState extends State<PageViewNewItem> {


  List<String> itemsCategory = [
    'Disposable',
    'Ingredient',
    'Reselling Product',
    'Work Tool',
    'Service Tool'
  ];

  int _showedPageIndex = 0;



  @override
  Widget build(BuildContext context) {

    final PageController _pageViewController = PageController(initialPage: _showedPageIndex);

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              height: 80,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 4,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: itemsCategory.length,
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _showedPageIndex = index;
                      });
                      _pageViewController.animateToPage(index, duration: Duration(seconds: 1), curve: Curves.easeIn);
                      //TODO: si presenta un problema nella colorazione dei pulsanti di selezione, cioè quando vado dal primo al terzo e viceversa si illumina anche il secondo senza motivo

                      print(_showedPageIndex);
                    },
                    child: Chip(
                      backgroundColor: _showedPageIndex == index ? Colors.redAccent : Colors.white,
                      label: Text(
                        itemsCategory[index],
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                child: PageView(
                  
                  onPageChanged: (index){
                    setState(() {
                      _showedPageIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  controller: _pageViewController,
                  children: const <Widget>[
                    Center(
                      child: Text('First Page'),
                    ),
                    Center(
                      child: Text('Second Page'),
                    ),
                    Center(
                      child: Text('Third Page'),
                    )
                  ],
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {

              },
              child: const Text('Save'),
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
