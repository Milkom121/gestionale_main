

import 'dart:convert';

import 'package:gestionale_main/models/real_items/work_tools.dart';

class ListOfObjects {
  List<WorkTool> workTools = [
    WorkTool(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      title: 'Padella',
      category: 'Cucina',
      actualAvailability: 1,
    ),
    WorkTool(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      title: 'Coltello',
      category: 'Cucina',
      actualAvailability: 1,
    ),
    WorkTool(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      title: 'Coltello',
      category: 'Cucina',
      actualAvailability: 1,
    ),
  ];
}



void main (){

  List<WorkTool> workTools = [
    WorkTool(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      title: 'Padella',
      category: 'Cucina',
      actualAvailability: 1,
    ),
    WorkTool(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      title: 'Coltello',
      category: 'Cucina',
      actualAvailability: 1,
    ),
    WorkTool(
      id: '',
      imageReference: 'assets/images/mainsummer_logo.png',
      title: 'Coltello',
      category: 'Cucina',
      actualAvailability: 1,
    ),
  ];

  ///------------------TEST JSON-----------------------
  var json = jsonEncode(workTools[0]);
  print(json);
  ///------------------TEST JSON-----------------------


}

















