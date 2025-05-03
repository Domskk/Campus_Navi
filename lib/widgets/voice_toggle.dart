import 'package:flutter/material.dart';

class VoiceToggleSheet extends StatelessWidget {
  final bool isVoiceEnabled;

  const VoiceToggleSheet({super.key, required this.isVoiceEnabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Voice Navigation',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Enable Voice Navigation',
                style: TextStyle(fontSize: 16),
              ),
              Switch(
                value: isVoiceEnabled,
                onChanged: (value) {
                  Navigator.pop(context, value); // Return the new value
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
