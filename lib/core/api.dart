import 'package:http/http.dart' as http;

class EndPoint {
  String baseUrl = 'https://renda360tracker-cq2xy3nela-lm.a.run.app';

  Future<void> postLocation(lat, long, time) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/v1/delivery/tracking/stream/:12345'),
        headers: {'lat': lat.toString(), 'lng': long.toString(), 'timestamp': time},
      );
      print(time);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('request successful');
      } else {
        print('Not successful');
      }
    } catch (e) {
      print('>>>>>$e');
    }
  }
}