import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
//import 'package:intl/intl.dart';
import 'package:el_dorado/models/user.dart';
import 'package:el_dorado/pages/login_pages.dart';
import 'package:el_dorado/repository/firebase_api.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();

  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _repPassword = TextEditingController();

  //String _data = "Informacion: ";

  Genre? _genre = Genre.masculino;

  //String _dateConverter(DateTime newDate) {
    //final DateFormat formatter = DateFormat('yyyy-MM-dd');
    //final String dateFormatted = formatter.format(newDate);
    //return dateFormatted;
  //}

  /*void _showSelectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      locale: const Locale("es", "CO"),
      initialDate: DateTime(2022, 8),
      firstDate: DateTime(1900, 1),
      lastDate: DateTime(2022, 12),

    );
    if (newDate != null) {
      setState(() {
        _date = _dateConverter(newDate);
      });
    }
  }*/

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(msg),
        action: SnackBarAction(
            label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
  void _saveUser(User user) async {
    var result = await _firebaseApi.createUser(user);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage())
    );
  }

  void _registerUser(User user) async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if (result == "invalid-email") {
      msg = "El correo electónico está mal escrito";
    } else if (result == "weak-password") {
      msg = "La contrasena debe tener minimo 6 digitos";
    } else if (result == "email-already-in-use") {
      msg = "Ya existe una cuenta con ese correo electronico";
    } else if (result == "network-request-failed") {
      msg = "Revise su conexion a internet";
    } else {
      msg = "Usuario registrado con exito";
      user.uid = result;
      _saveUser(user);
    }
    _showMsg(msg);
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_password.text == _repPassword.text) {
        String genre = "Masculino";
        //String favoritos = "";

        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }

        var user = User("", _name.text, _email.text, _password.text, genre);
        _registerUser(user);

      } else {
        _showMsg("Las contraseñas deben de ser iguales");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Registro"),),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  const Image(
                    image: NetworkImage('https://img.freepik.com/vector-premium/pajaro-origami-logo-diseno-vector-icono-simbolo-plantilla-ilustracion_647432-65.jpg?w=740'
                    ),
                    height: 150,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Nombre'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _email,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Correo electrónico'),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _password,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), labelText: 'Contraseña'),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: _repPassword,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Repita contraseña'),
                    keyboardType: TextInputType.text,

                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: const Text('Masculino'),
                          leading: Radio<Genre>(
                              value: Genre.masculino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: const Text('Femenino'),
                          leading: Radio<Genre>(
                              value: Genre.femenino,
                              groupValue: _genre,
                              onChanged: (Genre? value) {
                                setState(() {
                                  _genre = value;
                                });
                              }),
                        ),
                      ),
                    ],
                  ),

                  ElevatedButton(
                    style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      _onRegisterButtonClicked();
                    },
                    child: const Text("Registrar"),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}