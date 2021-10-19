import 'package:flutter/material.dart';
import 'package:gestionale_main/screens/Prenotations/prenotations_calendar_screen.dart';
import 'package:gestionale_main/screens/customers/search_customers_screen.dart';
import 'package:gestionale_main/screens/home_page.dart';
import 'package:gestionale_main/screens/Prenotations/pool_prenotations/pool_prenotation_screen.dart';
import 'package:gestionale_main/screens/inventory/warehouse_overview_screen.dart';



class AppNavigationBar extends StatefulWidget {

  AppNavigationBar(this.actualIndex);

  int actualIndex;

  @override
  State<AppNavigationBar> createState() => _AppNavigationBarState();
}


class _AppNavigationBarState extends State<AppNavigationBar> {
  int _selectedIndex = 0;

  // static const TextStyle optionStyle =
  // TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Bar',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Restaurant',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Pool',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (index == 0 && widget.actualIndex != 0) {
        Navigator.pushNamed(context, HomePage.routeName);
      }

      if (index == 4 && widget.actualIndex != 4 ) {
        Navigator.pushNamed(context, PrenotationsCalendarScreen.routeName);
      }

      if (index == 5 && widget.actualIndex != 5) {
        Navigator.pushNamed(context, SearchCustomerScreen.routeName);
      }

      if (index == 6 && widget.actualIndex != 6) {
        Navigator.pushNamed(context, WarehouseOverviewScreen.routeName);
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_drink),
          label: 'Bar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.restaurant),
          label: 'Restaurant',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.beach_access),
          label: 'Pool',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_rounded),
          label: 'Booking',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account_outlined),
          label: 'Users'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
          label: 'Inventory'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Inventory'
        )
      ],
      currentIndex: widget.actualIndex,
      unselectedItemColor: Colors.grey[300],
      selectedItemColor: Theme.of(context).accentColor,
      onTap: _onItemTapped,
    );
  }
}
