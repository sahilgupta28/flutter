import 'package:flutter/material.dart';

class HomeDemo extends StatelessWidget {
  const HomeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Column(
              children: [
                Header(),
                Label(),
                Input()
            ],
          ),
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Align(
        alignment: Alignment.topCenter,
        child: Text("Sahil learning the Flutter.",
          style: TextStyle(
            fontSize: 25,
            color: Colors.blueAccent,
            fontWeight: FontWeight.w700,
          ),
        ),
    );
  }
}


class Label extends StatelessWidget {
  const Label({super.key});
  @override
  Widget build(BuildContext context) {
    return const  Align(
      alignment: Alignment.topLeft,
      child: Text("Fullname",
        style: TextStyle(
          fontSize: 20,
          color: Colors.blueAccent,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({super.key});
  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: TextFormField(
        decoration: const InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Enter fullname',
        ),
      ),
    );
  }
}
