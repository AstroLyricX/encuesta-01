// ignore_for_file: file_names
import 'dart:io';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:encuesta_app/screens/screens.dart';

import '../../blocs/blocs.dart';

class StepperScreen extends StatefulWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  State<StepperScreen> createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
//*...........
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
    // locationBloc.getCurrentPosition();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  //*..............

  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;

  //? camere
  File? newPictureFile;
  //?..........

  TextEditingController field = TextEditingController();
  String pasteValue = '';

  //!.....................
  TextEditingController fieldLatitude = TextEditingController();
  TextEditingController fieldLongitude = TextEditingController();
  String latitudePaste = '';
  String longitudePaste = '';
  //!.....................

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudio Socioeconómico'),
        centerTitle: true,
        // automaticallyImplyLeading: false,
      ),
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                  child: Stepper(
                type: stepperType,
                physics: const ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (value) => tapped(value),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: [
                  //! 1 Datos personales
                  Step(
                    title: const Text('Datos personales'),
                    content: Column(
                      children: [
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Nombres y Apellidos'),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'N° DNI',
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Región',
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Provincia',
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Distrito',
                          ),
                        ),
                        const SizedBox(height: 7),
                        //TODO: cambiar por un select
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Nivel de Educación',
                          ),
                        ),
                        const SizedBox(height: 7),
                        //TODO: cambiar por un select
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Genero',
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Edad',
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Cantidad de Hijos',
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Cuantos Estudian',
                          ),
                        ),
                        const SizedBox(height: 7),
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: 'Mano de Obra',
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //! 2 Datos economicas
                  Step(
                    title: const Text('Datos economicas'),
                    content: Column(
                      children: [
                        const Text('Actividad económica',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                        //?update-01
                        CheckboxListTile(
                          title: const Text('Agropecuaria'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        CheckboxListTile(
                          title: const Text('Construcción'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        CheckboxListTile(
                          title: const Text('Transporte y comunicaciones'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        CheckboxListTile(
                          title: const Text('Minería'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        CheckboxListTile(
                          title: const Text('Comercio'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        CheckboxListTile(
                          title: const Text('Otros'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        //? update-end
                        const SizedBox(height: 12),
                        const Text('Ingreso Total',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                        DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                                value: '0 a 160', child: Text('0-160')),
                            DropdownMenuItem(
                                value: '164 a 264', child: Text('164 - 264')),
                            DropdownMenuItem(
                                value: 'Mayor a 265',
                                child: Text('Mayor a 265')),
                          ],
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 12),
                        const Text('Servicios Básicos',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                        CheckboxListTile(
                          title: const Text('Agua'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        CheckboxListTile(
                          title: const Text('Luz'),
                          value: true,
                          onChanged: (value) => setState(() {
                            value = false;
                          }),
                        ),
                        CheckboxListTile(
                          title: const Text('Internet'),
                          value: false,
                          onChanged: (value) => setState(() {
                            value = true;
                          }),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                            'Tipo de Material de Construcción de la Vivienda',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                        DropdownButtonFormField(
                          items: const [
                            DropdownMenuItem(
                                value: 'Material noble',
                                child: Text('Material noble')),
                            DropdownMenuItem(
                                value: 'Prefabricados',
                                child: Text('Prefabricados')),
                            DropdownMenuItem(
                                value: 'Hormigon, cemento y ladrillos',
                                child: Text('Hormigon, cemento y ladrillos')),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //! 3 Piso Forrajero
                  Step(
                    title: const Text('Piso Forrajero'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('2.1. Has bajo riego')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('2.2. Has en secano')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('2.3. propiedad o arrendadas')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('2.4. Has de alfalfa')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('2.5. Has de  rye grass')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child:
                                        Text('2.6.Has de  avena forrajera ')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child:
                                        Text('2.7. Has de cebada forrajera')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child:
                                        Text('2.8. has de  pastos naturales?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('2.9. total de hectareas')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene capacidad de incrementar la superficie instalada?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Cuantos?'),
                                )),
                                //? update-0
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '2.10 ¿Por qué razon decidio sembrar los cultivos que  tiene en sus tierras?')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: '¿Por qué?'),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceAround,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child:
                                        Text('2.11. Otros recursos agricolas')),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Papa',
                                      hintText: '¿Cuántas has?'),
                                )),
                                const SizedBox(height: 7),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Quinua',
                                      hintText: '¿Cuántas has?'),
                                )),
                                const SizedBox(height: 7),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Cañihua',
                                      hintText: '¿Cuántas has?'),
                                )),
                                const SizedBox(height: 7),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Habas',
                                      hintText: '¿Cuántas has?'),
                                )),
                                const SizedBox(height: 7),
                                SizedBox(
                                    child: TextFormField(
                                  decoration: const InputDecoration(
                                      labelText: 'Otros',
                                      hintText: '¿Cuántas has?'),
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 3
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  //! 4 Acceso al Riego
                  Step(
                      title: const Text('Acceso al Riego '),
                      content: Column(
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text('3.1. ¿Tiene riego?')),
                                  DropdownButtonFormField(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Si', child: Text('Si')),
                                      DropdownMenuItem(
                                          value: 'No', child: Text('No')),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text(
                                          '3.2. ¿Cuál es el tipo de riego que utiliza?')),
                                  DropdownButtonFormField(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Riego por gravedad',
                                          child: Text('Riego por gravedad')),
                                      DropdownMenuItem(
                                          value: 'Riego por goteo',
                                          child: Text('Riego por goteo')),
                                      DropdownMenuItem(
                                          value: 'Riego por aspersión',
                                          child: Text('Riego por aspersión')),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text(
                                          '3.3. ¿Cual es la fuente de agua?')),
                                  DropdownButtonFormField(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Pozo', child: Text('Pozo')),
                                      DropdownMenuItem(
                                          value: 'Rio', child: Text('Rio')),
                                      DropdownMenuItem(
                                          value: 'Lago o laguna',
                                          child: Text('Lago o laguna')),
                                      DropdownMenuItem(
                                          value: 'Pozo tubular',
                                          child: Text('Pozo tubular')),
                                      DropdownMenuItem(
                                          value: 'Manantial',
                                          child: Text('Manantial')),
                                      DropdownMenuItem(
                                          value: 'Reservorio / presa',
                                          child: Text('Reservorio / presa')),
                                      DropdownMenuItem(
                                          value: 'Otros', child: Text('Otros'))
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text(
                                          '3.4. ¿Considera usted que el agua de riego esta contaminada?')),
                                  DropdownButtonFormField(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Si', child: Text('Si')),
                                      DropdownMenuItem(
                                          value: 'No', child: Text('No')),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                  CheckboxListTile(
                                    title: const Text(
                                        'Contaminada por relaves mineros'),
                                    value: true,
                                    onChanged: (value) => setState(() {
                                      value = true;
                                    }),
                                  ),
                                  CheckboxListTile(
                                    title: const Text(
                                        'Contaminada por desagues industriales'),
                                    value: false,
                                    onChanged: (value) => setState(() {
                                      value = true;
                                    }),
                                  ),
                                  CheckboxListTile(
                                    title: const Text(
                                        'Contaminada por otras sustancias'),
                                    value: false,
                                    onChanged: (value) => setState(() {
                                      value = true;
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text(
                                          '¿Pertenece usted a alguna comisión de regantes?')),
                                  DropdownButtonFormField(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Si', child: Text('Si')),
                                      DropdownMenuItem(
                                          value: 'No', child: Text('No')),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(height: 7),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: '¿Cuál?',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  //! 5 Infraestructura Agropecuaria
                  Step(
                    title: const Text('Infraestructura Agropecuaria'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.1. Cobertizos'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.2. Miniestablos'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.3. Comederos'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.4. Bebederos'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.5. Ternejare'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.6. Sala de ordeño'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title:
                                      const Text('4.7. Plataforma de ordeño'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.8. invernadero'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.9. Galpon de cuyes'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.10. Silos para forraje'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.11. Cerco alambrado'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.12. Cerco electrico'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.13. Cerco de tapial '),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.14. Cerco de piedra'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('4.15. Establo lechero'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //TODO: bnt
                  ),
                  //! 6 Inventario de maquinarias, equipos y herramientas
                  Step(
                    title: const Text(
                        'Inventario de maquinarias, equipos y herramientas'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('5.1. ¿Tractor agricola?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('5.2. ¿Empacadora?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('5.3. ¿Ordeñadora?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title:
                                      const Text('5.4. ¿Molinera de forraje?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('5.5. ¿Motoguadaña?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('5.6. ¿Motocarga?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('5.7. ¿Porongo?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title:
                                      const Text('5.8. ¿Picadora de forraje?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                CheckboxListTile(
                                  title: const Text('¿Otro?'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuantos?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //TODO: btn
                  ),
                  //! 7 Acceso a financiamiento
                  Step(
                    title: const Text('Acceso a financiamiento'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Tiene usted acceso a creditos para el financiamiento de su unidad productiva?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Si', child: Text('Si')),
                                    DropdownMenuItem(
                                        value: 'No', child: Text('No')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('Indique el nombre')),
                                //? update start
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Cajas municipales'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Caja rural'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Cooperativa de Ahorro y Credito'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Banco'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Agrobanco'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('ONG'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Otros fondos'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                //? update - end
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child:
                                        Text('¿Para que solicito el credito?')),
                                //? update start
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Adquisicion de insumos'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title:
                                      const Text('Adquisicion de maquinarias'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Adquisicion de ganado vacuno'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title:
                                      const Text('Para pagar otros creditos'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Otros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                //? update end
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // TODO: btn
                  ),
                  //! 8 Financiamiento de proyectos y/o plan de negocio
                  Step(
                    title: const Text(
                        'Financiamiento de proyectos y/o plan de negocio'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Usted  y su organización  han tenido  acceso a financiamiento de su plan de negocios o proyecto por?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Si', child: Text('Si')),
                                    DropdownMenuItem(
                                        value: 'No', child: Text('No')),
                                  ],
                                  onChanged: (value) {},
                                ),
                                const SizedBox(height: 10),
                                //? update start
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Procompite nacional'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Procompite Gobierno Regional'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Procompite Gobieno Municipal'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Fondoempleo'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title:
                                      const Text('Cooperacion internacional'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Agroideas'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Empresa minera'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Foncodes'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Otros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                //? update end
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //TODO: btn
                  ),
                  //! 9 características del ganado vacuno
                  Step(
                    title: const Text('Características del ganado vacuno'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child:
                                        Text('Terneros(as)(menores a 1 año)')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Brown Swiss',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Holstein',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    initialValue: '${9}',
                                    decoration: const InputDecoration(
                                      labelText: 'Toltal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child:
                                        Text('Vaquillas (entre 1 a 2 años)')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Brown Swiss',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Holstein',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Toltal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        'Vaquillonas (mayor 2 años / primer parto)')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Brown Swiss',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Holstein',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Toltal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        'Toros (mayor a dos años sin castrar)')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Brown Swiss',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Holstein',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Toltal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('Bueyes (castrados)')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Brown Swiss',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Holstein',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Toltal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('Toretes de engorde')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Brown Swiss',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Holstein',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Toltal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('Vacas en producción')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Brown Swiss',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Holstein',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Toltal',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //? add new card - 01
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Cuántos litros por dia produce la leche?')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Epoca seca',
                                        hintText: 'L/Dia'),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Epoca de lluvias',
                                        hintText: 'L/Dia'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Cuántas vacas tiene en produción?')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Epoca seca',
                                        hintText: 'Cbz'),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                        labelText: 'Epoca de lluvias',
                                        hintText: 'Cbz'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Cuál es el destino de la mayor parte de la produción?')),
                                CheckboxListTile(
                                  title: const Text(
                                      'Venta de leche al público (mercado)'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles/L',
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text(
                                      'Venta de leche a plantas queseras'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles/L',
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text('Venta a leche gloria'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles/L',
                                  ),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Autoconsumo'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                  height: 10,
                                ),
                                CheckboxListTile(
                                  title: const Text('Auto insumo'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                  height: 10,
                                ),
                                CheckboxListTile(
                                  title: const Text('Venta de toros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                  height: 10,
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText:
                                        '¿Cuál es el nombre de la planta quesera?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //? add new card - end
                      ],
                    ),
                    //TODO: btn
                  ),

                  //! 10 categorias de ganado ovino
                  Step(
                    title: const Text('Categorias de ganado ovino'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Macho')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Corriedale',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Hampshire brown',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otras',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Hembra')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Corriedale',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Hampshire brown',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Criollo',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otra raza',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Otras',
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //? add new card - 02
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Cuál es el destino de la mayor parte de la produción?')),
                                CheckboxListTile(
                                  title:
                                      const Text('Venta al público (mercado)'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles',
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text('Venta a carniceros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles',
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text('otros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles',
                                  ),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Autoconsumo'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //? add new card - end
                      ],
                    ),
                    //TODO: btn
                  ),

                  //! 11 Animales menores
                  Step(
                    title: const Text('Animales menores'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('Pollos de engorde')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Gallinas')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Porcinos')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Llamas')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Alpacas')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Caprinos')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              // alignment: WrapAlignment.spaceBetween,
                              spacing: 8,
                              children: [
                                const Center(
                                    heightFactor: 2, child: Text('Cuyes')),
                                SizedBox(
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: 'Total',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //? add new card - 03
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Cuál es el destino de la mayor parte de la produción?')),
                                CheckboxListTile(
                                  title:
                                      const Text('Venta al público (mercado)'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles',
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text('Venta a carniceros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles',
                                  ),
                                ),
                                CheckboxListTile(
                                  title: const Text('otros'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: 'soles',
                                  ),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Autoconsumo'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                                const Divider(
                                  color: Colors.blueGrey,
                                ),
                                CheckboxListTile(
                                  title: const Text('Auto insumo'),
                                  value: true,
                                  onChanged: (value) => setState(() {
                                    value = true;
                                  }),
                                ),
                              ],
                            ),
                          ),
                        ),
                        //? add new card - end
                      ],
                    ),
                    //TODO: btn
                  ),

                  //! 12  condiciones de ordeño
                  Step(
                    title: const Text('condiciones de ordeño'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '9.1.¿ En su hato lechero, el ordeño realiza?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Manual', child: Text('Manual')),
                                    DropdownMenuItem(
                                        value: 'Ordeñadora Mecanica',
                                        child: Text('Ordeñadora Mecanica')),
                                    DropdownMenuItem(
                                        value: 'Mixto', child: Text('Mixto')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '9.2.¿En el ordeño, La leche es envasado?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Valde de plastico',
                                        child: Text('Valde de plastico')),
                                    DropdownMenuItem(
                                        value: 'Valde de aluminio',
                                        child: Text('Porongo  de aluminio')),
                                    DropdownMenuItem(
                                        value: 'Valde de acero inox',
                                        child: Text('Valde de acero inox')),
                                    DropdownMenuItem(
                                        value: 'Botella de plastico',
                                        child: Text('Botella de plastico')),
                                    DropdownMenuItem(
                                        value: 'Olla de acero',
                                        child: Text('Olla de acero')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '9.3. ¿Cuáles son las condiciones de almacenamiento de la leche?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Bajo sombra',
                                        child: Text('Bajo sombra')),
                                    DropdownMenuItem(
                                        value: 'Refrigeradora',
                                        child: Text('Refrigeradora')),
                                    DropdownMenuItem(
                                        value: 'Tanque de frio',
                                        child: Text('Tanque de frio')),
                                    DropdownMenuItem(
                                        value: 'Con agua y hielo',
                                        child: Text('Con agua y hielo')),
                                    DropdownMenuItem(
                                        value: 'Ollas enchaqueradas',
                                        child: Text('Ollas enchaqueradas')),
                                    DropdownMenuItem(
                                        value: 'Otro', child: Text('Otro')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //TODO: btn
                  ),

                  //! 13 Tipo de reproducción
                  Step(
                    title: const Text('Tipo de reproducción'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('Tipo de reproducción')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Monta natural ',
                                        child: Text('Monta natural ')),
                                    DropdownMenuItem(
                                        value: 'Iseminacion artificil',
                                        child: Text('Iseminacion artificil')),
                                    DropdownMenuItem(
                                        value: 'Transferencia de embriones',
                                        child:
                                            Text('Transferencia de embriones')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('¿Tipo de inseminador?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Importados',
                                        child: Text('Importados')),
                                    DropdownMenuItem(
                                        value: 'Nacional',
                                        child: Text('Nacional')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text('¿Quiénes inseminan?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'privados',
                                        child: Text('privados')),
                                    DropdownMenuItem(
                                        value: 'Publico',
                                        child: Text('Publico')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //TODO: btn
                  ),

                  //! 14 Capacitación
                  Step(
                    title: const Text('Capacitación'),
                    content: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        '¿Pertenece a alguna asociacion, comité o cooperativa?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'Si', child: Text('Si')),
                                    DropdownMenuItem(
                                        value: 'No', child: Text('No')),
                                  ],
                                  onChanged: (value) {},
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText: '¿Cuál?',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                TextFormField(
                                  decoration: const InputDecoration(
                                    labelText:
                                        '¿Cada cuanto tiempo se capacitan?',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: Wrap(
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                const Center(
                                    heightFactor: 2,
                                    child: Text(
                                        'En la cadena de valor de leche ¿ De que institucion recibe capacitacion/ asistencia tecnica?')),
                                DropdownButtonFormField(
                                  items: const [
                                    DropdownMenuItem(
                                        value: 'ONG', child: Text('ONG')),
                                    DropdownMenuItem(
                                        value: 'Empresa privada',
                                        child: Text('Empresa privada')),
                                    DropdownMenuItem(
                                        value: 'SENASA', child: Text('SENASA')),
                                    DropdownMenuItem(
                                        value: 'INIA', child: Text('INIA')),
                                    DropdownMenuItem(
                                        value: 'Agencia agraria',
                                        child: Text('Agencia agraria')),
                                    DropdownMenuItem(
                                        value: 'Empresa minera',
                                        child: Text('Empresa minera')),
                                    DropdownMenuItem(
                                        value: 'CARE', child: Text('CARE')),
                                    DropdownMenuItem(
                                        value: 'FONCODES',
                                        child: Text('FONCODES')),
                                    DropdownMenuItem(
                                        value: 'MINAGRI',
                                        child: Text('MINAGRI')),
                                    DropdownMenuItem(
                                        value: 'Siembra y selva exportadora',
                                        child: Text(
                                            'Siembra y selva exportadora')),
                                    DropdownMenuItem(
                                        value: 'Agrorural',
                                        child: Text('Agrorural')),
                                    DropdownMenuItem(
                                        value: 'PEBLT', child: Text('PEBLT')),
                                    DropdownMenuItem(
                                        value: 'Direccion regional agraria',
                                        child:
                                            Text('Direccion regional agraria')),
                                    DropdownMenuItem(
                                        value: 'Proyecto pradera',
                                        child: Text('Proyecto pradera')),
                                    DropdownMenuItem(
                                        value: 'Municipalidad',
                                        child: Text('Municipalidad')),
                                  ],
                                  onChanged: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    //TODO: btn
                  ),

                  //! 15 opinion del productor
                  Step(
                      title: const Text('Opinion del productor'),
                      content: Column(
                        children: [
                          const SizedBox(height: 10),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText:
                                  '¿Qué factores retrazan al productor agropecuario?',
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text(
                                          '¿Considera que es rentable la producion  la actividad agropecuaria?')),
                                  DropdownButtonFormField(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Si', child: Text('Si')),
                                      DropdownMenuItem(
                                          value: 'No', child: Text('No')),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: '¿Por qué?',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text(
                                          '¿Le gustaria que sus predesesores continuen con la actividad agropecuaria?')),
                                  DropdownButtonFormField(
                                    items: const [
                                      DropdownMenuItem(
                                          value: 'Si', child: Text('Si')),
                                      DropdownMenuItem(
                                          value: 'No', child: Text('No')),
                                    ],
                                    onChanged: (value) {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //? camera start
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text(
                                          'FOTO DE FIRMA Y HUELLA DEL PRODUCTOR')),
                                  Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40,
                                        color: Colors.blueGrey,
                                      ),
                                      onPressed: () async {
                                        final picker = new ImagePicker();
                                        final PickedFile? pickedFile =
                                            await picker.getImage(
                                                // source: ImageSource.camera,
                                                source: ImageSource.gallery,
                                                imageQuality: 100);

                                        if (pickedFile == null) {
                                          print('No seleccionó nada');
                                          return;
                                        }

                                        print(
                                            'Tenemos imagen ${pickedFile.path}');

                                        updateSelectedImg(pickedFile.path);
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const Center(
                                      heightFactor: 2,
                                      child: Text('FOTO DEL PRODUCTOR')),
                                  Center(
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.camera_alt_outlined,
                                        size: 40,
                                        color: Colors.blueGrey,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //? camera end
                          //? gps start
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                  alignment: WrapAlignment.spaceBetween,
                                  spacing: 10,
                                  children: const [
                                    Center(
                                      child: _Loading(),
                                      // child: _AccessButton(),
                                      // child: _EnableGpsMessage(),
                                    ),
                                  ]),
                            ),
                          ),
                          //? gps end
                          //? gps input start
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 5,
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              child: Wrap(
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 10,
                                children: [
                                  const SizedBox(height: 7),
                                  TextFormField(
                                    controller: fieldLatitude,
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                        labelText:
                                            'Latitud',
                                        prefixIcon: Icon(
                                            Icons.add_location_alt_outlined,
                                            color: Colors.black)),
                                    maxLines: 5,
                                    minLines: 1,
                                  ),
                                  const SizedBox(height: 10),
                                  TextFormField(
                                    controller: fieldLongitude,
                                    keyboardType: TextInputType.none,
                                    decoration: const InputDecoration(
                                        labelText:
                                            'Longitud',
                                        prefixIcon: Icon(
                                            Icons.add_location_outlined,
                                            color: Colors.black)),
                                    maxLines: 5,
                                    minLines: 1,
                                  ),
                                  Center(
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                      icon: const Icon(Icons.add_to_photos_outlined), 
                                      label: const Text('Insertar Ubicación GPS'),
                                      onPressed: () {
                                        FlutterClipboard.paste().then(
                                          (value) {
                                            setState(() {

                                              // RegExp exp = new RegExp(r"([a-zA-Z0-9]+)\s([a-zA-Z0-9]+)");

                                              // fieldLatitude.text = exp.firstMatch(value)!.group(1).toString();
                                              // latitudePaste = exp.firstMatch(value)!.group(1).toString();
                                              // fieldLongitude.text = exp.firstMatch(value)!.group(2).toString();
                                              // longitudePaste = exp.firstMatch(value)!.group(2).toString();

                                              List<String> values = value.split(",");

                                              fieldLatitude.text = values[0];
                                              latitudePaste = values[0];
                                              fieldLongitude.text = values[1];
                                              longitudePaste = values[1];
                                            });
                                          },
                                        );
                                      }, 
                                      ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          //? gps input end
                        ],
                      ))
                ],
              ))
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchStepsType,
        child: const Icon(Icons.save_outlined),
      ),
    );
  }

  tapped(int value) {
    setState(() {
      _currentStep = value;
    });
  }

  void continued() {
    _currentStep < 8 ? setState(() => _currentStep += 1) : null;
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void switchStepsType() {
    // setState(() => stepperType == StepperType.vertical ? stepperType = StepperType.horizontal : stepperType = StepperType.vertical);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  void updateSelectedImg(String path) {
    // this.selectedImg.picture = path;
    this.newPictureFile = File.fromUri(Uri(path: path));
  }
}

//? GPS Start Widget

class _Loading extends StatelessWidget {
  const _Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        return state.isAllGranted ? const _MapGps() : const _GpsAcces();
      },
    );
  }
}

class _MapGps extends StatefulWidget {
  const _MapGps({
    Key? key,
  }) : super(key: key);

  @override
  State<_MapGps> createState() => _MapGpsState();
}

class _MapGpsState extends State<_MapGps> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
    // locationBloc.getCurrentPosition();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state.lastKnownLocation == null) return const Center(child: Text('Espere por favor..'));
        //? copy start
        return Column(
          children: [
            const Center(
                heightFactor: 2,
                child: Text('Ubicación GPS del Productor',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold))),
            const Divider(
              color: Colors.blueGrey,
            ),
            Center(
              child: Text(
                  '${state.lastKnownLocation!.latitude},${state.lastKnownLocation!.longitude}'),
            ),
            const SizedBox(height: 5),
            const Divider(
              color: Colors.blueGrey,
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.location_pin),
              label: const Text('Obtener Ubicación GPS'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              onPressed: () {
                String latitudeGps = '${state.lastKnownLocation!.latitude}';
                String longitudeGps = '${state.lastKnownLocation!.longitude}';
                FlutterClipboard.copy("$latitudeGps , $longitudeGps");
              },
            )
          ],
        );
        //? copy end
      },
    );
  }
}

class _GpsAcces extends StatelessWidget {
  const _GpsAcces({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GpsBloc, GpsState>(
      builder: (context, state) {
        // print('state: $state');
        return !state.isGpsEnabled
            ? const _EnableGpsMessage()
            : const _AccessButton();
      },
    );
  }
}

class _AccessButton extends StatelessWidget {
  // ignore: sort_child_properties_last
  const _AccessButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Es necesario el acceso a GPS'),
        MaterialButton(
            // ignore: sort_child_properties_last
            child: const Text('Solicitar Acceso',
                style: TextStyle(color: Colors.white)),
            color: Colors.black,
            shape: const StadiumBorder(),
            elevation: 0,
            onPressed: (() {
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAccess();
            }))
      ],
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Debe de habilitar el GPS',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold));
  }
}

//? GPS End Widget




