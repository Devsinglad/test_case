// import 'package:http/http.dart'as http;
//
// class EndPoint{
//   String baseUrl='GetLocationScreen';
//   Future<void> postLocation(String lat, String long,time)async {
//     try{
//       var response=await http.post(Uri.parse('$baseUrl/v1/delivery/tracking/stream/12345'),body: {
//       },headers: {
//         'lat':lat,
//         'lng': long,
//         'timestamp':time
//       },);
//       if (response.statusCode==200){
//         print('request successful');
//       }else{
//         print('Not successful');
//       }
//     }catch(e){
//       print('>>>>>$e');
//     }
//   }
//
//
//
//
// }