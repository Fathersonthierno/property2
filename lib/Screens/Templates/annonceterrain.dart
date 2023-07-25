import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:property2/Screens/Templates/annonceappart.dart';
import 'package:property2/library/Common.dart';
import 'package:property2/model/property.dart';
import 'package:property2/model/terrain.dart';

import '../../network/api.provider.dart';

class AnnonceTerrainPage extends StatefulWidget {
  @override
  _AnnonceTerrainPageState createState() => _AnnonceTerrainPageState();
}

class _AnnonceTerrainPageState extends State<AnnonceTerrainPage> {
  // late File imageFile;
  TextEditingController adresseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController typeTerrainController = TextEditingController();
  TextEditingController dimensionController = TextEditingController();
  TextEditingController typeDocumentController = TextEditingController();
  // TextEditingController imagesController = TextEditingController();
  TextEditingController ownerIdController = TextEditingController();
  TextEditingController miseEnVenteOuLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        title: Center(
          child: Text(
            "Terrain", style: TextStyle(
              fontSize: 25,
              color: Colors.black54
          ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     _pickImage();
              //   },
              //   child: Text('Choisir une image'),
              // ),
              // SizedBox(height: 16.0),
              // imageFile != null
              //     ? Image.file(
              //   imageFile,
              //   width: 200.0,
              //   height: 200.0,
              //   fit: BoxFit.cover,
              // )
              // : SizedBox(height: 20,),
              SizedBox(),
              TextFormField(
                controller: adresseController,
                decoration: InputDecoration(
                  hintText: "Adresse",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  filled: true,
                  fillColor: darkGrey,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                ),
              ),SizedBox(height: 10.0,),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  hintText: "Description",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  filled: true,
                  fillColor: darkGrey,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                ),
              ),SizedBox(height: 10.0,),
              // TextFormField(
              //   controller: typeTerrainController,
              //   decoration: InputDecoration(
              //     hintText: "Type terrain",
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(80),
              //       borderSide:
              //       const BorderSide(color: Colors.transparent, width: 0.0),
              //     ),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(80),
              //       borderSide:
              //       const BorderSide(color: Colors.transparent, width: 0.0),
              //     ),
              //     filled: true,
              //     fillColor: darkGrey,
              //     contentPadding:
              //     EdgeInsets.symmetric(horizontal: 17, vertical: 12),),),
              TextFormField(
                controller: miseEnVenteOuLocationController,
                decoration: InputDecoration(
                  hintText: "Mettre en vente ou en location",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  filled: true,
                  fillColor: darkGrey,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                ),
              ),SizedBox(height: 10.0,),
              TextFormField(
                controller: typeDocumentController,
                decoration: InputDecoration(
                  hintText: "Type de document",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  filled: true,
                  fillColor: darkGrey,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                ),
              ),SizedBox(height: 10.0),
              TextFormField(
                controller: dimensionController,
                decoration: InputDecoration(
                  hintText: "Dimension",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(80),
                    borderSide:
                    const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  filled: true,
                  fillColor: darkGrey,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                ),
              ),SizedBox(),


              // TextField(
              //   controller: imagesController,
              //   decoration: InputDecoration(labelText: 'Images'),
              // ),
              // TextField(
              //   controller: ownerIdController,
              //   decoration: InputDecoration(labelText: 'ID du propriétaire'),
              // ),
              SizedBox(height: 40),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: Icon(Icons.camera_alt,
                    color: Colors.deepPurple.shade300,
                    size: 60,
                  ),
                ),
                // child: Image.asset(
                //   'assets/introduction_animation/camera.png',
                //       color: Colors.deepPurple.shade300
                // ),

              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown[100],
                    fixedSize: Size(250, 30.0),
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(35.0)),
                ),
                onPressed: () {
                  save();
                },
                  // save();
                  //     // Créer un nouvel objet Property à partir des données du formulaire
                  //     Property newProperty = Property(
                  //       adresse: adresseController.text,
                  //       description: descriptionController.text,
                  //       type: typeController.text,
                  //       images: imagesController.text.split(','),
                  //       owner: PropertyOwner(id: int.parse(ownerIdController.text)),
                  //     );

                  // Faire quelque chose avec le nouvel objet Property, comme l'envoyer à une API ou le sauvegarder localement

                  // // Réinitialiser les champs du formulaire
                  // adresseController.clear();
                  // descriptionController.clear();
                  // typeController.clear();
                  // // imagesController.clear();
                  // ownerIdController.clear();

                  // Afficher une boîte de dialogue ou une notification pour confirmer l'ajout du bien immobilier
                //   showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         title: Text('Succès'),
                //         content: Text(
                //             'Le bien immobilier a été ajouté avec succès.'),
                //         actions: [
                //           ElevatedButton(
                //             child: Text('OK', style: TextStyle(
                //                 color: Colors.black54
                //             ),),
                //             onPressed: () {
                //               Navigator.of(context).pop();
                //               // save();
                //             },
                //             style: ElevatedButton.styleFrom(
                //                 backgroundColor: Colors.brown[100]
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //   );
                // },
                child: Text('Ajouter', style: TextStyle(
                    color: Colors.black54,
                  fontSize: 20.0,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void save () async {
   Property property =  Property();
   property.adresse=adresseController.text;
   property.description=descriptionController.text;
   // property.type=typeTerrainController.text;

   Terrain terrain = Terrain();
   terrain.dimension = dimensionController.text;
   terrain.miseEnVenteOuLocation = miseEnVenteOuLocationController.text;
   terrain.typedocument = typeDocumentController.text;

   property.terrain = terrain;
   terrain.property=property;
    final response = await ApiProvider.addPropertyToOwner(property.toJson());
    print(response);

  }
}