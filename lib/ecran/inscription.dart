import 'package:flutter/material.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({super.key});

  @override
  _PageInscriptionState createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController pharmacieController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Créer un compte',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Champ Nom
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person), // Icône du nom
                ),
                controller: nomController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre nom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Champ Prénom
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Prénom',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person), // Icône du prénom
                ),
                controller: prenomController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre prénom';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Champ Nom de la pharmacie
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Nom de la pharmacie',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.store), // Icône pharmacie
                ),
                controller: pharmacieController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom de la pharmacie';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Champ Email
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Adresse e-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email), // Icône email
                ),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer une adresse e-mail';
                  } else if (!RegExp(
                          r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
                      .hasMatch(value)) {
                    return 'Veuillez entrer une adresse e-mail valide';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Champ Mot de passe
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock), // Icône mot de passe
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
                controller: passwordController,
                obscureText:
                    !_passwordVisible, // Masquer ou afficher le mot de passe
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un mot de passe';
                  } else if (value.length < 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              // Champ Confirmer le mot de passe
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirmer le mot de passe',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                controller: confirmPasswordController,
                obscureText: !_passwordVisible,
                validator: (value) {
                  if (value != passwordController.text) {
                    return 'Les mots de passe ne correspondent pas';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),

              // Bouton d'inscription
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Traiter l'inscription
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Inscription réussie !')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  iconColor: Colors.green, // Couleur du bouton
                ),
                child: Text(
                  'S\'inscrire',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),

              // Lien de retour vers la page de connexion
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Retour à la page précédente
                },
                child: Text(
                  'Vous avez déjà un compte ? Connectez-vous',
                  style: TextStyle(color: Colors.green), // Couleur du texte
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
