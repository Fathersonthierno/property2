import 'package:property2/model/maison.dart';
import 'package:property2/model/property.dart';

class Appart {
  int? id;
  Property? property;
  int? nbchambre;
  int? nbsalon;
  int? nbcuisineInt;
  int? nbcuisineExt;
  int? nbtoilette;
  bool? couloir;
  bool? magasin;
  bool? eau;
  bool? eauSeparee;
  bool? electricite;
  bool? electriciteSeparee;
  String? miseEnVenteOuLocation ;
  String? extra ;

  Appart({
    this.id,
    this.property,
    this.nbchambre,
    this.nbsalon,
    this.nbcuisineInt,
    this.nbcuisineExt,
    this.nbtoilette,
    this.couloir,
    this.magasin,
    this.eau,
    this.electricite,
    this.eauSeparee,
    this.electriciteSeparee,
    this.extra,
    this.miseEnVenteOuLocation,
  });

  factory Appart.fromJson(Map<String, dynamic> json) => Appart(
    id: json["id"],
    property: json["property"] == null ? null : Property.fromJson(json["property"]),
    nbchambre: json["nbchambre"],
    nbsalon: json["nbsalon"],
    nbcuisineInt: json["nbcuisineInt"],
    nbcuisineExt: json["nbcuisineExt"],
    nbtoilette: json["nbtoilette"],
    couloir: json["couloir"],
    magasin: json["magasin"],
    eau: json["eau"],
    eauSeparee: json["eauSeparee"],
    electricite: json["electricite"],
    electriciteSeparee: json["electriciteSeparee"],
    extra: json["extra"],
    miseEnVenteOuLocation: json["miseEnVenteOuLocation"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "property": property?.toJson(),
    "nbchambre": nbchambre,
    "nbsalon": nbsalon,
    "nbcuisineInt": nbcuisineInt,
    "nbcuisineExt": nbcuisineExt,
    "nbtoilette": nbtoilette,
    "couloir": couloir,
    "magasin": magasin,
    "eau": eau,
    "eauSeparee": eauSeparee,
    "electricite": electricite,
    "electriciteSeparee": electriciteSeparee,
    "extra": extra,
    "miseEnVenteOuLocation": miseEnVenteOuLocation,
  };
}