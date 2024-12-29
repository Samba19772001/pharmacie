import 'package:flutter/material.dart';

class PageConnexion extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  State<PageConnexion> createState() => _PageConnexionState();
}

class _PageConnexionState extends State<PageConnexion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          backgroundImage(),
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Text(
                    "Sama-Koom",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  'Bienvenue ! Connectez-vous pour continuer',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                // Champ Email
                MyTransparentTextField(
                  controller: widget.emailController,
                  hintText: "Entrez votre email",
                  labelText: "Email",
                  prefixIcone: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 20),
                // Champ Mot de Passe
                MyTransparentTextField(
                  controller: widget.passwordController,
                  hintText: "Entrez votre mot de passe",
                  labelText: "Mot de passe",
                  prefixIcone: Icons.lock,
                  isPassword: true,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Action de connexion
                    String email = widget.emailController.text;
                    String password = widget.passwordController.text;
                    print("Email: $email, Mot de passe: $password");
                    Navigator.pushNamed(context, '/accueil');
                  },
                  child: Text(
                    "Se connecter",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      // Couleur du bouton
                      padding:
                          EdgeInsets.symmetric(horizontal: 90, vertical: 20),
                      textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.greenAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/inscription');
                      },
                      child: Text(
                        "Creer un compte",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Container backgroundImage() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: const BoxDecoration(
      image: DecorationImage(
        colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        fit: BoxFit.fill,
        image: AssetImage("assets/pharmacie.jpeg"),
      ),
    ),
  );
}

class MyTransparentTextField extends StatelessWidget {
  final IconData prefixIcone;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const MyTransparentTextField({
    super.key,
    required this.controller,
    this.prefixIcone = Icons.fiber_manual_record_rounded,
    this.labelText = "pas de label",
    this.hintText = "pas de hint",
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: controller,
        obscureText: isPassword, // Masque le texte si isPassword est vrai
        keyboardType: keyboardType, // Type de clavier
        style: TextStyle(color: Colors.white), // Texte en blanc
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcone,
              color: Colors.greenAccent), // Icône avant le texte
          labelText: labelText, // Texte du label
          labelStyle: TextStyle(
              color: Colors.white
                  .withOpacity(0.7)), // Texte du label en blanc transparent
          hintText: hintText, // Texte d'indication
          hintStyle: TextStyle(
              color: Colors.white
                  .withOpacity(0.7)), // Texte du hint en blanc transparent
          border: InputBorder.none, // Pas de bordure
          filled: true, // Remplir l'arrière-plan
          fillColor: Colors.transparent, // Fond transparent
          contentPadding: EdgeInsets.symmetric(
              vertical: 15.0, horizontal: 20.0), // Espacement du texte
        ),
      ),
    );
  }
}
