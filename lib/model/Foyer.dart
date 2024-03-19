class Foyer {
  String? id;
  String adresse;
  String description;
  bool contrat;
  String genre;
  String typeLocation;
  List<MaisonParLit> maisonsParLit;

  Foyer({
    required this.adresse,
    required this.description,
    required this.contrat,
    required this.genre,
    required this.typeLocation,
    required this.maisonsParLit,
  });

  factory Foyer.fromJson(Map<String, dynamic> json) {
    return Foyer(
      adresse: json['adresse'],
      description: json['description'],
      contrat: json['contrat'],
      genre: json['genre'],
      typeLocation: json['typeLocation'],
      maisonsParLit: (json['maisonsParLit'] as List)
          .map((maison) => MaisonParLit.fromJson(maison))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adresse': adresse,
      'description': description,
      'contrat': contrat,
      'genre': genre,
      'typeLocation': typeLocation,
      'maisonsParLit': maisonsParLit.map((maison) => maison.toJson()).toList(),
    };
  }
}

class MaisonParLit {
  DateTime dateDispo;
  int nbLits;

  MaisonParLit({
    required this.dateDispo,
    required this.nbLits,
  });

  factory MaisonParLit.fromJson(Map<String, dynamic> json) {
    return MaisonParLit(
      dateDispo: DateTime.parse(json['dateDispo']),
      nbLits: json['nbLits'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dateDispo': dateDispo.toIso8601String(),
      'nbLits': nbLits,
    };
  }
}
