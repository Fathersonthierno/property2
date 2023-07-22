
import 'package:property2/model/maison.dart';

class Niveau {
  int? id;
  int? nbchambre;
  int? nbsalon;
  int? nbcuisineInt;
  int? nbcuisineExt;
  int? nbtoilette;
  bool? couloir;
  bool? magasin;
  bool? eau;
  bool? electricite;
  Maison? maison;
  String? nom;

  Niveau({
    this.id,
    this.nbchambre,
    this.nbsalon,
    this.nbcuisineInt,
    this.nbcuisineExt,
    this.nbtoilette,
    this.couloir,
    this.magasin,
    this.eau,
    this.electricite,
    this.maison,
    this.nom,
  });

  factory Niveau.fromJson(Map<String, dynamic> json) => Niveau(
    id: json["id"],
    nbchambre: json["nbchambre"],
    nbsalon: json["nbsalon"],
    nbcuisineInt: json["nbcuisineInt"],
    nbcuisineExt: json["nbcuisineExt"],
    nbtoilette: json["nbtoilette"],
    couloir: json["couloir"],
    magasin: json["magasin"],
    eau: json["eau"],
    electricite: json["electricite"],
    maison: json["maison"] == null ? null : Maison.fromJson(json["maison"]),
    nom: json["nom"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nbchambre": nbchambre,
    "nbsalon": nbsalon,
    "nbcuisineInt": nbcuisineInt,
    "nbcuisineExt": nbcuisineExt,
    "nbtoilette": nbtoilette,
    "couloir": couloir,
    "magasin": magasin,
    "eau": eau,
    "electricite": electricite,
    "maison": maison?.toJson(),
    "nom": nom,
  };
}