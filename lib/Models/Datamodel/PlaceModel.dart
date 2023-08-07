import 'dart:convert';

import 'package:flutter/material.dart';

class PlaceModel {
  String title;String statut;
  int rent;
  String imagePath;
  List<String> photoCollections = [
    "assets/images/image1.jpg",
    "assets/images/image2.jpg",
    "assets/images/image3.jpg",
    "assets/images/image4.jpg",
    "assets/images/image5.jpg",
    "assets/images/image6.jpg",
    "assets/images/image7.jpg",
    "assets/images/image8.jpg",
    "assets/images/image9.jpg",
  ];
  PlaceModel({ required this.title,required this.statut ,  required this.rent, required this.imagePath,
  });
}

List<PlaceModel> placeCollection = [
  PlaceModel(
    title: "Havre de paix",
    // details: "4 College Court Holyoke, MA 01040",
    statut: "Acheter ce bien",
    rent: 300000,
    imagePath: "assets/images/image1.jpg",
  ),
  PlaceModel(
    title: "le beau appart",
    statut: "Louer ce bien",
    // details: "221 Filmore St, Princetone, IA",
    rent: 400000,
    imagePath: "assets/images/image4.jpg",
  ),
  PlaceModel(
    title: "La Vie est Belle",
    // details: "4 College Court Holyoke, MA 01040",
    statut: "Louer ce bien",
    rent: 500000,
    imagePath: "assets/images/image5.jpg",
  ),
  PlaceModel(
    title: "La Belle villa",
    statut: "Acheter ce bien",
    // details: "4 College Court Holyoke, MA 01040",
    rent: 600000,
    imagePath: "assets/images/image7.jpg",
  ),
];

class ImageUtils {
  static Image imageFromBase64String(String base64String) {
    return Image.memory(base64Decode(base64String));
  }
}