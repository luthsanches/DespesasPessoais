import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType typeInput;
  final Function(String) submit;

  AdaptativeTextField({
    this.label,
    this.controller,
    this.typeInput,
    this.submit,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoTextField(
          controller: controller,
          onSubmitted: submit,
          keyboardType: typeInput,
          placeholder: label,
        )
        : TextField(
            controller: controller,
            keyboardType: typeInput,
            onSubmitted: submit,
            decoration: InputDecoration(
              labelText: label,
            ),
          );
  }
}
