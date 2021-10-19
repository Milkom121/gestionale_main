import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';

class InventoryRealtimeDatabase with ChangeNotifier {

  final databaseReference = FirebaseDatabase.instance.reference();


}