import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:el_dorado/pages/home_page.dart';
import 'package:el_dorado/pages/login_pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    _closeSplash();
    super.initState();
  }

  Future<void> _closeSplash() async {
    Future.delayed(const Duration(seconds: 4), () async {
      var currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser == null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
      Center(
        child: Image(
          image: NetworkImage('https://img.freepik.com/vector-premium/pajaro-origami-logo-diseno-vector-icono-simbolo-plantilla-ilustracion_647432-65.jpg?w=740'),
          width: 360,
        ),
      ),

    );
  }
}
