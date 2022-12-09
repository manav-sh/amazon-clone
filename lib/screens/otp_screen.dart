import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key, required this.path});
  final String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('OTP Screen \nPath = $path'),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text('Login'))
        ],
      )),
    );
  }
}
