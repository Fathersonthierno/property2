import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property2/Models/Datamodel/meslocations.dart';
import 'package:property2/model/operation.dart';
import 'package:property2/network/api.provider.dart';

class LocationCard extends StatelessWidget {
  LocationCard({super.key , required this.mesLocations});

  final MesLocations mesLocations ;


  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.all(20.0),
      color: Colors.deepPurple.shade100,
        elevation: 10.0, // Définir l'élévation de la carte (ombre)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Définir les coins arrondis de la carte
    child: Padding(
    padding: const EdgeInsets.all(15.0), // Ajouter un peu de marge interne pour les éléments
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Text("Bien loué",
        style: TextStyle(fontSize: 24 ,fontWeight:  FontWeight.bold ,
        color: Colors.black87),),
      ),
      SizedBox(height: 8,),
      Text("Détails:",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 26.0,
            fontStyle: FontStyle.italic,
            color: Colors.black87,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold
        ),
      ),
    SizedBox(height: 20.0,),
    Row(
      children: [
      Text(
      'Durée de location:',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    SizedBox(width: 10.0,),
    Text(
    mesLocations.dureeDeLocation,
    style: TextStyle(fontSize: 18 ,),
    ),
   ], ),
    SizedBox(height: 12), // Ajouter un peu d'espace vertical entre les éléments
    Row(
      children: [Text(
      'Date de début:',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10.0,),
    Text(
   mesLocations.dateDedebut,
    style: TextStyle(fontSize: 18),
    ),
    ],),
    SizedBox(height: 12), // Ajouter un peu d'espace vertical entre les éléments
    Row(
      children: [
      Text(
      'Date de fin:',
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      SizedBox(width: 10.0,),
    Text(
    mesLocations.dateDeFin,
    style: TextStyle(fontSize: 18),
    )]),
    ],
    ),
    ),
    );
  }
  // void save () async {
  //
  //   Operation operation = Operation();
  //   operation.datedfin;
  //   operation.datedebut;
  //
  //   final response = await ApiProvider.getOperation(jsonDecode(r)));
  //   print(response);
  //
  //
  // }
}

