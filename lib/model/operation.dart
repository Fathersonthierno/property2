class Operation {
  int? id;
  DateTime? datedebut;
  DateTime? datedfin;
  DateTime? datedemodification;
  DateTime? datecreation;
  String? typepaiement;
  int? prix;
  String? type;

  Operation({
    this.id,
    this.datedebut,
    this.datedfin,
    this.datedemodification,
    this.datecreation,
    this.typepaiement,
    this.prix,
    this.type,
  });

  factory Operation.fromJson(Map<String, dynamic> json) => Operation(
    id: json["id"],
    datedebut: json["datedebut"] == null ? null : DateTime.parse(json["datedebut"]),
    datedfin: json["datedfin"] == null ? null : DateTime.parse(json["datedfin"]),
    datedemodification: json["datedemodification"] == null ? null : DateTime.parse(json["datedemodification"]),
    datecreation: json["datecreation"] == null ? null : DateTime.parse(json["datecreation"]),
    typepaiement: json["typepaiement"],
    prix: json["prix"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "datedebut": datedebut?.toIso8601String(),
    "datedfin": datedfin?.toIso8601String(),
    "datedemodification": datedemodification?.toIso8601String(),
    "datecreation": datecreation?.toIso8601String(),
    "typepaiement": typepaiement,
    "prix": prix,
    "type": type,
  };
}