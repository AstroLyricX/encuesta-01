import 'package:flutter/material.dart';

class CustomPisoForrajero extends StatefulWidget {


  const CustomPisoForrajero({
    super.key,
  });

  @override
  State<CustomPisoForrajero> createState() => _CustomPisoForrajeroState();
}

class _CustomPisoForrajeroState extends State<CustomPisoForrajero> {

  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 2,
      child: Center(
        heightFactor: 1.2,
        child: Wrap(
          spacing: 50.0,
          children: [
            SizedBox(
               width: 120,
              child: TextFormField(
                autofocus: false,
                initialValue: '',
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: '¿Cuantos?',
                   contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),

                )
              ),
            ),
            Checkbox(
              value: true, 
              onChanged: (value) {
                setState(() {
                  value = false;
                });
              },)
          ],
        ),
      ),
    );
  }
}
