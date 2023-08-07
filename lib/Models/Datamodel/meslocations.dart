class MesLocations {
  String dureeDeLocation; String dateDedebut;
  String dateDeFin;
  //
  MesLocations({ required this.dureeDeLocation,required this.dateDedebut ,  required this.dateDeFin,
  });
}

class LocationProvider {
  static final locationData = [
    MesLocations(dureeDeLocation: "3 ans" , dateDedebut: "22:08:2023", dateDeFin: "15:05:26")
  ];

}

class Attachment {
  String piece;
  DateTime date;
  String pieceContentType;
  String type;
  String name;

  // Constructeur
  Attachment(this.piece,
   this.date, this.pieceContentType,
   this.type,
   this.name,
  );
}
