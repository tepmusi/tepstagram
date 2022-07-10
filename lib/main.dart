import 'package:flutter/material.dart';
import 'package:tepstagram/pages/home_page.dart';
import 'package:tepstagram/pages/login_page.dart';
import 'package:tepstagram/pages/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:tepstagram/services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  GetIt.instance.registerSingleton<FirebaseService>(
    FirebaseService(),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tepstagram',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //useMaterial3: true,
      ),
      initialRoute: 'login',
      routes: {
        'register': (context) => RegisterPage(),
        'login': (context) => LoginPage(),
        'home': (context) => HomePage(),
      },
    );
  }
}
