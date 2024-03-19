import 'package:flutter/material.dart';
import 'package:location_pour_etudiants/screen/proprietaire/add/ajout_foyer_pri.dart';
import 'package:location_pour_etudiants/screen/proprietaire/add/ajout_maison.dart';
import 'package:location_pour_etudiants/screen/proprietaire/add/ajout_maison_lit.dart';

class typefoyer extends StatefulWidget {
  const typefoyer({Key? key}) : super(key: key);

  @override
  _typefoyerState createState() => _typefoyerState();
}

class _typefoyerState extends State<typefoyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF1976D2),
          elevation: 5,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          title: const Text(
            "Choisir votre bien",
            style: TextStyle(fontSize: 20),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.call, color: Colors.white),
              iconSize: 32,
            )
          ],
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.account_circle, color: Colors.white),
            iconSize: 32,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Choisir votre bien'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Card(
                            elevation: 5,
                            shadowColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ajout_maison()),
                                );
                              },
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/maison.png'),
                                    ),
                                    title: Text(
                                      'Maison complète',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(''),
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Ajouter',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.add,
                                        color: Colors.blueAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shadowColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AjoutMaisonLit()),
                                );
                              },
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/maisonparlit.jpg'),
                                    ),
                                    title: Text(
                                      'Maison par place',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(''),
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Ajouter',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.add,
                                        color: Colors.blueAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            elevation: 5,
                            shadowColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ajout_foyer()),
                                );
                              },
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('images/foyerprive.jpg'),
                                    ),
                                    title: Text(
                                      'Foyer privé',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(''),
                                  ),
                                  SizedBox(height: 10),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        'Ajouter',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.add,
                                        color: Colors.blueAccent,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Text('Choisir votre bien'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "accueil",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add,
                size: 20,
              ),
              label: "Ajouter",
              backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "messages"),
        ],
        selectedItemColor: Colors.white,
        currentIndex: 0,
        backgroundColor: Colors.blueAccent,
        unselectedItemColor: Colors.white54,
      ),
    );
  }
}
