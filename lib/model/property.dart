// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

import 'package:property2/model/appart.dart';
import 'package:property2/model/maison.dart';
import 'package:property2/model/operation.dart';
import 'package:property2/model/property_image.dart';
import 'package:property2/model/property_owner.dart';
import 'package:property2/model/terrain.dart';

List<Property> propertyFromJson(String str) => List<Property>.from(json.decode(str).map((x) => Property.fromJson(x)));

String propertyToJson(List<Property> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Property {
  int? id;
  Maison? maison;
  Appart? appart;
  Terrain? terrain;
  String? adresse;
  int? prix;
  String? titre;
  String? statut;
  String? description;
  String? type;
  PropertyOwner? owner;
  List<Operation>? operations;
  List<PropertyImage>? images;

  Property({
    this.id,
    this.maison,
    this.appart,
    this.terrain,
    this.adresse,
    this.description,
    this.type,
    this.owner,
    this.operations,
    this.images,
    this.prix,
    this.titre,
    this.statut
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    maison: json["maison"] == null ? null : Maison.fromJson(json["maison"]),
    appart: json["appart"] == null ? null : Appart.fromJson(json["appart"]),
    terrain: json["terrain"] == null ? null : Terrain.fromJson(json["terrain"]),
    adresse: json["adresse"],
    prix: json["prix"],
    titre: json["titre"],
    statut: json["statut"],
    description: json["description"],
    type: json["type"],
    owner: json["owner"] == null ? null : PropertyOwner.fromJson(json["owner"]),
    operations: json["operations"] == null ? [] : List<Operation>.from(json["operations"]!.map((x) => Operation.fromJson(x))),
    images: json["images"] == null ? [] : List<PropertyImage>.from(json["images"]!.map((x) => PropertyImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "maison": maison?.toJson(),
    "appart": appart?.toJson(),
    "terrain": terrain?.toJson(),
    "adresse": adresse,
    "prix": prix,
    "titre": titre,
    "statut": statut,
    "description": description,
    "type": type,
    "owner": owner?.toJson(),
    "operations": operations == null ? [] : List<dynamic>.from(operations!.map((x) => x.toJson())),
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
  };
}