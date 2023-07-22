import 'package:property2/model/type_utilisateur.dart';

class User {
  int? id;
  String? nom;
  String? prenom;
  DateTime? dateNaissance;
  TypeUtilisateur? typeutilisateur;
  String? email;
  String? telephone;
  String? adresse;
  String? ville;
  String? contacturgence;

  User({
    this.id,
    this.nom,
    this.prenom,
    this.dateNaissance,
    this.typeutilisateur,
    this.email,
    this.telephone,
    this.adresse,
    this.ville,
    this.contacturgence,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    nom: json["nom"],
    prenom: json["prenom"],
    dateNaissance: json["dateNaissance"] == null ? null : DateTime.parse(json["dateNaissance"]),
    typeutilisateur: json["typeutilisateur"] == null ? null : TypeUtilisateur.fromJson(json["typeutilisateur"]),
    email: json["email"],
    telephone: json["telephone"],
    adresse: json["adresse"],
    ville: json["ville"],
    contacturgence: json["contacturgence"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nom": nom,
    "prenom": prenom,
    "dateNaissance": dateNaissance?.toIso8601String(),
    "typeutilisateur": typeutilisateur?.toJson(),
    "email": email,
    "telephone": telephone,
    "adresse": adresse,
    "ville": ville,
    "contacturgence": contacturgence,
  };
}