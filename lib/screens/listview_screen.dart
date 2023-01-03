import 'package:flutter/material.dart';

class ListviewScreen extends StatelessWidget {

  final options = const['Estudio Socioeconómico Productivo','Datos personales', 'Datos economicas', 'Piso Forrajero', 'Acceso al Riego',  'Infraestructura Agropecuaria', 'Inventario de Maquinarias, Equipos y Herramientas', 'Acceso a Financiamiento',  'Financiamiento de Proyectos y/o Plan de Negocio', 'Características del Ganado Vacuno',  'Categorías de Ganado Ovino',  'Animales Menores',  'Condiciones de Ordeño', 'Tipo de Reproducción', 'Capacitación', 'Opinión del Productores'];
   
  const ListviewScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Encuesta App'),
      ),
      body: ListView.separated(
        itemBuilder: ((context, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.green,),
          onTap: () {
            Navigator.pushNamed(context, 'datos_personales');
          },
        )), 
        separatorBuilder: (_, __) => const Divider(), 
        itemCount: options.length),
    );
  }
}