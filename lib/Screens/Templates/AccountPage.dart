import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:property2/Screens/Templates/annonceappart.dart';
import 'package:property2/Screens/Templates/annoncemaison.dart';
import 'package:property2/Screens/Templates/annonceterrain.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:property2/network/api.provider.dart';


class AddPropertyPage extends StatefulWidget {
  @override
  _AddPropertyPageState createState() => _AddPropertyPageState();
}

class _AddPropertyPageState extends State<AddPropertyPage> {
  // late File imageFile;
  // TextEditingController adresseController = TextEditingController();
  // TextEditingController descriptionController = TextEditingController();
  // TextEditingController typeController = TextEditingController();
  // // TextEditingController imagesController = TextEditingController();
  // TextEditingController ownerIdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[100],
        title: Center(
          child: Text('veuillez choisir une option :'
              , style: TextStyle(
              color: Colors.black54
          ),),
        ),
      ),
  body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children:[
        // Stack(
          GestureDetector(
          onTap: () => Navigator.push(context,
          MaterialPageRoute(builder:
          (context) =>AnnonceMaisonPage(),)
          ),
            child: Container(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  "Maison",style: TextStyle(
                  color: Colors.black54
                ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.brown[100],
                borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade500,
                      offset: Offset(6, 6),
                      blurRadius: 15,
                      spreadRadius: 1,

              ),
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(-6, -6),
                      blurRadius: 15,
                      spreadRadius: 1,

                    )
                  ]
              ),
         ),
          ),
          // SizedBox(height: 15,),
          GestureDetector(
          onTap: () => Navigator.push(context,
          MaterialPageRoute(builder:
          (context) =>AnnonceAppartPage(),)
          ),
            child: Container(
            height: 100,
            width: 100,
              child: Center(
                child: Text(
                  "Appartement",style: TextStyle(
                    color: Colors.black54
                ),
                ),
              ),
            decoration: BoxDecoration(
                color: Colors.brown[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,

                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-6, -6),
                    blurRadius: 15,
                    spreadRadius: 1,

                  )
                ]

            ),
            ),
          ),
        // SizedBox(height: 15,),
          GestureDetector(
            onTap: () => Navigator.push(context,
              MaterialPageRoute(builder:
                  (context) =>AnnonceTerrainPage(),
    )),
            child: Container(
            height: 100,
            width: 100,
              child: Center(
                child: Text(
                  "Terrain",style: TextStyle(
                    color: Colors.black54
                ),
                ),
              ),
            decoration: BoxDecoration(
                color: Colors.brown[100],
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    offset: Offset(6, 6),
                    blurRadius: 15,
                    spreadRadius: 1,

                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-6, -6),
                    blurRadius: 15,
                    spreadRadius: 1,

                  )
                ]

            ),),
          ),
    ]),
  )) ;
  }
}

  //

