import 'package:flutter/material.dart';
import 'package:frontend/screens/room_selection.dart';
import 'package:frontend/widgets/voice_toggle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedRoom;
  bool isVoiceEnabled = true;

  // List of rooms
  final List<String> rooms = [
    'Room 101',
    'Room 102',
    'Room 103',
    'Room 104',
    'Room 105',
    'Room 106',
    'Room 107',
    'Room 108',
    'Room 109',
    'Room 110',
    'Room 111',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header section
          Container(
            color: const Color(0xFF1CB688), // Green background
            child: Column(
              children: [
                // Logo and college name
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 16.0,
                    right: 16.0,
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/gclogo.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'GORDON COLLEGE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),

                // Yellow/amber separator line
                Container(height: 4, color: Colors.amber),
              ],
            ),
          ),

          // Main content area - Campus image with text overlay
          Expanded(
            child: Stack(
              children: [
                // Background image with green overlay
                Positioned.fill(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      const Color(0xFF1CB688).withOpacity(0.7),
                      BlendMode.srcOver,
                    ),
                    child: Image.asset(
                      'assets/images/gchome.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Campus Navigation text
                Positioned(
                  top: 20,
                  left: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Campus',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Navigation',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 42,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom navigation bar with dropdown and buttons
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFF1CB688),
              border: Border(
                top: BorderSide(color: Colors.amber, width: 4.0),
                bottom: BorderSide(color: Colors.amber, width: 4.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                // Dropdown for destination selection
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        child: DropdownButton<String>(
                          hint: const Text('Choose your destination'),
                          value: selectedRoom,
                          isExpanded: true,
                          icon: const Icon(Icons.arrow_drop_down),
                          menuMaxHeight: 240,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedRoom = newValue;
                            });
                          },
                          items:
                              rooms.map<DropdownMenuItem<String>>((
                                String room,
                              ) {
                                return DropdownMenuItem<String>(
                                  value: room,
                                  child: Text(room),
                                );
                              }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Back/Navigate button
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () {
                      if (selectedRoom != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => RoomSelectionScreen(
                                  destination: selectedRoom!,
                                  isVoiceEnabled: isVoiceEnabled,
                                ),
                          ),
                        );
                      }
                    },
                  ),
                ),

                const SizedBox(width: 12),

                // Settings button
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.settings, color: Colors.black),
                    onPressed: () async {
                      final result = await showModalBottomSheet<bool>(
                        context: context,
                        builder:
                            (_) => VoiceToggleSheet(
                              isVoiceEnabled: isVoiceEnabled,
                            ),
                      );

                      if (result != null) {
                        setState(() {
                          isVoiceEnabled = result;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
