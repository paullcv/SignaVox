// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final String userName; // Nombre del usuario
  final String userEmail; // Correo del usuario
  final String userPhotoUrl; // URL de la foto de perfil
  final VoidCallback onExit;

  const NavBar({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userPhotoUrl,
    required this.onExit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              userName,
              style: TextStyle(color: Colors.white),
            ), // Nombre del usuario
            accountEmail: Text(userEmail), // Correo del usuario
            currentAccountPicture: CircleAvatar(
              // Muestra la foto de perfil del usuario
              backgroundImage:
                  NetworkImage(userPhotoUrl), // URL de la foto de perfil
            ),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              image: const DecorationImage(
                image: AssetImage('assets/images/fondonavbar.avif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Resto de los elementos del Drawer
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Perfil"),
          ),
          ListTile(
            leading: Icon(Icons.abc),
            title: Text("Mis traducciones"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configuracion"),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Cerrar Sesión"),
            onTap:
                onExit, // Llama a la función de cierre de sesión proporcionada desde Inicio
          ),
        ],
      ),
    );
  }
}
