import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../library/Common.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {

  bool _formSubmitted = false;

  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController dureeLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page de location'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Formulaire de demande de location
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Durée de location souhaitée',
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
                    controller: dureeLocationController,
                    onTap: () async {
                      DateTime? duration = await showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2101)
                      );
                      if (duration != null){
                        String formateddate = DateFormat("yyyy-mm-dd").format(duration);
                        setState(() {
                          dureeLocationController.text = formateddate.toString();

                        });
                      }else
                        print("pas selectionné");
                    },
                  ),SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Date de début',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer la date de début';
                      }
                      return null;
                    },
                    controller: dateDebutController,
                    onTap: () async {
                      DateTime? duration = await showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2000)
                      );
                      if (duration != null){
                        String formateddate = DateFormat("yyyy-mm-dd").format(duration);
                        setState(() {
                          dateDebutController.text = formateddate.toString();

                        });
                      }
                    },
                  ), SizedBox(height: 16.0,),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'date de début',
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Veuillez entrer la date de fin';
                      }
                      return null;
                    },
                    controller: dateFinController,
                    onTap: () async {
                      DateTime? duration = await showDatePicker(context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2000)
                      );
                      if (duration != null){
                        String formateddate = DateFormat("yyyy-mm-dd").format(duration);
                        setState(() {
                          dateFinController.text = formateddate.toString();

                        });
                      }
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {

                    },
                    child: Text('Envoyer la demande'),
                  ),
                  SizedBox(height: 16.0),
                  // Affichage du message de confirmation après soumission du formulaire
                  if (_formSubmitted)
                    Text(
                      'Merci d\'avoir soumis votre demande de location. Notre équipe vous contactera sous peu pour planifier une visite du bien. Nous vous invitons également à passer à notre agence pour discuter des détails de la location et finaliser le contrat.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                ],
              ),
            ),
    );
  }
}

