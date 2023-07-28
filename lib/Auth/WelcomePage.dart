import 'package:flutter/material.dart';

import '../common/CommonColors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('public/images/register.png'), fit: BoxFit.cover),
        ),
        child:const Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Align(
              alignment: Alignment.center,
              child: Text('Hello Dear',  style: TextStyle(
                fontSize: 50,
                color: white,
                fontWeight: FontWeight.w700,
              ),),
            )
          ),
        )
    );
  }
}


