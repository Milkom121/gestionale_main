import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gestionale_main/back_end/database/inventory_firestore.dart';
import 'package:gestionale_main/data/customers.dart';
import 'package:gestionale_main/data/inventory.dart';
import 'package:gestionale_main/data/prenotations.dart';
import 'package:gestionale_main/screens/Prenotations/prenotations_calendar_screen.dart';
import 'package:gestionale_main/screens/Prenotations/restaurant_prenotation/restaurant_prenotation_screen.dart';
import 'package:gestionale_main/screens/customers/search_customers_screen.dart';
import 'package:gestionale_main/screens/Prenotations/pool_prenotations/pool_prenotation_screen.dart';
import 'package:gestionale_main/screens/inventory/warehouse_overview_screen.dart';
import 'package:provider/provider.dart';
import 'screens/customers/new_customer_screen.dart';

import 'screens/home_page.dart';

///APPLICAZIONE ORIGINALE

// void main() {
//   runApp(MyApp());
// }


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());

}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Inventory()),
        ChangeNotifierProvider(create: (context) => InventoryFirestore()),
        ChangeNotifierProvider(create: (context) => Customers()),
        ChangeNotifierProvider(create: (context) => Prenotations()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName : (ctx) => HomePage(),
          PoolPrenotationScreen.routeName : (ctx) => PoolPrenotationScreen(),
          SearchCustomerScreen.routeName : (ctx) =>SearchCustomerScreen(),
          NewCustomerScreen.routeName : (ctx) =>NewCustomerScreen(),
          PrenotationsCalendarScreen.routeName : (ctx) =>PrenotationsCalendarScreen(),
          WarehouseOverviewScreen.routeName : (ctx) => WarehouseOverviewScreen(),
          RestaurantPrenotationScreen.routeName :(ctx) => RestaurantPrenotationScreen(),


        },
      ),
    );
  }
}


