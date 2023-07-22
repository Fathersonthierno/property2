class TypeUtilisateur {
  int? id;
  String? type;
  dynamic description;

  TypeUtilisateur({
    this.id,
    this.type,
    this.description,
  });

  factory TypeUtilisateur.fromJson(Map<String, dynamic> json) => TypeUtilisateur(
    id: json["id"],
    type: json["type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "description": description,
  };
}