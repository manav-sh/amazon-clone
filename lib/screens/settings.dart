import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Settings Screen'),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/login');
              },
              child: const Text('Log Out'))
        ],
      )),
    );
  }
}
