import 'package:flutter/material.dart';
import 'package:location_pour_etudiants/authentification/bienvenue1.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login> {
  bool _isObscure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          //'/authentification/login': (context) => Login(title: "Connexion"),
          //"/pages/home": (context) => MyApp(),//nom de classe
          "/pages/list": (context) => bienvenue1(
                title: 'tester',
              ),
        },
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            title: const Text(
              "Log in Page",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            backgroundColor: const Color(0xFF1976D2), // Couleur pour le AppBar
            leading: Padding(
                padding: const EdgeInsets.all(8.0),

                /* CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('images/logo.png'),
                  ), */

                child: IconButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => bienvenue1(
                                title: '',
                              ))),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black87,
                  ),
                )),

            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  const CircleAvatar(
                    radius: 70,
                    backgroundColor: Colors.orange,
                    backgroundImage: AssetImage('images/logo.png'),
                  ),
                  const SizedBox(height: 40),
                  // Formulaire de connexion
                  TextField(
                    style: const TextStyle(
                      fontSize: 14.0, // Taille du texte
                      height: 1.5, // Hauteur de la ligne de texte
                    ),
                    controller: emailController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 12, // Padding vertical
                        horizontal: 20, // Padding horizontal
                      ),
                      labelText: 'Login',
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.0, // Épaisseur de la bordure
                          color: Colors.blue,
                        ),
                        borderRadius:
                            BorderRadius.circular(10), // Rayon de la bordure
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.0, // Épaisseur de la bordure
                          color: Colors.red,
                        ),
                        borderRadius:
                            BorderRadius.circular(10), // Rayon de la bordure
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    style: const TextStyle(
                      fontSize: 14.0, // Taille du texte
                      height: 1.5, // Hauteur de la ligne de texte
                    ),
                    controller: passwordController,
                    obscureText: _isObscure,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12, // Padding vertical
                        horizontal: 20, // Padding horizontal
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.0, // Épaisseur de la bordure
                          color: Colors.blue,
                        ),
                        borderRadius:
                            BorderRadius.circular(10), // Rayon de la bordure
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1.0, // Épaisseur de la bordure
                          color: Colors.red,
                        ),
                        borderRadius:
                            BorderRadius.circular(10), // Rayon de la bordure
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black87,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Bouton de connexion
                  ElevatedButton(
                    onPressed: () {
                      // Action à effectuer lors de la connexion
                      print('Connexion en cours...');
                    },
                    child: Text('Se connecter',
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1976D2),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Mot de passe oublié
                  GestureDetector(
                    onTap: () {
                      // Action à effectuer pour la récupération du mot de passe
                      print('Mot de passe oublié ?');
                    },
                    child: const Text(
                      'Mot de passe oublié ?',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
