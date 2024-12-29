import 'package:flutter/material.dart';

class PageInscription extends StatefulWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  State<PageInscription> createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    widget.confirmPasswordController.dispose();
    widget.nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          backgroundImage(), // Image de fond
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
                  child: Text(
                    "  Inscription",
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Bienvenue ! Inscrivez-vous pour continuer',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // Fond blanc semi-transparent
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      MyTransparentTextField(
                        controller: widget.nameController,
                        labelText: "Nom",
                        hintText: "Entrez votre nom",
                        prefixIcone: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      MyTransparentTextField(
                        controller: widget.emailController,
                        labelText: "Email",
                        hintText: "Entrez votre email",
                        prefixIcone: Icons.email,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 20),
                      MyTransparentTextField(
                        controller: widget.passwordController,
                        labelText: "Mot de passe",
                        hintText: "Entrez votre mot de passe",
                        prefixIcone: Icons.lock,
                        isPassword: true,
                      ),
                      const SizedBox(height: 20),
                      MyTransparentTextField(
                        controller: widget.confirmPasswordController,
                        labelText: "Confirmer le mot de passe",
                        hintText: "Confirmez votre mot de passe",
                        prefixIcone: Icons.lock,
                        isPassword: true,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          // Logique d'inscription
                          if (widget.passwordController.text ==
                              widget.confirmPasswordController.text) {
                            // Action d'inscription ici
                          } else {
                            // Afficher un message d'erreur si les mots de passe ne correspondent pas
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      'Les mots de passe ne correspondent pas.')),
                            );
                          }
                        },
                        child: Text(
                          "S'inscrire",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            // Couleur du bouton
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 80),
                            textStyle: TextStyle(
                              fontSize: 30,
                            ),
                            backgroundColor: Colors.grey),
                      ),
                    ],
                  ),
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
        colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
        fit: BoxFit.fill,
        image: AssetImage(
            "assets/inscription.jpeg"), // Remplacez par votre propre image
      ),
    ),
  );
}

class MyTransparentTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcone;
  final String labelText;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;

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
          color: Colors.white24.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12)),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcone, color: Colors.black45),
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.transparent,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        ),
      ),
    );
  }
}
