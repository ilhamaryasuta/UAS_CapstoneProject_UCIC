import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final String labeltext, hintedtext;
  final TextEditingController mycontroller;
  final bool isRequired, allowEdit;

  const Mytextfield({super.key, required this.labeltext, required this.hintedtext, required this.mycontroller, this.isRequired = true, this.allowEdit = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enableInteractiveSelection: allowEdit,
      readOnly: !allowEdit,
      controller: mycontroller,
      validator: (value) {
        if (!isRequired) {
          return null;
        }
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
