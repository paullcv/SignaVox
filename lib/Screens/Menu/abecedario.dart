// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LenguajeSenasView extends StatelessWidget {
  final List<String> letrasSenas = [
    "assets/abecedario/a.jpeg",
    "assets/abecedario/b.jpeg",
    "assets/abecedario/c.jpeg",
    "assets/abecedario/d.jpeg",
    "assets/abecedario/e.jpeg",
    "assets/abecedario/f.jpeg",
    "assets/abecedario/g.jpeg",
    "assets/abecedario/h.jpeg",
    "assets/abecedario/i.jpeg",
    "assets/abecedario/j.jpeg",
    "assets/abecedario/k.jpeg",
    "assets/abecedario/l.jpeg",
    "assets/abecedario/ll.jpeg",
    "assets/abecedario/m.jpeg",
    "assets/abecedario/n.jpeg",
    "assets/abecedario/n1.jpeg",
    "assets/abecedario/o.jpeg",
    "assets/abecedario/p.jpeg",
    "assets/abecedario/q.jpeg",
    "assets/abecedario/r.jpeg",
    "assets/abecedario/s.jpeg",
    "assets/abecedario/t.jpeg",
    "assets/abecedario/u.jpeg",
    "assets/abecedario/v.jpeg",
    "assets/abecedario/w.jpeg",
    "assets/abecedario/x.jpeg",
    "assets/abecedario/y.jpeg",
    "assets/abecedario/z.jpeg",
  ];

  LenguajeSenasView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lenguaje de Señas en Bolivia"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: letrasSenas
                .map(
                  (letra) => Padding(
                    padding:
                        const EdgeInsets.all(8.0), // Espacio entre imágenes
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          15.0), // Ajusta el radio según tus necesidades
                      child: Image.asset(
                        letra,
                        width: MediaQuery.of(context).size.width * 0.5,
                        fit: BoxFit.contain,
                      ),
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
