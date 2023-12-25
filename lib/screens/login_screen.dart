import 'package:flutter/material.dart';
import 'package:iosity/widgets/login/login_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: AuthBackground()
    );
  }
}