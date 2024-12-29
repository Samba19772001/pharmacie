import 'package:flutter/material.dart';

class PageListeMedoc extends StatefulWidget {
  @override
  _MedicamentsDisponiblesPageState createState() =>
      _MedicamentsDisponiblesPageState();
}

class _MedicamentsDisponiblesPageState extends State<PageListeMedoc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            premiersection(),
            deuxiemesection(),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
            SectionMedoc(
              photoPath: "assets/medicament1.jpeg",
              description:
                  "Paracétamol - 500mg - Soulage les douleurs et la fièvre",
              quantity: 20,
            ),
            SectionMedoc(
              photoPath: "assets/medicament2.jpeg",
              description: "Ibuprofène - 400mg - Anti-inflammatoire efficace",
              quantity: 15,
            ),
            SectionMedoc(
              photoPath: "assets/medicament3.jpeg",
              description:
                  "Amoxicilline - 1g - Antibiotique pour infections bactériennes",
              quantity: 30,
            ),
          ],
        ),
      ),
    );
  }
}

Widget premiersection() => Container(
      padding: EdgeInsets.all(20),
      //margin: EdgeInsets.all(10),
      height: 100,
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.3), // Couleur de l'ombre avec opacité
                    spreadRadius: 1, // Taille de l'ombre
                    blurRadius: 5, // Rayon de flou
                    offset:
                        Offset(0, 2), // Décalage horizontal (x) et vertical (y)
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Rechercher un médicament...',
                  hintStyle: TextStyle(color: Colors.black38),
                  prefixIcon: Icon(Icons.search, color: Colors.black38),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget deuxiemesection() => Container(
      height: 150,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black
                .withOpacity(0.3), // Couleur de l'ombre avec opacité
            spreadRadius: 1, // Taille de l'ombre
            blurRadius: 5, // Rayon de flou
            offset: Offset(0, 2), // Décalage horizontal (x) et vertical (y)
          ),
        ],
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green, Colors.greenAccent]),
      ),
      child: Column(
        children: [
          Text(
            "BIENVENU DANS VOTRE LISTE DE MEDICAMENT ",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "nous vous affrons une service de qualite ",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "rechercher et scroler pour voir la liste des medocs ",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    );

class SectionMedoc extends StatelessWidget {
  final String photoPath; // Chemin de l'image (Asset ou URL)
  final String description; // Description du médicament
  final int quantity; // Quantité disponible

  const SectionMedoc({
    super.key,
    required this.photoPath,
    required this.description,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Affichage de l'image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              photoPath,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          // Description et quantité
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5),
                Text(
                  "Quantité : $quantity",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
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
