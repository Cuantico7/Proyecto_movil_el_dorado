import 'package:el_dorado/features/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  // Funcion de inicialización de la página
  void initState() {
    passSplashPage();
    super.initState();
  }

  //Funcion para pasar el splash
  Future<void> passSplashPage() async {
    Future.delayed(Duration(seconds: 3), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(),
          ),
          Center(
            child: Text(
              'El Dorado!',
              style: TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.w900,
                  color: Colors.deepPurpleAccent.withOpacity(0.9)),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Center(
            child: Image(
              image: AssetImage('assets/logo.png'),
              width: 360,
            ),
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Realizado para el curso ',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    color: Colors.white.withOpacity(0.5)),
              ),
              Text(
                'MInTic',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
