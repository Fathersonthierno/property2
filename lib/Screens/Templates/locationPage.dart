import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:property2/Models/Datamodel/meslocations.dart';
import 'package:property2/model/operation.dart';
import 'package:property2/model/property.dart';
import 'package:property2/network/api.provider.dart';

import '../../library/Common.dart';



class LocationPage extends StatefulWidget {
 final Property? property ;

  const LocationPage({Key?key, required this.property}): super(key: key);
  @override
  _LocationPageState createState(
      ) => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationProvider locationProvider = LocationProvider();

  bool _formSubmitted = false;

  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

// void sub(){
//   locationProvider.meslocations.add(MesLocations(dureeDeLocation: dureeLocationController.text, dateDedebut: dateDebutController.text, dateDeFin: dateFinController.text));
// }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Page de location')),
        backgroundColor: Colors.deepPurple.shade300,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Formulaire de demande de location
        //
        //             controller: dureeLocationController
        //             // onTap: () async {
        //             //   DateTime? duration = await showDatePicker(context: context,
        //             //       initialDate: DateTime.now(),
        //             //       firstDate: DateTime(2000),
        //             //       lastDate: DateTime(2101)
        //             //       lastDate: DateTime(2101)
        //             //   );
        //             //   if (duration != null){
        //             //
        //             //     setState(() {
        //             //       dureeLocationController.text = DateFormat("yyyy-MM-dd").format(duration);
        //             //
        //             //     });
        //             //   }else
        //             //     print("pas selectionné");
        //             // },
        //           ),SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Date de début',
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
                 icon: Icon(Icons.calendar_today)
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer la date de début';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    controller: dateDebutController,
                    onTap: () async {
                      DateTime? duration = await showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101)
                      );
                      if (duration != null){
                        setState(() {
                          dateDebutController.text = DateFormat("yyyy-MM-dd").format(duration);

                        });
                      }
                    },
                  ), SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(hintText: 'date de fin',
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

                        icon: Icon(Icons.calendar_today)   ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer la date de fin';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.datetime,
                    controller: dateFinController,
                    onTap: () async {
                      DateTime? duration = await showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101)


                      );
                      if (duration != null){
                        setState(() {
                          dateFinController.text = DateFormat("yyyy-MM-dd").format(duration);

                        });
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
      TextFormField(
                    decoration: InputDecoration(hintText: 'Description',
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
                      icon: Icon(Icons.text_fields)
                    ),
        controller: descriptionController ,
      ),SizedBox(height: 30.0,),
            ElevatedButton(

              onPressed: () {
save();
                  // Afficher la boîte de dialogue de confirmation
                  _showConfirmationDialog();
                },

              child: Text('Envoyer la demande'
              , style: TextStyle(
                  fontSize: 18.0
                ),),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade300
              ),
            ),


          ],
              ),
            ),
    );
  }
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmation de demande'),
        content: Text('Merci d\'avoir soumis votre demande de location. Notre équipe vous contactera sous peu pour planifier une visite du bien. Nous vous invitons également à passer à notre agence pour discuter des détails de la location et finaliser le contrat.'),
        actions: [
          ElevatedButton(
style: ElevatedButton.styleFrom(
  backgroundColor: Colors.deepPurple.shade300
),
            onPressed: () {
              Navigator.pop(context); // Ferme la boîte de dialogue
            },
            child: Text('OK'
            ,style: TextStyle(
                color: Colors.white,
              ),),
          ),
        ],
      ),
    );
  }

void save () async {
    Operation operation = Operation();
    operation.datedebut= DateTime.tryParse(dateDebutController.text);
    operation.datedfin= DateTime.tryParse(dateFinController.text);

    final response = await ApiProvider.addOperation(operation.toJson());
    print(response);


}

}


