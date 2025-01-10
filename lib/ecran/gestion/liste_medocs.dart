import 'package:flutter/material.dart';

class PageListeMedoc extends StatefulWidget {
  @override
  _MedicamentsDisponiblesPageState createState() =>
      _MedicamentsDisponiblesPageState();
}

class _MedicamentsDisponiblesPageState extends State<PageListeMedoc> {
  String searchQuery = ''; // Variable pour la recherche

  // Liste des médicaments avec photo, description, et quantité
  final List<Map<String, dynamic>> medicaments = [
    // ...vos médicaments ici...
  ];

  // Filtrage des médicaments disponibles (quantité > 0)
  List<Map<String, dynamic>> get medicamentsDisponibles {
    return medicaments
        .where((medicament) =>
            medicament['quantite'] > 0 &&
            medicament['nom'].toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Médicaments Disponibles'),
        backgroundColor: Colors.blue[600],
        actions: [
          // Icône de recherche
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MedicamentSearchDelegate(medicaments),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: medicamentsDisponibles.isEmpty
            ? Center(
                child: Text(
                  'Aucun médicament disponible.',
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
              )
            : ListView.builder(
                itemCount: medicamentsDisponibles.length,
                itemBuilder: (context, index) {
                  final medicament = medicamentsDisponibles[index];
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          medicament['photo'],
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text(
                        medicament['nom'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quantité: ${medicament['quantite']}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            medicament['description'],
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class MedicamentSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> medicaments;

  MedicamentSearchDelegate(this.medicaments);

  @override
  String? get searchFieldLabel => 'Recherche médicament...';

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = ''; // Réinitialiser la recherche
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Fermer la recherche
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = medicaments
        .where((medicament) =>
            medicament['nom'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final medicament = results[index];
        return ListTile(
          leading: Image.asset(
            medicament['photo'],
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(medicament['nom']),
          subtitle: Text(medicament['description']),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = medicaments
        .where((medicament) =>
            medicament['nom'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final medicament = suggestions[index];
        return ListTile(
          leading: Image.asset(
            medicament['photo'],
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
          title: Text(medicament['nom']),
          subtitle: Text(medicament['description']),
        );
      },
    );
  }
}
