import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        height: double.infinity,
        color: Colors.red,
        child: const Text('SettingsScreen'),
      ),
    );
  }
}