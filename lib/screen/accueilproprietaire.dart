import "package:flutter/material.dart";
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class accueilpro extends StatefulWidget {
  const accueilpro({Key? key}) : super(key: key);

  @override
  _accueilproState createState() => _accueilproState();
}

class _accueilproState extends State<accueilpro> {
  PersistentTabController _controllertabcontroller =
      PersistentTabController(initialIndex: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.abc),
      ),
    );
  }
}
