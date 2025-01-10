import 'package:flutter/material.dart';
import 'dart:io'; // Pour gérer les fichiers (images)
import '../accueil.dart';
import 'package:image_picker/image_picker.dart'; // Pour sélectionner une image depuis la galerie ou la caméra

class PageAjouterMedoc extends StatefulWidget {
  @override
  _PageAjouterMedocState createState() => _PageAjouterMedocState();
}

class _PageAjouterMedocState extends State<PageAjouterMedoc> {
  final TextEditingController _nomController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? _image;
  int _selectedIndex = 0; // L'index sélectionné pour le BottomNavigationBar

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _ajouterMedicament() {
    String nom = _nomController.text;
    String description = _descriptionController.text;

    if (nom.isNotEmpty && description.isNotEmpty && _image != null) {
      // Enregistrez les données ici (base de données, API, etc.)
      print("Nom: $nom");
      print("Description: $description");
      print("Image: ${_image!.path}");

      _nomController.clear();
      _descriptionController.clear();
      setState(() {
        _image = null;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Médicament ajouté avec succès !"),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Veuillez remplir tous les champs et ajouter une image."),
      ));
    }
  }

  // Fonction pour changer la page selon l'index sélectionné
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/accueil'); // Page d'accueil
    } else if (index == 1) {
      Navigator.pushNamed(context, '/medicaments'); // Liste des médicaments
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AJOUTER MEDICAMENT ',
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Container(
                  child: SectionTitle(
                    title: 'Voulez vous ajouter un nouveau medicament ',
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),

                // Champ pour le nom du médicament
                TextField(
                  controller: _nomController,
                  decoration: InputDecoration(
                    labelText: "Nom du médicament",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue[600]!),
                    ),
                    prefixIcon:
                        Icon(Icons.local_pharmacy, color: Colors.blue[600]),
                  ),
                ),
                SizedBox(height: 16),

                // Champ pour la description du médicament
                TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(
                    labelText: "Description du médicament",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.blue[600]!),
                    ),
                    prefixIcon:
                        Icon(Icons.description, color: Colors.blue[600]),
                  ),
                  maxLines: 3,
                ),
                SizedBox(height: 16),

                // Section pour ajouter une photo
                Text(
                  "Ajouter une photo du médicament",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue[400]!),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: _image != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : Center(
                            child: Text(
                              "Cliquez pour ajouter une image",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 24),

                // Bouton d'ajout
                Center(
                  child: ElevatedButton(
                    onPressed: _ajouterMedicament,
                    child: Text(
                      "Ajouter le médicament",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                      backgroundColor:
                          Colors.blue[600], // Couleur de fond du bouton
                      foregroundColor:
                          Colors.white, // Couleur du texte du bouton
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // L'index actuel
        onTap: _onItemTapped, // Quand un item est tapé
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.medical_services,
              color: Colors.black,
            ),
            label: 'Médicaments',
          ),
        ],
      ),
    );
  }
}
