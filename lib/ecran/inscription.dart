import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PageInscription extends StatefulWidget {
  @override
  _PageInscriptionState createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<User?> signUpWithEmailPassword() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      return userCredential.user;
    } catch (e) {
      Fluttertoast.showToast(msg: "Erreur lors de l'inscription: $e");
      return null;
    }
  }

  Future<User?> signUpWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        Fluttertoast.showToast(msg: "Échec de la connexion avec Google.");
        return null;
      }
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    } catch (e) {
      Fluttertoast.showToast(msg: "Erreur d'inscription avec Google: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inscription')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Mot de passe'),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = await signUpWithEmailPassword();
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/accueil');
                }
              },
              child: Text('S\'inscrire'),
            ),
            ElevatedButton(
              onPressed: () async {
                User? user = await signUpWithGoogle();
                if (user != null) {
                  Navigator.pushReplacementNamed(context, '/accueil');
                }
              },
              child: Text('S\'inscrire avec Google'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/connexion');
              },
              child: Text("Vous avez déjà un compte ? Connectez-vous"),
            ),
          ],
        ),
      ),
    );
  }
}
