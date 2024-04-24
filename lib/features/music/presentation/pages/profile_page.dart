import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.orange,
      ),
      body: const Center(
        child: Text("Profile information goes here",
            style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
