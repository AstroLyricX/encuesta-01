
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:encuesta_app/widgets/widgets.dart';
import 'package:encuesta_app/screens/screens.dart';
import 'package:encuesta_app/services/services.dart';




class EstudioSocioeconomicoScreen extends StatelessWidget {
  const EstudioSocioeconomicoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    final encuentasService = Provider.of<EncuestasServices>(context);

    if (encuentasService.isLoading) return const LoadingScreen();

   

    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudio Socioeconómico',),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 75),
        child: ListView.builder(
          itemCount: encuentasService.encuestas.length,
          itemBuilder: (context, index) =>  EncuestaList(
            encuest: encuentasService.encuestas[index],
            fullName: 'hello',
            dni: 0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const InputDatosPersonalesScreen()));
        },
      ),
    );
  }
}
