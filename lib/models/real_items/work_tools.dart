/// tutti quelli che possono essere gli attrezzi da lavoro, dagli shaker ai coltelli di chef


class WorkTool{
   String id;
  final String title;
  final String category;// TODO da eliminare
  final String imageReference;
           int actualAvailability;

  WorkTool({required this.id,required this.imageReference, required this.title, required this.category , required this.actualAvailability});


   static Map<String, String> returnAWorkToolAsMap(WorkTool resellingProduct) {
     return {
       'id': resellingProduct.id,
       'title': resellingProduct.title,
       'actualAvailability': resellingProduct.actualAvailability.toString(),
       'imageReference': resellingProduct.imageReference,

     };
   }

}