import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final labeltext, hintedtext;
  final TextEditingController mycontroller;

  const Mytextfield({super.key, required this.labeltext, required this.hintedtext, required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: mycontroller,
      validator: (value) {
        if (value!.isEmpty) {
          return "$labeltext Wajib di isi";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: labeltext,
        hintText: hintedtext,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.green)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.green)),
        errorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: Colors.green)),
        focusedErrorBorder: const OutlineInputBorder(borderSide: BorderSide(width: 3, color: Color.fromARGB(255, 224, 54, 54))),
      ),
    );
  }
}
