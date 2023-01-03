import 'package:flutter/material.dart';

import 'package:encuesta_app/models/models.dart';

class EncuestaList extends StatelessWidget {
  final Encuesta encuest;


  final String fullName;
  final int dni;



  const EncuestaList({
    super.key,
    required this.encuest, 
    required this.fullName, 
    required this.dni, 
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.2),
      child: Card(
        elevation: 3,
        child: ListTile(
          title:  Text('Nombre y Apellido: $fullName'),
          subtitle:  Text('Número de DNI: $dni'),
          trailing: Wrap(
            spacing: 12,
            children: [
              Icon(
                Icons.edit_calendar_sharp,
                color: Colors.amber[300],
              ),
              Icon(
                Icons.delete,
                color: Colors.red[300],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
