import "package:flutter/material.dart";


class accueilpro extends StatefulWidget {
  const accueilpro({Key? key}) : super(key: key);

  @override
  _accueilproState createState() => _accueilproState();
}

class _accueilproState extends State<accueilpro> {
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
