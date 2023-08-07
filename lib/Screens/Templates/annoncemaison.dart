
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:path/path.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property2/library/Common.dart';
import 'package:property2/model/maison.dart';
import 'package:property2/model/property.dart';
import 'package:property2/model/property_image.dart';
import 'package:property2/network/utils.dart';

import '../../Models/Datamodel/meslocations.dart';
import '../../network/api.provider.dart';

class AnnonceMaisonPage extends StatefulWidget {
  @override
  _AnnonceMaisonPageState createState() => _AnnonceMaisonPageState();
}

class _AnnonceMaisonPageState extends State<AnnonceMaisonPage> {
  bool garage = false ;
  bool cour = false ;

  // late List<File> images;
  //
  // if (images != null) {
  // for (int i = 0; i < images.length; i++) {
  // Uint8List imgbytes = await image[i].readAsBytes();
  // String bs4str = base64.encode(imgbytes);
  // Attachment identityDocAttachment = new Attachment();
  // imageAttachment.piece = bs4str;
  // imageAttachment.date = DateTime.now();
  // imageAttachment.pieceContentType = image.extension;
  // imageAttachment.type = 'identity_doc';
  // imageAttachment.name = 'image 1';
  // Property.images.add(imageAttachment);
  // }
  // }
  // late File imageFile;
  TextEditingController adresseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController capaciteGarageController = TextEditingController();
  TextEditingController courController = TextEditingController();
  TextEditingController dimensionController = TextEditingController();
  TextEditingController garageController = TextEditingController();
  TextEditingController typeDocumentController = TextEditingController();
  TextEditingController titreController = TextEditingController();
  TextEditingController prixController = TextEditingController();
  TextEditingController miseEnVenteOuLocationController = TextEditingController();

   List<File> images = [];

   // if (images != null) {
   //   for (int i = 0; i < images.length; i++) {
   //     Uint8List imgbytes = await images[i].readAsBytes();
   //     String bs4str = base64.encode(imgbytes);
   //     Attachment identityDocAttachment = new Attachment();
   //     imageAttachment.piece = bs4str;
   //     imageAttachment.date = DateTime.now();
   //     imageAttachment.pieceContentType = image.extension;
   //     imageAttachment.type = 'identity_doc';
   //     imageAttachment.name = 'image 1';
  // TextEditingController imagesController = TextEditingController();
  // TextEditingController ownerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        title: Center(
          child: Text(
            "Maison",
                style: TextStyle(
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
              ), TextFormField(
                controller: adresseController,
                decoration: InputDecoration(
                  hintText: "Titre",
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
              //   controller: typeMaisonController,
              //   decoration: InputDecoration(
              //     hintText: "Type de maison",
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
              //     EdgeInsets.symmetric(horizontal: 17, vertical: 12),
              //   ),
              // ),
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
              ),TextFormField(
                controller: prixController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Prix",
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
              ),SizedBox(height: 10.0,),
              ListTile(
                title: Text("Garage"),
                trailing: Switch(
                  onChanged: (bool value) {
                    setState(() {
                      garage=value;
                    });
                  },
                  value: garage,
                    activeColor: Colors.deepPurple.shade300
                ),
              ),SizedBox(height: 10.0,),
              TextFormField(
                controller: capaciteGarageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Capacité du garage",
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
              ListTile(
                title: Text("Cour"),
                trailing: Switch(
                  onChanged: (bool value) {
                    setState(() {
                      cour = value;

                    });
                  },
                  value: cour,
                    activeColor: Colors.deepPurple.shade300
                ),
              ),


              // TextField(
              //   controller: imagesController,
              //   decoration: InputDecoration(labelText: 'Images'),
              // ),
              // TextField(
              //   controller: ownerIdController,
              //   decoration: InputDecoration(labelText: 'ID du propriétaire'),
              // ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: (){
                      chooseImages();
                    },
                    child: Icon(Icons.camera_alt,
                      color: Colors.deepPurple.shade300,
                      size: 60,
                    ),
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
                  //     // Créer un nouvel objet Property à partir des données du formulaire
                  //     Property newProperty = Property(
                  //       adresse: adresseController.text,
                  //       description: descriptionController.text,
                  //       type: typeController.text,
                  //       images: imagesController.text.split(','),
                  //       owner: PropertyOwner(id: int.parse(ownerIdController.text)),
                  //     );

                  // Faire quelque chose avec le nouvel objet Property, comme l'envoyer à une API ou le sauvegarder localement

                  // Réinitialiser les champs du formulaire
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
                //               save();
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
                  fontSize: 20.0

                ),),
              ),
            ],
          ),
        ),
      ),
    );

  }
  void save () async {
    Property property = Property();
    property.adresse= adresseController.text;
    property.description= descriptionController.text;
    property.titre = titreController.text;
    property.prix = int.parse(prixController.text);
    property.statut= miseEnVenteOuLocationController.text;
    // property.type= typeMaisonController.text;
    
    Maison maison = Maison();
    maison.cour=cour;
    maison.garage=garage;
    maison.capaciteGarage= int.parse(capaciteGarageController.text);
    maison.typeDocment= typeDocumentController.text;
    maison.dimension= dimensionController.text;

    if (images != null) {
      List<PropertyImage> propertyImages = [];
      for (int i = 0; i < images.length; i++) {
        File image = images[0];
        Uint8List imgbytes = await image.readAsBytes();
        String bs4str = base64.encode(imgbytes);
        PropertyImage img = new PropertyImage();
        img.piece = bs4str;
        img.date = DateTime.now();
        img.pieceContentType = image.extension;
        img.name = 'image '+ i.toString();
        propertyImages.add(img);
      }
      property.images = propertyImages;
    }
    property.maison = maison ;
    print(property.toJson());
    // maison.property= property;
    final response = await ApiProvider.addPropertyToOwner(property.toJson());
    print(response);

  }
  chooseImages() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
  type: FileType.custom,
  allowedExtensions: ['doc', 'docx', 'jpg', 'png', 'pdf'],
  allowMultiple: true,
  );

  if (result != null) {
  result.files.forEach((element) {
  setState(() {
  images.add(File(element.path!));
  });
  });
  }
  }

}


// Future _pickImage() async {
//   final picker = ImagePicker();
//   final pickedImage = await picker.getImage(source: ImageSource.gallery);
//
//   if (pickedImage != null) {
//     setState(() {
//        imageFile = File(pickedImage.path);
//     });
//   }
//   }
//
//
//