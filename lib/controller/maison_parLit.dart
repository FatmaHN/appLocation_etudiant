import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:location_pour_etudiants/model/foyer.dart';

class FoyerController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> ajouterFoyer(Foyer foyer) async {
    try {
      // Ajouter le document de foyer
      final foyerDoc = await FirebaseFirestore.instance
          .collection('foyers')
          .add(foyer.toJson());

      // Ajouter les documents de maisonParLit dans la sous-collection
      for (final maison in foyer.maisonsParLit) {
        await foyerDoc.collection('maisonsParLit').add(maison.toJson());
      }
    } catch (e) {
      print('Erreur lors de l\'ajout du foyer : $e');
    }
  }
}
