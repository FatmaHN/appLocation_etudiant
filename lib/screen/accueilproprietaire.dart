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
      appBar: AppBar(actions: [
        Icon(Icons.arrow_back_ios),
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new))
      ]),
      bottomNavigationBar: new BottomNavigationBar(items: [
        new BottomNavigationBarItem(
            icon: const Icon(Icons.home), label: "home"),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.chat), label: "chat"),
        new BottomNavigationBarItem(
            icon: const Icon(Icons.notification_add), label: "notification"),
      ]),
    );
  }
}
