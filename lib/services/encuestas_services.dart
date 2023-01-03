import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:encuesta_app/models/models.dart';

class EncuestasServices extends ChangeNotifier {
  final String _baseUrl = 'flutter-varios-bc9d3-default-rtdb.firebaseio.com';
  final List<Encuesta> encuestas = [];
  bool isLoading = true;

  EncuestasServices() {
    loadEncuestas();
  }

  Future loadEncuestas() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, 'encuestas.json');
    final resp = await http.get(url);
    // <String, dynamic>
    final Map encuestasMap = json.decode(resp.body);

    encuestasMap.forEach((key, value) {
      final tempEncuesta = Encuesta.fromMap(value);
      tempEncuesta.id = key;
      encuestas.add(tempEncuesta);
    });

    // print(encuestas[1].nombreApellido);

    isLoading = false;
    notifyListeners();
    // print(encuestas[0].dni);

    return encuestas;

  }


}

