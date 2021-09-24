class Object1 {
  var id = 'Obj1';
}

class Object2 {
  var id = 'Obj2';
}

class Object3 {
  var id = 'Obj3';
}

class ListsOfObjects {
  List Objects1 = List.generate(100, (index) => Object1());
  List Objects2 = List.generate(100, (index) => Object2());
  List Objects3 = List.generate(100, (index) => Object3());

  Map<String, List> mapOfObjectsLists = {
    'Objects1': (ListsOfObjects().Objects1),
    'Objects2': (ListsOfObjects().Objects2),
    'Objects3': (ListsOfObjects().Objects2),
  };
}



void main(){
  ListsOfObjects().mapOfObjectsLists.forEach((key, value) {




    for (int i = 0 ; i <= value.length ; i++){
      print(i);
      print('FANCULO');
    }
  });
}


//
// void main() {
//   var data = {'name': 'John Doe', 'occupation': 'gardener'};
//   print(data);
//
//   print(data.runtimeType);
//
//   var words = <int, String>{1: 'sky', 2: 'falcon', 3: 'rock'};
//   print(words);
//
//   print(words.runtimeType);
// }
//
//
//
// void main() {
//   var words = ['sky', 'cloud', 'sod', 'worm', 'put', 'water', 'cup'];
//
//   var i = 0;
//   Map data = {
//     for (var word in words)
//       if (word.length == 3) i++ : word
//   };
//
//   print(data);
// }