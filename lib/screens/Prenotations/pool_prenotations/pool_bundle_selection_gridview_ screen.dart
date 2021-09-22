import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gestionale_main/models/seats/pool_bundle.dart';

// CREO UNA callback
typedef void sendCallback(List bundleList);

class PoolBundleSelectionAlertDialogScreen extends StatefulWidget {
  PoolBundleSelectionAlertDialogScreen(
      {required this.sendPoolBundleSelectionToPrenotationScreen, required this.alreadySelectedItems, });

  final sendCallback sendPoolBundleSelectionToPrenotationScreen;
  final List alreadySelectedItems;// questo consente di evidenziare i posti gia seleionati in precedenza

  @override
  _PoolBundleSelectionAlertDialogScreenState createState() =>
      _PoolBundleSelectionAlertDialogScreenState();
}

class _PoolBundleSelectionAlertDialogScreenState
    extends State<PoolBundleSelectionAlertDialogScreen> {
  List<int> selectedPoolSeats = [];

  List poolBundleItemList = List.generate(44, (index) => int);

  Widget bundleNumbersSelectionScreen() {
    return Column(
      children: [
        Expanded(
          child: Container(
              height: 500.0, // Change as per your requirement
              width: 300.0, // Change as per your requirement
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 4 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: poolBundleItemList.length,
                  itemBuilder: (BuildContext context, index) {
                    return GridTile(
                        child: BundleNumberButton(
                            poolBundleItemList, index, selectedPoolSeats , widget.alreadySelectedItems)

                        );
                  })),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Pool Seats'),
      content: bundleNumbersSelectionScreen(),
      actions: [
        IconButton(
          color: Colors.green,
          icon: Icon(Icons.check),
          onPressed: () {
            widget
                .sendPoolBundleSelectionToPrenotationScreen(selectedPoolSeats);
            Navigator.pop(context);
          },
        ),
        IconButton(
          color: Colors.red,
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}

class BundleNumberButton extends StatefulWidget {
  const BundleNumberButton(
      this.poolBundleItemList, this.index, this.selectedPoolItems, this.alreadySelectedItems);

  final List poolBundleItemList;
  final List selectedPoolItems;
  final int index;
  final List alreadySelectedItems;

  int correctPositiveIndex() {
    return index + 1;
  }

  @override
  _BundleNumberButtonState createState() => _BundleNumberButtonState();
}

class _BundleNumberButtonState extends State<BundleNumberButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.selectedPoolItems.contains(widget.index + 1)) {
          setState(() {
            widget.selectedPoolItems.remove(widget.index + 1);
          });
        } else {
          setState(() {
            widget.selectedPoolItems.add(widget.index + 1);
          });
        }

        print(widget.selectedPoolItems);
      },
      onLongPress: () {
        if (widget.alreadySelectedItems.contains(widget.index +1)){
          setState(() {
            widget.alreadySelectedItems.remove(widget.index +1);
          });
        }
      },
      child: CircleAvatar(
        backgroundColor: widget.selectedPoolItems.contains(widget.index + 1) || widget.alreadySelectedItems.contains(widget.index +1)
            ? Colors.red
            : Colors.blue,
        child: Text(widget.correctPositiveIndex().toString()),
      ),
    );
  }
}
