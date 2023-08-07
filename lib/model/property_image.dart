import 'package:property2/model/property.dart';

class PropertyImage {
  int? id;
  dynamic piece;
  String? name;
  String? pieceContentType;
  String? description;
  DateTime? date;
  // Property? property;

  PropertyImage({
    this.id,
    this.piece,
    this.name,
    this.pieceContentType,
    this.description,
    this.date,
    // this.property,
  });

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
    id: json["id"],
    piece: json["piece"],
    name: json["name"],
    pieceContentType: json["pieceContentType"],
    description: json["description"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    // property: json["property"] == null ? null : Property.fromJson(json["property"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "piece": piece,
    "name": name,
    "pieceContentType": pieceContentType,
    "description": description,
    "date": date?.toIso8601String(),
    // "property": property?.toJson(),
  };
}