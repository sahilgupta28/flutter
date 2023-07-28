import 'package:flutter/material.dart';

import '../../common/CommonColors.dart';

class ButtonTextType extends StatelessWidget {
  const ButtonTextType({super.key, this.label, this.size, this.color, this.weight, this.pageLink,this.callBack});
  final String? label;
  final String? pageLink;
  final double? size;
  final Color? color;
  final FontWeight? weight;
 final void Function()? callBack;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
          () {
        Navigator.pushNamed(context, pageLink ?? 'home');
      },
      child: Text(
        label ?? 'Button',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: size ?? 25,
          color: color ?? white,
          fontWeight: weight ?? FontWeight.w700,
        ),
      ),
    );
  }
}



class Button extends StatelessWidget {
  const Button({super.key, this.label, this.size, this.color, this.weight, this.pageLink,this.callBack});
  final String? label;
  final String? pageLink;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final void Function()? callBack;


  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed:
      callBack,
      child: Text(
        label ?? 'Button',
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: size ?? 25,
          color: color ?? white,
          fontWeight: weight ?? FontWeight.w700,
        ),
      ),
    );
  }
}
