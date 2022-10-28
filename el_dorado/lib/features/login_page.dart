import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ingresar",
          style: TextStyle(textAlign: TextAlign.center),
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(child: Container()),
          Center(
            child: Image(
              image: AssetImage('assets/logo.png'),
              width: 120,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "Un lugar del mundo en la palma de tu mano",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.5)),
                textAlign: TextAlign.center,
              )),
          Expanded(child: Container()),
        ]),
      ),
    );
  }
}
