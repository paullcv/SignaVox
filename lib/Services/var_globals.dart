import 'package:flutter/material.dart';

//Opcion 1 para usar el backend de la api
//const String baseURL = "http://127.0.0.1:8000/api/"; //emulator localhost
// Opcion 2 para usar el backend de la api, cambiar por su ip
const String baseURL = "http://192.168.100.9/SignaVoxB/public/api/"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: const Duration(seconds: 2),
  ));
}

messageSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      text,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    duration: const Duration(seconds: 2),
  ));
}
