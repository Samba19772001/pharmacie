import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  @override
  _PageAccueilState createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  TextEditingController searchController = TextEditingController();
  List<String> medicaments = [
    'Paracétamol',
    'Ibuprofène',
    'Aspirine',
    'Antibiotique',
    'Vitamine C'
  ];

  List<String> filteredMedicaments = [];

  @override
  void initState() {
    super.initState();
    filteredMedicaments = medicaments;
    searchController.addListener(_filterMedicaments);
  }

  void _filterMedicaments() {
    setState(() {
      filteredMedicaments = medicaments
          .where((medicament) => medicament
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_filterMedicaments);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: Row(
          children: <Widget>[
            SizedBox(width: 10),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Rechercher un médicament...',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search, color: Colors.blue),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeaderWidget(
                imagePath: 'assets/images/docteur.jpeg', userName: 'DR. DIOUF'),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.local_pharmacy),
              title: Text('Gestion des Médicaments'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.list),
              title: Text('Liste des Médicaments'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/listemedocs');
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('Historique des Transactions'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/rapport');
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('À propos'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Déconnexion'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Builder(
        builder: (BuildContext context) => Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue[800]!,
                Colors.blue[700]!,
                Colors.blue[100]!,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("WELCOME",
                            style:
                                TextStyle(color: Colors.white, fontSize: 50)),
                        Text("Dr. DIOUF",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60),
                    ),
                  ),
                  child: ListView(
                    padding: EdgeInsets.all(20),
                    children: [
                      WelcomeBanner(),
                      SizedBox(height: 20),
                      SectionTitle(
                          title: 'Notification',
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.red),
                      SizedBox(height: 10),
                      NotificationList(),
                      SizedBox(height: 20),
                      _buildQuickActionButton(context, "GESTION DES STOCKS",
                          Icons.arrow_forward, '/entresortie'),
                      SizedBox(height: 20),
                      _buildQuickActionButton(context, "AJOUTER UN MÉDICAMENT",
                          Icons.add, '/ajoutermedoc'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickActionButton(
      BuildContext context, String label, IconData icon, String route) {
    return Center(
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: Colors.blue,
        ),
        onPressed: () {
          Navigator.pushNamed(context, route);
        },
        icon: Icon(icon, size: 24, color: Colors.white),
        label: Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DrawerHeaderWidget extends StatelessWidget {
  final String imagePath;
  final String userName;

  DrawerHeaderWidget({required this.imagePath, required this.userName});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 10, 125, 219),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage(imagePath),
          ),
          SizedBox(width: 15),
          Text(
            userName,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}

class WelcomeBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(Icons.local_pharmacy, size: 50, color: Colors.blue[700]),
          SizedBox(width: 15),
          Expanded(
            child: Text(
              'Bienvenue dans votre tableau de bord de gestion des stocks. Surveillez vos stocks, recevez des notifications et gérez facilement vos médicaments.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const SectionTitle({
    Key? key,
    required this.title,
    this.fontSize = 22,
    this.fontWeight = FontWeight.bold,
    this.color = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}

class NotificationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildNotificationCard(
              "Paracétamol", Icons.medical_information, Colors.red),
          SizedBox(width: 15),
          _buildNotificationCard("Ibuprofène", Icons.healing, Colors.blue),
        ],
      ),
    );
  }

  Widget _buildNotificationCard(
      String message, IconData icon, Color iconColor) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: iconColor),
            SizedBox(width: 15),
            SizedBox(
              width: 200,
              child: Text(
                message,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
