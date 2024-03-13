import 'package:flutter/material.dart';
import 'package:location_pour_etudiants/authentification/bienvenue1.dart';

import '../bienvenue.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isObscure = true;
  bool _isStudent = true;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          //'/authentification/login': (context) => Login(title: "Connexion"),
          //"/pages/home": (context) => MyApp(),//nom de classe
          "/pages/list": (context) => bienvenue1(
                title: '',
              ),
        },
        home: Scaffold(
            appBar: AppBar(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                title: const Text(
                  "Sign Up Page",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                backgroundColor: const Color(0xFF1976D2),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.help_outline,
                      color: Colors.white,
                    ),
                  ),
                ], // Couleur pour le AppBar
                leading: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => bienvenue1(
                                  title: '',
                                ))),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                )),
            body: Center(
              child: SingleChildScrollView(
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
                    const SizedBox(height: 20),
                    const SizedBox(height: 20),

                    // Nom
                    buildTextField('Nom', nameController),
                    const SizedBox(height: 20),

                    // Email
                    buildTextField('Email', emailController),
                    const SizedBox(height: 20),

                    // Numéro de téléphone
                    buildTextField(
                        'Numéro de téléphone', phoneNumberController),
                    const SizedBox(height: 20),

                    // Mot de passe
                    buildPasswordField('Mot de passe', passwordController),
                    const SizedBox(height: 20),

                    // Confirmation du mot de passe
                    buildPasswordField(
                        'Confirmer le mot de passe', confirmPasswordController),
                    const SizedBox(height: 20),

                    // Choix de type d'utilisateur
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: const Text('Étudiant',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            leading: Radio(
                              value: true,
                              groupValue: _isStudent,
                              onChanged: (value) {
                                setState(() {
                                  _isStudent = value!;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: const Text('Propriétaire',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            leading: Radio(
                              value: false,
                              groupValue: _isStudent,
                              onChanged: (value) {
                                setState(() {
                                  _isStudent = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Bouton Inscription
                    ElevatedButton(
                      onPressed: () {
                        // Action à effectuer lors de l'inscription
                        print('Inscription en cours...');
                      },
                      child: const Text('S\'inscrire'),
                    ),
                  ],
                ),
              ),
            )));
  }

  Widget buildTextField(String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.person),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0, // Épaisseur de la bordure
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10), // Rayon de la bordure
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0, // Épaisseur de la bordure
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10), // Rayon de la bordure
        ),
      ),
      style: const TextStyle(fontSize: 14),
    );
  }

  Widget buildPasswordField(
      String labelText, TextEditingController controller) {
    return TextField(
      controller: controller,
      obscureText: _isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isObscure = !_isObscure;
            });
          },
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0, // Épaisseur de la bordure
            color: Colors.blue,
          ),
          borderRadius: BorderRadius.circular(10), // Rayon de la bordure
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0, // Épaisseur de la bordure
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10), // Rayon de la bordure
        ),
      ),
      style: const TextStyle(fontSize: 14),
    );
  }
}
