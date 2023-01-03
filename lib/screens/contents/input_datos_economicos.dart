import 'package:flutter/material.dart';

import 'package:encuesta_app/screens/screens.dart';

class InputDatosEconomicosScreen extends StatefulWidget {
  const InputDatosEconomicosScreen({Key? key}) : super(key: key);

  @override
  State<InputDatosEconomicosScreen> createState() =>
      _InputDatosEconomicosScreenState();
}

class _InputDatosEconomicosScreenState
    extends State<InputDatosEconomicosScreen> {
  bool agropecuaria = false;
  bool construccion = false;
  bool transporteComunicaciones = false;
  bool mineria = false;
  bool comercio = false;
  bool otros = false;

  bool minimo = false;
  bool normal = false;
  bool maximo = false;

  bool agua = false;
  bool luz = false;
  bool internet = false;

  bool materialNoble = false;
  bool prefabricados = false;
  bool hormigonCementoLadrillos = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Económicos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            child: Column(
              children: [
                const Text('Actividad Economica:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
          
                // CheckboxListTile(title: const Text('Agropecuaria'), value: agropecuaria, onChanged: (value) => setState(() {
                //   agropecuaria = value ?? true;
                // }),),
          
                SwitchListTile.adaptive(
                  title: const Text('Agropecuaria'),
                  value: agropecuaria,
                  onChanged: (value) => setState(() {
                    agropecuaria = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Construcción'),
                  value: construccion,
                  onChanged: (value) => setState(() {
                    construccion = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Transporte y comunicaciones'),
                  value: transporteComunicaciones,
                  onChanged: (value) => setState(() {
                    transporteComunicaciones = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Minería'),
                  value: mineria,
                  onChanged: (value) => setState(() {
                    mineria = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Comercio'),
                  value: comercio,
                  onChanged: (value) => setState(() {
                    comercio = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Otros'),
                  value: otros,
                  onChanged: (value) => setState(() {
                    otros = value;
                  }),
                ),
          
                const SizedBox(height: 10),
          
                const Text('Ingreso Total:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                SwitchListTile.adaptive(
                  title: const Text('0-160'),
                  value: minimo,
                  onChanged: (value) => setState(() {
                    minimo = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('164'),
                  value: normal,
                  onChanged: (value) => setState(() {
                    normal = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Mayor a 265'),
                  value: maximo,
                  onChanged: (value) => setState(() {
                    maximo = value;
                  }),
                ),
          
                const SizedBox(height: 10),
          
                const Text('Servicios Básicos:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                SwitchListTile.adaptive(
                  title: const Text('Agua'),
                  value: agua,
                  onChanged: (value) => setState(() {
                    agua = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Luz'),
                  value: luz,
                  onChanged: (value) => setState(() {
                    luz = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Internet'),
                  value: internet,
                  onChanged: (value) => setState(() {
                    internet = value;
                  }),
                ),
          
                const SizedBox(height: 10),
          
                const Text('Tipo de Material de Construcción de La Vivienda:',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16)),
                SwitchListTile.adaptive(
                  title: const Text('Material noble'),
                  value: materialNoble,
                  onChanged: (value) => setState(() {
                    materialNoble = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Prefabricados'),
                  value: prefabricados,
                  onChanged: (value) => setState(() {
                    prefabricados = value;
                  }),
                ),
                SwitchListTile.adaptive(
                  title: const Text('Hormigón,cemento y ladrillos'),
                  value: hormigonCementoLadrillos,
                  onChanged: (value) => setState(() {
                    hormigonCementoLadrillos = value;
                  }),
                ),
          
                const SizedBox(height: 10),
          
                ElevatedButton(
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Siguiente'))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PisoForrajeroScreen()));
                  },
                ),
          
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
