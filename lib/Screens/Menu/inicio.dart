// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signavox/Screens/Menu/abecedario.dart';
import 'package:signavox/Screens/Menu/numeros.dart';
import 'package:signavox/Widgets/NavBar.dart';

import '../../HomePage.dart';

class Inicio extends StatelessWidget {
  final String userName; // Nombre de usuario
  final String userEmail; // Correo electrónico del usuario
  final String userPhotoUrl; // URL de la foto de perfil

  Inicio({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.userPhotoUrl,
  }) : super(key: key);

  Future<void> _confirmLogout(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cerrar Sesión'),
          content: Text('¿Estás seguro de que deseas cerrar sesión?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // Realiza las acciones necesarias para cerrar sesión
                // Por ejemplo, limpiar el estado de autenticación

                // Luego, navega al HomePage y elimina todas las rutas anteriores
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                      builder: (context) =>
                          HomePage()), // Reemplaza con la pantalla de inicio
                  (Route<dynamic> route) =>
                      false, // Elimina todas las rutas anteriores
                );
              },
              child: Text('Cerrar Sesión'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void onExit(BuildContext context) async {
      final prefs = await SharedPreferences.getInstance();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Cerrar Sesión'),
            content: Text('¿Estás seguro de que deseas cerrar sesión?'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cierra el cuadro de diálogo
                },
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () async {
                  await prefs.remove('authToken'); // Elimina el token
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) =>
                          HomePage(), // Navega a la página de inicio
                    ),
                  );
                },
                child: Text('Cerrar Sesión'),
              ),
            ],
          );
        },
      );
    }

    return WillPopScope(
      onWillPop: () async {
        // Impide que el usuario vuelva atrás en la pantalla de Inicio
        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Traductor de Lenguaje de Señas')),
        drawer: NavBar(
          userEmail: userEmail,
          onExit: () {
            // Muestra el cuadro de diálogo de confirmación al cerrar sesión
            // _confirmLogout(context);
            onExit(context);
          },
          userName: userName,
          userPhotoUrl: userPhotoUrl,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGridItem(context, 'Traducir', Icons.translate, () {
                  // Agrega la navegación a la pantalla de Traducir aquí
                }),
                _buildGridItem(context, 'Abecedario', Icons.abc, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => LenguajeSenasView(),
                    ),
                  );
                }),
                _buildGridItem(context, 'Numeros', Icons.numbers, () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => NumerosView(),
                    ),
                  );
                }),
                _buildGridItem(context, 'Historial', Icons.history, () {
                  // Agrega la navegación a la pantalla de Historial aquí
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, String title, IconData iconData,
      Function() onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 170,
        padding: EdgeInsets.all(16.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 48.0, // Ajusta el tamaño del icono según tus necesidades
              color: Colors.blue, // Color del icono
            ),
            SizedBox(height: 10.0), // Espacio entre el icono y el título
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
