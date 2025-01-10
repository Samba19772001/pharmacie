import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../accueil.dart';

class PageEntreSortie extends StatefulWidget {
  @override
  _MouvementsStockPageState createState() => _MouvementsStockPageState();
}

class _MouvementsStockPageState extends State<PageEntreSortie> {
  final List<Map<String, dynamic>> mouvements = [];
  final TextEditingController nomMedicamentController = TextEditingController();
  final TextEditingController quantiteController = TextEditingController();
  String typeMouvement = 'Entrée';

  void ajouterMouvement() {
    if (nomMedicamentController.text.isNotEmpty &&
        quantiteController.text.isNotEmpty) {
      final quantite = int.tryParse(quantiteController.text);
      if (quantite != null && quantite > 0) {
        setState(() {
          mouvements.add({
            'type': typeMouvement,
            'nomMedicament': nomMedicamentController.text,
            'quantite': quantite,
            'date': DateTime.now(),
          });
        });
        nomMedicamentController.clear();
        quantiteController.clear();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Veuillez entrer une quantité valide')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs')),
      );
    }
  }

  String formatDate(DateTime date) {
    final DateFormat formatter = DateFormat('dd/MM/yyyy HH:mm');
    return formatter.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[700]!,
              Colors.blue[300]!,
              Colors.blue[100]!,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Titre de la section avec Expanded pour éviter qu'il dépasse
                    Expanded(
                      child: SectionTitle(
                        title: 'GESTION DES MOUVEMENTS',
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        color: Colors.black,
                      ),
                    ),
                    // Icône pour accéder à la page "Rapport"
                    IconButton(
                      icon: Icon(Icons.analytics,
                          color: Colors.white,
                          size: 40), // Ajustement de la taille
                      onPressed: () {
                        Navigator.pushNamed(context,
                            '/rapport'); // Remplacez par la route vers la page Rapport
                      },
                    ),
                    // Icône pour retourner à la page d'accueil
                    IconButton(
                      icon: Icon(Icons.home,
                          color: Colors.white,
                          size: 40), // Ajustement de la taille
                      onPressed: () {
                        Navigator.pushNamed(context,
                            '/accueil'); // Remplacez par la route vers la page Accueil
                      },
                    ),
                  ],
                ),
              ),

              WelcomeBanner(),
              SizedBox(
                height: 20,
              ),

              // Champ de sélection du type de mouvement
              DropdownButtonFormField<String>(
                value: typeMouvement,
                items: ['Entrée', 'Sortie']
                    .map((type) => DropdownMenuItem(
                          value: type,
                          child: Text(
                            type,
                            style: TextStyle(fontSize: 16),
                          ),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    typeMouvement = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Type de mouvement',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Champ pour le nom du médicament
              TextField(
                controller: nomMedicamentController,
                decoration: InputDecoration(
                  labelText: 'Nom du médicament',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Champ pour la quantité
              TextField(
                controller: quantiteController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Quantité',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Bouton d'ajout
              ElevatedButton.icon(
                onPressed: ajouterMouvement,
                icon: Icon(Icons.add,
                    size: 30,
                    color: Colors.black), // Icône avec une couleur blanche
                label: Text(
                  'Ajouter un mouvement',
                  style: TextStyle(
                      fontSize: 25, color: Colors.black), // Texte en blanc
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Couleur d'arrière-plan du bouton
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Coins arrondis
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Liste des mouvements
              Expanded(
                child: ListView.builder(
                  itemCount: mouvements.length,
                  itemBuilder: (context, index) {
                    final mouvement = mouvements[index];
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        title: Text(
                          '${mouvement['type']} - ${mouvement['nomMedicament']}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          'Quantité: ${mouvement['quantite']} - Date: ${formatDate(mouvement['date'])}',
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              mouvements.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
