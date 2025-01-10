import 'package:flutter/material.dart';

class PageConnexion extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter, // Ajouté pour définir la direction
            colors: [
              Colors.blue[100]!, // Utilisation d'une teinte valide
              Colors.blue[200]!,
              Colors.blue[300]!
            ],
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.person, // Icône utilisateur
                size: 150,
                color: Colors.blue,
              ),
              SizedBox(height: 20),

              Text(
                'Bienvenue ! Connectez-vous pour continuer',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // Champ Email
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email ",
                  labelText: ' Email',
                  icon: Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                maxLength: 40,
              ),

              // Champ Mot de Passe
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Votre mot de Passe",
                  labelText: "Mot de Passe",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  icon: Icon(
                    Icons.lock,
                    color: Colors.blue,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(height: 20),
              // Bouton de Connexion
              ElevatedButton(
                onPressed: () {
                  // Logique de connexion
                  String email = emailController.text;
                  String password = passwordController.text;

                  Navigator.pushNamed(
                      context, '/accueil'); // Naviguer vers l'accueil
                },
                child: Text(
                  'Se Connecter',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(340, 60), // Bouton large
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
