
import 'package:property2/model/property.dart';
import 'package:property2/model/user.dart';

class PropertyOwner {
  int? id;
  String? code;
  int? nbbien;
  String? pieceidentite;
  String? justificatifs;
  User? user;
  List<Property>? properties;
  bool? authorizedToUpdateProperty;
  bool? authorizedToAddProperty;
  bool? authorizedToDeleteProperty;

  PropertyOwner({
    this.id,
    this.code,
    this.nbbien,
    this.pieceidentite,
    this.justificatifs,
    this.user,
    this.properties,
    this.authorizedToUpdateProperty,
    this.authorizedToAddProperty,
    this.authorizedToDeleteProperty,
  });

  factory PropertyOwner.fromJson(Map<String, dynamic> json) => PropertyOwner(
    id: json["id"],
    code: json["code"],
    nbbien: json["nbbien"],
    pieceidentite: json["pieceidentite"],
    justificatifs: json["justificatifs"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    properties: json["properties"] == null ? [] : List<Property>.from(json["properties"]!.map((x) => Property.fromJson(x))),
    authorizedToUpdateProperty: json["authorizedToUpdateProperty"],
    authorizedToAddProperty: json["authorizedToAddProperty"],
    authorizedToDeleteProperty: json["authorizedToDeleteProperty"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "nbbien": nbbien,
    "pieceidentite": pieceidentite,
    "justificatifs": justificatifs,
    "user": user?.toJson(),
    "properties": properties == null ? [] : List<dynamic>.from(properties!.map((x) => x.toJson())),
    "authorizedToUpdateProperty": authorizedToUpdateProperty,
    "authorizedToAddProperty": authorizedToAddProperty,
    "authorizedToDeleteProperty": authorizedToDeleteProperty,
  };
}