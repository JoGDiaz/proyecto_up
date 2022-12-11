// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class UserDevice extends StatefulWidget {
  const UserDevice({super.key});

  @override
  State<UserDevice> createState() => _UserDeviceState();
}

class _UserDeviceState extends State<UserDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(173, 51, 51, 1),
        elevation: 0,
        title: Center(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Mis',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color.fromRGBO(218, 218, 218, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Dispositivos',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  //añadir
                  Container(
                    padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(218, 218, 218, 1),
                        shape: BoxShape.circle),
                    child: Icon(
                      Icons.add,
                      color: Color.fromRGBO(0, 51, 102, 1),
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
