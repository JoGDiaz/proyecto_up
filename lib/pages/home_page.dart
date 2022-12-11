// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_up/pages/device_page.dart';
import 'package:proyecto_up/pages/home.dart';
import 'package:proyecto_up/pages/profile_page.dart';
//import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //final user = FirebaseAuth.instance.currentUser!;
  int selected_Index = 0;

  void navigate_ButtonBar(int index) {
    setState(() {
      selected_Index = index;
    });
  }

  final List<Widget> pages_ = [
    UserHome(),
    UserDevice(),
    UserProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      body: pages_[selected_Index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected_Index,
        selectedItemColor: Color.fromRGBO(173, 51, 51, 1),
        unselectedItemColor: Color.fromRGBO(218, 218, 218, 1),
        onTap: navigate_ButtonBar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(0, 51, 102, 1),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.lightbulb), label: 'Dispositivo'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
    return scaffold;
  }
}
