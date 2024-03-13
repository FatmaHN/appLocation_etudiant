import 'package:flutter/material.dart';

class addfoyer extends StatefulWidget {
  const addfoyer({Key? key}) : super(key: key);

  @override
  _addfoyer createState() => _addfoyer();
}

class _addfoyer extends State<addfoyer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Ajouter votre foyer',
            style: TextStyle(
              color: Colors.black87,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading:
              IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.help))],
        ),
      ),
    );
  }
}
