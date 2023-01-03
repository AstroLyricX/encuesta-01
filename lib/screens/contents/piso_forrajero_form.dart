import 'package:encuesta_app/screens/screens.dart';
import 'package:flutter/material.dart';

// import 'package:encuesta_app/widgets/widgets.dart';

class PisoForrajeroScreen extends StatelessWidget {
  const PisoForrajeroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Piso Forrajero'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Form(
              child: Column(
            children: [
              const Text(
                  '¿Tiene capacidad de incrementar la superficie instalada?'),
              const SizedBox(height: 10),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 50.0,
                    children: [
                      const Text('2.1 Has bajo riego'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 50.0,
                    children: [
                      const Text('2.2 Has en secano'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 20.0,
                    children: [
                      const Text('2.3. Propiedad o arrendadas'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 50.0,
                    children: [
                      const Text('2.4. Has de alfalfa'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 40.0,
                    children: [
                      const Text('2.5. Has de  rye grass'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 20.0,
                    children: [
                      const Text('2.6.Has de  avena forrajera '),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 20.0,
                    children: [
                      const Text('2.7. Has de cebada forrajera'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 20.0,
                    children: [
                      const Text('2.8. Has de  pastos naturales?'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 40.0,
                    children: [
                      const Text('2.9. Total de hectareas'),
                      SizedBox(
                        width: 90,
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: '¿Cuantos?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 40.0,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            '2.10 ¿Por qué razon decidio sembrar los cultivos que  tiene en sus tierras?'),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              labelText: '¿Por que?',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Card(
                elevation: 2,
                child: Center(
                  heightFactor: 1.2,
                  child: Wrap(
                    spacing: 40.0,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            '2.11. Otros recursos agricolas ¿Cuántas has? '),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Papa',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Quinua',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Cañihua',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Habas',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                      const SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                            autofocus: false,
                            initialValue: '',
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Otros',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 5),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen(),));
                },
                child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Enviar'))),
              ),
              const SizedBox(height: 20)
            ],
          )),
        ),
      ),
    );
  }
}
