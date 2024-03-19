import 'package:flutter/material.dart';

class ajout_foyer extends StatefulWidget {
  const ajout_foyer({Key? key}) : super(key: key);

  @override
  _ajout_foyerState createState() => _ajout_foyerState();
}

class _ajout_foyerState extends State<ajout_foyer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: Text("ajout votre Foyer"),
      ),
    );
  }
}
