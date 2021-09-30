/// uqi andiamo a definire gli strumenti di servizio, dagli attrezzi ai materiali da costruzione



class ServiceTool{
   String id;
  final String title;
  final String variety; // da eliminare
        int  actualAvailability;
  final String imageReference;

  ServiceTool( {required this.id, required this.imageReference, required this.title, required this.variety, required this.actualAvailability, });



   static Map<String, String> returnAServiceToolAsMap(ServiceTool resellingProduct) {
     return {
       'id': resellingProduct.id,
       'title': resellingProduct.title,
       'actualAvailability': resellingProduct.actualAvailability.toString(),
       'imageReference': resellingProduct.imageReference,

     };
   }


}