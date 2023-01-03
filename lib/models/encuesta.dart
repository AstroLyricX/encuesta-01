// To parse this JSON data, do
//
//     final encuesta = encuestaFromMap(jsonString);

import 'dart:convert';

class Encuesta {
    Encuesta({
        required this.cantidadHijos,
        required this.cuantosEstudian,
        required this.distrito,
        required this.dni,
        required this.edad,
        required this.genero,
        required this.manoObra,
        required this.nivelEducacion,
        required this.nombreApellido,
        required this.provincia,
        required this.region,
    });

    int cantidadHijos;
    int cuantosEstudian;
    String distrito;
    int dni;
    int edad;
    String genero;
    String manoObra;
    String nivelEducacion;
    String nombreApellido;
    String provincia;
    String region;
    String? id;

    factory Encuesta.fromJson(String str) => Encuesta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Encuesta.fromMap(Map<String, dynamic> json) => Encuesta(
        cantidadHijos: json["cantidadHijos"],
        cuantosEstudian: json["cuantosEstudian"],
        distrito: json["distrito"],
        dni: json["dni"],
        edad: json["edad"],
        genero: json["genero"],
        manoObra: json["manoObra"],
        nivelEducacion: json["nivelEducacion"],
        nombreApellido: json["nombreApellido"],
        provincia: json["provincia"],
        region: json["region"],
    );

    Map<String, dynamic> toMap() => {
        "cantidadHijos": cantidadHijos,
        "cuantosEstudian": cuantosEstudian,
        "distrito": distrito,
        "dni": dni,
        "edad": edad,
        "genero": genero,
        "manoObra": manoObra,
        "nivelEducacion": nivelEducacion,
        "nombreApellido": nombreApellido,
        "provincia": provincia,
        "region": region,
    };
}
