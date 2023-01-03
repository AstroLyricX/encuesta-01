import 'package:encuesta_app/screens/contents/input_datos_economicos.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class InputDatosPersonalesScreen extends StatelessWidget {
  const InputDatosPersonalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, dynamic> formValues = {
      'nombres_apellidos': 'Ever Ronaldo Condori Alanoca',
      'num_dni': 84568910,
      'region': 'Puno',
      'provincia': 'San Román',
      'destrito': 'Juliaca',
      'nivel_educacion': 'Superior',
      'genero': 'Masculino',
      'edad': 30,
      'cantidad_hijos': 2,
      'cuantos_estudian': 2,
      'mano_obra': 'Directa'
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Personales master'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            child: Column(
              key: myFormKey,
              children: [
                CustomInputField(
                  
                  labelText: 'Nombres y Apellidos',
                  hintText: 'Nombre y apellido del usuario',
                  keyboardType: TextInputType.text,
                  formProperty: 'nombres_apellidos',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'N° DNI',
                  hintText: 'N° de DNI del usuario',
                  keyboardType: TextInputType.number,
                  formProperty: 'num_dni',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Región',
                  hintText: 'Región del usuario',
                  keyboardType: TextInputType.text,
                  formProperty: 'region',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Provincia',
                  hintText: 'Provincia del usuario',
                  keyboardType: TextInputType.text,
                  formProperty: 'provincia',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Distrito',
                  hintText: 'Distrito del usuario',
                  keyboardType: TextInputType.text,
                  formProperty: 'destrito',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Nivel de Educación',
                  hintText: 'Nivel de Educación del usuario',
                  keyboardType: TextInputType.text,
                  formProperty: 'nivel_educacion',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),

                // CustomInputField(
                //   labelText: 'Genero',
                //   hintText: 'Genero del usuario',
                //   keyboardType: TextInputType.text,
                //   formProperty: 'genero',
                //   formValues: formValues,
                //   // suffixIcon: Icon(Icons.assignment_ind_outlined),
                // ),

                const Text('Genero', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),),
                DropdownButtonFormField<String>(
                  // value: 'Genero',
                  items: const [
                    DropdownMenuItem(
                        value: 'Masculino', child: Text('Masculino')),
                    DropdownMenuItem(
                        value: 'Femenino', child: Text('Femenino')),
                  ],
                  onChanged: (value) {
                    // print(value);
                    formValues['genero'] = value ?? 'Nan';
                  },
                ),

                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Edad',
                  hintText: 'Edad del usuario',
                  keyboardType: TextInputType.number,
                  formProperty: 'edad',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Cantidad de hijos',
                  hintText: 'Cantidad de hijos del usuario',
                  keyboardType: TextInputType.number,
                  formProperty: 'cantidad_hijos',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Cuantos estudian',
                  hintText: 'Cuantos hijos del usuario estudian',
                  keyboardType: TextInputType.number,
                  formProperty: 'cuantos_estudian',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 10),
                CustomInputField(
                  labelText: 'Mano de obra',
                  hintText: 'Mano de obra del usuario',
                  keyboardType: TextInputType.text,
                  formProperty: 'mano_obra',
                  formValues: formValues,
                  // suffixIcon: Icon(Icons.assignment_ind_outlined),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Siguiente'))),
                  onPressed: () {
                    // FocusScope.of(context).requestFocus(FocusNode());
                    FocusManager.instance.primaryFocus?.unfocus();

                    // if (!myFormKey.currentState!.validate()) {
                    //   print('Formulario no valido');
                    //   return;
                    // }

                    Navigator.push(context, MaterialPageRoute(builder: (context) => const InputDatosEconomicosScreen()));
                    print(formValues);
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
