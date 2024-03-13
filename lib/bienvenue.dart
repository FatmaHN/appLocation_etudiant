import 'package:flutter/material.dart';

class Bienvenue extends StatefulWidget {
  const Bienvenue({Key? key}) : super(key: key);

  @override
  _BienvenueState createState() => _BienvenueState();
}

class _BienvenueState extends State<Bienvenue> {
  int? _selectedOption;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            ),
          ),
          title: const Text(
            "Bienvenue",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF1976D2), // Couleur pour le AppBar
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/logo.png'),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.help_outline,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: Color(0xFF1976D2),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/logo.png'),
              ),
            ),
            SizedBox(height: 40),
            const Text(
              "Choisissez votre profil :",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildRadioButton('Étudiant', 0),
                const SizedBox(width: 20),
                buildRadioButton('Propriétaire', 1),
              ],
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lorsque le bouton "Suivant" est pressé
                if (_selectedOption != null) {
                  if (_selectedOption == 0) {
                    // Étudiant sélectionné
                  } else if (_selectedOption == 1) {
                    // Propriétaire sélectionné
                  }
                } else {
                  // Aucune option sélectionnée
                }
              },
              style: ElevatedButton.styleFrom(
                primary:const Color(0xFFFFA726), // Couleur pour le bouton Suivant
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Suivant',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioButton(String title, int value) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: _selectedOption == value ? const Color(0xFF1976D2) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: _selectedOption == value
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0.5, // Subtle shadow for selection
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null, // Remove shadow for unselected options
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: TextStyle(
            color: _selectedOption == value ? Colors.white : Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
