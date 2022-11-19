import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:hive/hive.dart';
//import 'package:hive_flutter/hive_flutter.dart';
import 'package:el_dorado/firebase_options.dart';
//import 'firebase_options.dart';
//import 'package:mis_libros/models/local_book.dart';
import 'package:el_dorado/pages/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  //await Hive.initFlutter();
  //Hive.registerAdapter(LocalBookAdapter());

  //await Hive.openBox<LocalBook>('favorites');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'El Dorado',

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
    );
  }
}