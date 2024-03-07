import 'dart:async';

import 'package:http/http.dart' as http;

class EndPoint {
  String baseUrl = 'https://renda360tracker-cq2xy3nela-lm.a.run.app';

  Future<void> postLocation(lat, long, time) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/v1/delivery/tracking/stream/:12345'),
        headers: {
          'lat': lat.toString(),
          'lng': long.toString(),
          'timestamp': time
        },
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

  Future<void> subscribeToSse(StreamController<String> controller) async {
    String sseUrl = 'https://renda360tracker-cq2xy3nela-lm.a.run.app/v1/delivery/tracking/publish/12345';

    try {
      final response = await http.get(Uri.parse(sseUrl));

      if (response.statusCode == 200) {
        final events = response.body.split('\n\n');

        for (var event in events) {
          if (event.isNotEmpty) {
            controller.add(event);
          }
        }
        print('Response from SSE endpoint: ${response.body}');
      } else {
        print(response.statusCode);
        throw Exception('Failed to connect to SSE endpoint');
      }
    } catch (e) {
      print('Error subscribing to SSE: $e');
    }
  }
}