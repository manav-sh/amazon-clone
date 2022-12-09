import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Login Screen'),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                context.go('/login/otp');
              },
              child: const Text('Get OTP'))
        ],
      )),
    );
  }
}
