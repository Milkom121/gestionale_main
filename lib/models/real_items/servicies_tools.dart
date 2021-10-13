/// uqi andiamo a definire gli strumenti di servizio, dagli attrezzi ai materiali da costruzione



class ServiceTool{
   String id;
  final String title;
  final String variety; // da eliminare
        int  actualAvailability;
  final String imageReference;

  ServiceTool( {required this.id, required this.imageReference, required this.title, required this.variety, required this.actualAvailability, });



   static Map<String, String> returnAServiceToolAsMap(ServiceTool serviceTool) {
     return {
       'id': serviceTool.id,
       'title': serviceTool.title,
       'actualAvailability': serviceTool.actualAvailability.toString(),
       'imageReference': serviceTool.imageReference,

     };
   }


}