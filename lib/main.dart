import 'package:flutter/material.dart';
import 'ecran/accueil.dart';
import 'ecran/connexion.dart';
import 'ecran/gestion/liste_medocs.dart';
import 'ecran/gestion/entre_sortie.dart';
import 'ecran/gestion/ajouter_medocs.dart';
import 'ecran/gestion/rapport.dart';

void main() {
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
        '/listemedocs': (context) => PageListeMedoc(),
        '/entresortie': (context) => PageEntreSortie(),
        '/ajoutermedoc': (context) => PageAjouterMedoc(),
        '/rapport': (context) => RapportsStockPage(),
      },
    );
  }
}
