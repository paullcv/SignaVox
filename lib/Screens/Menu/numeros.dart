// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class NumerosView extends StatelessWidget {
  final List<String> numeros = [
    "assets/numeros/0.jpeg",
    "assets/numeros/1.jpeg",
    "assets/numeros/2.jpeg",
    "assets/numeros/3.jpeg",
    "assets/numeros/4.jpeg",
    "assets/numeros/5.jpeg",
    "assets/numeros/6.jpeg",
    "assets/numeros/7.jpeg",
    "assets/numeros/8.jpeg",
    "assets/numeros/9.jpeg",
    "assets/numeros/10.jpeg"
  ];

  NumerosView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Números"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: numeros
                .map(
                  (numero) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      numero,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
