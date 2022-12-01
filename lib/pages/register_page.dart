// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const RegisterPage({
    Key? key,
    required this.showLoginPage,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //controlador de texto
  final email_Controller = TextEditingController();
  final password_Controller = TextEditingController();
  final confirmpassword_Controller = TextEditingController();

  @override
  void dispose() {
    email_Controller.dispose();
    password_Controller.dispose();
    confirmpassword_Controller.dispose();
    super.dispose();
  }

  //cerrar sesion
  Future cerrarSesion() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email_Controller.text.trim(),
        password: password_Controller.text.trim(),
      );
    }
  }

  bool passwordConfirmed() {
    if (password_Controller.text.trim() ==
        confirmpassword_Controller.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(173, 51, 51, 1),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              //Name app
              Text(
                'IOT UP',
                style: GoogleFonts.wallpoet(
                  color: Color.fromRGBO(218, 218, 218, 1),
                  fontSize: 60,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Crea tu ID',
                style: GoogleFonts.oswald(
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 30),

              //Correo
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: email_Controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(128, 128, 128, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 51, 102, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Email@',
                    fillColor: Color.fromRGBO(218, 218, 218, 1),
                    filled: true,
                  ),
                ),
              ),

              SizedBox(height: 10),
              //Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: password_Controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(128, 128, 128, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 51, 102, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Password',
                    fillColor: Color.fromRGBO(218, 218, 218, 1),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              //confirmar Password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: confirmpassword_Controller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(128, 128, 128, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color.fromRGBO(0, 51, 102, 1)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Confirm Password',
                    fillColor: Color.fromRGBO(218, 218, 218, 1),
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 10),
              //Registro
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: cerrarSesion,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.blue[900],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Registrarse',
                        style: TextStyle(
                          color: Color.fromRGBO(218, 218, 218, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 18),
              //Recordar
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Soy Miembro!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
