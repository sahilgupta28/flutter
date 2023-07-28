import 'package:flutter/material.dart';

import 'Components/Form/ButtonTextType.dart';
import 'common/CommonColors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: Stack(
              children: [
                Welcome(),
                Navigation()
              ],
            ),
          ),
      )
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Align(
        alignment: Alignment.center,
        child: Text("Welcome",
          style: TextStyle(
            fontSize: 50,
            color: white,
            fontWeight: FontWeight.w700,
          ),
        ),
    );
  }
}

class Navigation extends StatelessWidget {
  const Navigation({super.key});
  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.only(left: 25, right: 25, bottom: 15),
      child: Align(
      alignment: Alignment.bottomCenter ,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ButtonTextType(label: 'Sign In', size: 25, color: white, weight: FontWeight.w700, pageLink: 'login'),
            ButtonTextType(label: 'Sign Up', size: 25, color: blue, weight: FontWeight.w700, pageLink: 'register'),
          ],
        ),
      ),
    );
  }
}