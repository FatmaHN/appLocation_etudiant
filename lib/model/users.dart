import 'package:firebase_auth/firebase_auth.dart';

class user {
  final String nom;
  final String email;
  final String numeroTelephone;
  final String role;
  final String motDePasse;

  user({
    required this.nom,
    required this.email,
    required this.numeroTelephone,
    required this.role,
    required this.motDePasse,
  });
}