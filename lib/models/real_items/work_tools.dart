/// tutti quelli che possono essere gli attrezzi da lavoro, dagli shaker ai coltelli di chef


class WorkTool{
   String id;
  final String title;
  final String category;
  final String imageReference;
           int actualAvailability;

  WorkTool({required this.id,required this.imageReference, required this.title, required this.category , required this.actualAvailability});


}