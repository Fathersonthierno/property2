class PropertyImage {
  int? id;
  dynamic piece;
  String? name;
  String? pieceContentType;
  String? description;
  DateTime? date;

  PropertyImage({
    this.id,
    this.piece,
    this.name,
    this.pieceContentType,
    this.description,
    this.date,
  });

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
    id: json["id"],
    piece: json["piece"],
    name: json["name"],
    pieceContentType: json["pieceContentType"],
    description: json["description"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "piece": piece,
    "name": name,
    "pieceContentType": pieceContentType,
    "description": description,
    "date": date?.toIso8601String(),
  };
}