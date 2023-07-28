import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:property2/library/Common.dart';
import 'package:property2/model/appart.dart';
import 'package:property2/model/property.dart';

import '../../network/api.provider.dart';

class AnnonceAppartPage extends StatefulWidget {
  @override
  _AnnonceAppartPageState createState() => _AnnonceAppartPageState();
}



class _AnnonceAppartPageState extends State<AnnonceAppartPage> {
  bool electriciteSeparee= false;
  bool magasin = false;
  bool electricite = false;
  bool eauSepare = false;
  bool eau = false;
  bool couloir = false;
  // late File imageFile;
  TextEditingController adresseController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController couloirController = TextEditingController();
  TextEditingController eauController = TextEditingController();
  TextEditingController electriciteController = TextEditingController();
  TextEditingController magasinController = TextEditingController();
  TextEditingController nbChambreController = TextEditingController();
  TextEditingController nbCuisineExtController = TextEditingController();
  TextEditingController nbCuisineIntController = TextEditingController();
  TextEditingController nbSalonController = TextEditingController();
  TextEditingController miseEnVenteOuLocationController = TextEditingController();
  TextEditingController extraController = TextEditingController();
  TextEditingController nbtoiletteController = TextEditingController();

  // TextEditingController imagesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        title: Center(
          child: Text(
            " Appart", style: TextStyle(
            fontSize: 25,
            color: Colors.black54
          ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children : [
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
                  // SizedBox(),
                  // input(
                  //   controller: adresseController,
                  //   hintText: 'adresse'),
                  //
                  // input(
                  //   controller: descriptionController,
                  //     hintText: 'description'),
                 ListTile(
                       title: Text("Couloir"),
                   trailing: Switch(
                     onChanged: (bool value) {
                       setState(() {
                         couloir=value;
                       });
                     },
                     value: couloir,
                       activeColor: Colors.deepPurple.shade300
                   ),

                 ),
                  SizedBox(height: 10.0,),
                  ListTile(
                    title: Text("Eau"),
                    trailing: Switch(
                      onChanged: (bool value) {
                        setState(() {
                          eau = value;
                        });
                      },
                      value: eau,
                        activeColor: Colors.deepPurple.shade300
                    ),
                  ),    SizedBox(height: 10.0,),
              ListTile(
                    title: Text("Electricité"),
                trailing: Switch(
                  onChanged: (bool value) {
                    setState(() {
                      electricite = value;
                    });
                  },
                  value: electricite,
                    activeColor: Colors.deepPurple.shade300
                ),
                  ),
                  ListTile(
                    title: Text("Eau separée"),
                   trailing: Switch( onChanged: (bool value) {
                      setState(() {
                        eauSepare=value;
                      });
                    }, value: eauSepare,
                       activeColor: Colors.deepPurple.shade300
                  )
                    // secondary: Icon(Icons.house_outlined),
                  ),     SizedBox(height: 10.0,),
              ListTile(
                    title: Text("Electricité séparée"),
                    trailing: Switch(
                      onChanged: (bool value) {
                        setState(() {
                          electriciteSeparee= value;
                        });
                      },
                      value: electriciteSeparee,
                        activeColor: Colors.deepPurple.shade300
                    ),
                  ),    SizedBox(height: 10.0,),
                  // TextField(
                  //   controller: imagesController,
                  //   decoration: InputDecoration(labelText: 'Images'),
                  // ),
                  ListTile(
                    title: Text("Magasin"),
                    trailing: Switch(
                      onChanged: (bool value) {
                        setState(() {
                          magasin=value;
                        });
                      },
                      value: magasin,
                      activeColor: Colors.deepPurple.shade300,
                    ),
                  ),    SizedBox(height: 10.0,),

                  // input(
                  //   controller: nbChambreController,
                  //     hintText: 'nb de chambre'),

                  TextFormField(
                    controller: nbCuisineIntController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Nb de cuisine intérieure",
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
                      // contentPadding:
                      // EdgeInsets.symmetric(horizontal: 17, vertical: 12),
                  ),
                  ),    SizedBox(height: 10.0,),
              TextFormField(
                    controller: nbCuisineExtController,
                keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Nb de cuisine extérieure",
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
                  ),    SizedBox(height: 10.0,),
              TextFormField(
                    controller: nbSalonController,
                keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Nb de salon",
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
                    controller: nbtoiletteController,
                keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Nb de toilette",
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
                  ),  SizedBox(height: 10.0,),
              TextFormField(
                    controller:miseEnVenteOuLocationController,
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
              ),
                  // ), TextFormField(
                  //   controller: typeAppartController,
                  //   decoration: InputDecoration(
                  //     hintText: "type d ' Appart",
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
                  // ),
                  // ),
                  SizedBox(height: 10.0,),
              TextFormField(
                    controller: extraController,
                    decoration: InputDecoration(
                      hintText: "extra",
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
                  ),
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
                      fixedSize: Size(250, 30.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(35.0)),

                        backgroundColor: Colors.brown[100]
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
                      fontSize: 20.0
                    ),),
                  ),
        ] ),

      ),
    ),

    );

  }
  void save() async{
    Property property = Property();
    property.adresse= adresseController.text;
    property.description= descriptionController.text;
    // property.type= typeAppartController.text;

    Appart appart= Appart();
    appart.magasin = magasin ;
    appart.couloir=couloir;
    appart.eau= eau ;
    appart.eauSeparee=eauSepare;
    appart.electricite=electricite;
    appart.electriciteSeparee=electriciteSeparee;

    appart.nbcuisineInt= int.parse(nbCuisineIntController.text) ;
    appart.nbcuisineExt=int.parse(nbCuisineExtController.text) ;
    appart.nbchambre= int.parse(nbChambreController.text);
    appart.nbsalon= int.parse(nbSalonController.text);
    appart.nbtoilette= int.parse(nbtoiletteController.text);
    appart.miseEnVenteOuLocation= miseEnVenteOuLocationController.text ;
    appart.extra= extraController.text;

    property.appart = appart;
    appart.property = property;
    final response = await ApiProvider.addPropertyToOwner(property.toJson());
    print(response);
  }
}
// Widget input({String? labelText, String? hintText, TextEditingController? controller}) {
//   return Expanded(
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         Padding(
//           padding: EdgeInsets.only(left: 15, bottom: 5),
//           child: Text(
//             labelText.toString(),
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//               color: Colors.black,
//             ),
//           ),
//         ),
//         Padding(
//           padding: EdgeInsets.only(left: 8, right: 8, bottom: 15),
//           child: TextFormField(
//             controller: controller,
//             decoration: InputDecoration(
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(80),
//                 borderSide:
//                 const BorderSide(color: Colors.transparent, width: 0.0),
//               ),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(80),
//                 borderSide:
//                 const BorderSide(color: Colors.transparent, width: 0.0),
//               ),
//               // disabledBorder: new InputBorder(borderSide: BorderSide.none),
//               hintStyle: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
//               filled: true,
//               fillColor: darkGrey,
//               contentPadding:
//               EdgeInsets.symmetric(horizontal: 17, vertical: 12),
//
//               hintText: hintText,
//             ),
//           ),
//         ),
//       ],
//     ),
//   );
// }