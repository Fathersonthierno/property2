
import 'package:property2/model/niveau.dart';
import 'package:property2/model/property.dart';

class Maison {
int? id;
Property? property;
List<Niveau>? niveaux;
String? dimension;
String? miseEnVenteOuLocation ;
String? typeDocment;
bool? garage;
int? capaciteGarage;
bool? cour;

Maison({
  this.id,
  this.property,
  this.niveaux,
  this.dimension,
  this.typeDocment,
  this.garage,
  this.capaciteGarage,
  this.cour,
  this.miseEnVenteOuLocation
});

factory Maison.fromJson(Map<String, dynamic> json) => Maison(
id: json["id"],
property: json["property"] == null ? null : Property.fromJson(json["property"]),
niveaux: json["niveaux"] == null ? [] : List<Niveau>.from(json["niveaux"]!.map((x) => Niveau.fromJson(x))),
dimension: json["dimension"],
typeDocment: json["typeDocment"],
garage: json["garage"],
capaciteGarage: json["capaciteGarage"],
cour: json["cour"],
miseEnVenteOuLocation: json["miseEnVenteOuLocation"],
);

Map<String, dynamic> toJson() => {
"id": id,
"property": property?.toJson(),
"niveaux": niveaux == null ? [] : List<dynamic>.from(niveaux!.map((x) => x.toJson())),
"dimension": dimension,
"typeDocment": typeDocment,
"garage": garage,
"capaciteGarage": capaciteGarage,
"cour": cour,
"miseEnVenteOuLocation": miseEnVenteOuLocation,
};
}