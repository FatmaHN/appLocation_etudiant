import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:location_pour_etudiants/bienvenue.dart';

import 'package:location_pour_etudiants/screen/proprietaire/typedefoyer.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return //ChangeNotifierProvider (create: (context) =>LangageProvider(),
        MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'KARITY',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              //'/authentification/login': (context) => Login(title: "Connexion"),
              //"/pages/home": (context) => MyApp(),//nom de classe
              "/pages/list": (context) => const Bienvenue(),
            },
            home: const typefoyer(
                //title: 'bienvenue',
                ),
            initialRoute: '/');
  }
}
