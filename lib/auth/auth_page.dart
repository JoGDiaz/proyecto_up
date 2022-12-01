import 'package:flutter/material.dart';
import 'package:proyecto_up/pages/login_page.dart';
import 'package:proyecto_up/pages/register_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //Muestra el logeo

  bool showLoginPage = true;
  void toggleScreens() {
    //alterna las pantallas
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens);
    } else {
      return RegisterPage(showLoginPage: toggleScreens);
    }
  }
}
