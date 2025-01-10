import 'package:flutter/material.dart';
import 'dart:io';
import 'package:csv/csv.dart';
import 'package:path_provider/path_provider.dart';

class RapportsStockPage extends StatefulWidget {
  @override
  _RapportsStockPageState createState() => _RapportsStockPageState();
}

class _RapportsStockPageState extends State<RapportsStockPage> {
  final List<Map<String, dynamic>> rapports = [
    {'nomMedicament': 'Paracétamol', 'quantite': 50},
    {'nomMedicament': 'Ibuprofène', 'quantite': 30},
    {'nomMedicament': 'Aspirine', 'quantite': 5}, // Stock faible ajouté
  ];
  String searchQuery = '';

  List<Map<String, dynamic>> get rapportsFiltres {
    if (searchQuery.isEmpty) {
      return rapports;
    } else {
      return rapports
          .where((rapport) => rapport['nomMedicament']
              .toLowerCase()
              .contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  void exportToCSV() async {
    List<List<dynamic>> rows = [
      ["Nom du médicament", "Quantité"]
    ];

    for (var rapport in rapports) {
      rows.add([rapport['nomMedicament'], rapport['quantite']]);
    }

    String csvData = const ListToCsvConverter().convert(rows);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/rapport_stock.csv');
    await file.writeAsString(csvData);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Rapport exporté vers: ${file.path}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rapports sur le stock',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[600],
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: Colors.white),
            onPressed: exportToCSV,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Champ de recherche
            TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher un médicament',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue[600]!),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
            SizedBox(height: 16),

            // Affichage des rapports
            Expanded(
              child: ListView.builder(
                itemCount: rapportsFiltres.length,
                itemBuilder: (context, index) {
                  final rapport = rapportsFiltres[index];
                  final isLowStock =
                      rapport['quantite'] < 10; // Alerte pour stock faible

                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.medical_services,
                        color: isLowStock ? Colors.red : Colors.green,
                      ),
                      title: Text(
                        rapport['nomMedicament'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        'Quantité: ${rapport['quantite']}',
                        style: TextStyle(
                          color: isLowStock ? Colors.red : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: isLowStock
                          ? Icon(Icons.warning, color: Colors.red)
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: exportToCSV,
        backgroundColor: Colors.blue[600],
        child: Icon(Icons.download, color: Colors.white),
      ),
    );
  }
}
