import 'package:flutter/material.dart';

class SetlistsPage extends StatelessWidget {
  const SetlistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setlists', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child:
            Text("Setlists content goes here", style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
