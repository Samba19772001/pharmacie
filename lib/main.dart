import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'ecran/accueil.dart';
import 'ecran/connexion.dart';
import 'ecran/inscrition.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ApplicationPharmacie());
}

class ApplicationPharmacie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion de Pharmacies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/connexion', // Page de démarrage
      routes: {
        '/connexion': (context) => PageConnexion(),
        '/accueil': (context) => PageAccueil(),
        '/inscription': (context) => PageInscription(),
      },
    );
  }
}
