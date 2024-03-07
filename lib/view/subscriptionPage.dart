import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test_case/core/api.dart';

class SseSubscriptionPage extends StatefulWidget {
  const SseSubscriptionPage({super.key});

  @override
  _SseSubscriptionPageState createState() => _SseSubscriptionPageState();
}

class _SseSubscriptionPageState extends State<SseSubscriptionPage> {

  late final StreamController<String> _controller;

  @override
  void initState() {
    EndPoint data=EndPoint();
    super.initState();
    _controller = StreamController<String>();

    data.subscribeToSse(_controller);
  }


  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SSE Subscription Page'),
      ),
      body: SafeArea(
        child: StreamBuilder<String>(
          stream: _controller.stream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListTile(
                title: Text(snapshot.data!),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}