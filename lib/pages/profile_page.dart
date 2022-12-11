import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserProfile> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(173, 51, 51, 1),
        elevation: 0,
        title: Center(
          child: Text(
            'Perfil',
            style: TextStyle(fontSize: 20),
          ),
        ),
        actions: [
          GestureDetector(onTap: () {}, child: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Color.fromARGB(255, 255, 255, 255),
              child: Text(
                'Cerrar Sesión',
              ),
            )
          ],
        ),
      ),
    );
  }
}
