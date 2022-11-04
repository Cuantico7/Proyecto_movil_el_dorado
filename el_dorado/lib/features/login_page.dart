//import 'dart:html';

import 'splash_page.dart';
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
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(30),
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
              Text(
                "Un lugar del mundo en la palma de tu mano",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w300,
                    color: Colors.black.withOpacity(0.5)),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Usuario",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.person),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.vpn_key),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SplashPage()));
                },
                child: Text("Ingresar"),
              ),
              Expanded(child: Container()),
            ])),
      ),
    );
  }
}
