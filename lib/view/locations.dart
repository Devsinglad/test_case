import 'package:flutter/material.dart';
import 'package:test_case/core/google_map.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('location$position'),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Send Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}