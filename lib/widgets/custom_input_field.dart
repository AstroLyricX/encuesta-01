


import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;

  final String formProperty;
  final Map<String, dynamic> formValues;



  const CustomInputField({
    super.key, 
    this.hintText, 
    this.labelText, 
    this.suffixIcon, 
    this.keyboardType, 
    required this.formProperty, 
    required this.formValues,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: ,
      autofocus: false,
      initialValue: '',
      textCapitalization: TextCapitalization.words,
      keyboardType: keyboardType,
      onChanged: (value) {formValues[formProperty] = value;},
      validator: (value) {
        if ( value == null ) return 'Este campo es requerido';
        return value.length < 1 ? 'Campo no válido': null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: suffixIcon == null ? null : Icon( suffixIcon ),
      ),
    );
  }
}