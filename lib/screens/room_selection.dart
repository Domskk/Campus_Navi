import 'package:flutter/material.dart';

class RoomSelectionScreen extends StatelessWidget {
  final String destination;
  final bool isVoiceEnabled;

  const RoomSelectionScreen({
    super.key,
    required this.destination,
    required this.isVoiceEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Room: $destination')),
      body: Center(
        child: Text(
          'Voice Navigation is ${isVoiceEnabled ? "Enabled" : "Disabled"}',
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
