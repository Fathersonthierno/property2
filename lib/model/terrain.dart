
import 'package:property2/model/property.dart';

class Terrain {
  int? id;
  Property? property;
  String? typeterrain;
  String? dimension;
  String? typedocument;

  Terrain({
    this.id,
    this.property,
    this.typeterrain,
    this.dimension,
    this.typedocument,
  });

  factory Terrain.fromJson(Map<String, dynamic> json) => Terrain(
    id: json["id"],
    property: json["property"] == null ? null : Property.fromJson(json["property"]),
    typeterrain: json["typeterrain"],
    dimension: json["dimension"],
    typedocument: json["typedocument"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "property": property?.toJson(),
    "typeterrain": typeterrain,
    "dimension": dimension,
    "typedocument": typedocument,
  };
}