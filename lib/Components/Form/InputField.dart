import 'package:flutter/material.dart';

import '../../common/CommonColors.dart';

class InputField extends StatelessWidget {
  const InputField({super.key, this.label, this.radius, this.filled, this.fillColor, this.controller});
  final String? label;
  final double? radius;
  final bool? filled;
  final Color? fillColor;
  final  TextEditingController? controller;


  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: controller,
        style: const TextStyle(),
        decoration: InputDecoration(
            fillColor: fillColor ?? white,
            filled: filled ?? false,
            hintText: label ?? "Input",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
           borderSide: const BorderSide(color: white,)
            ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
              borderSide: const BorderSide(color: white,)
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? 0),
              borderSide: const BorderSide(color: white,)
          ),
        )
    );
  }
}
