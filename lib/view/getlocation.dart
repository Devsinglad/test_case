import 'package:flutter/material.dart';
import 'package:test_case/core/google_map.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({super.key});

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  double position = 0;

  @override
  void initState() {
    _getLocation();
    super.initState();
  }

  Future<void> _getLocation() async {
    try {
      Maps map = Maps();
      await map.getLocationPermission();
      final currentPosition = await map.getLocationPermission();
      setState(() {
        position = currentPosition.latitude;
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text('location$position'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Send Location'),
            ),
          ],
        ),
      ),
    );
  }
}