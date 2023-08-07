import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:property2/model/operation.dart';

import '../../library/Common.dart';
import '../../model/property.dart';
import '../../network/api.provider.dart';



class AchatPage extends StatefulWidget {
  final Property property;
  AchatPage({required this.property});

  @override
  _AchatPageState createState() => _AchatPageState();
}

class _AchatPageState extends State<AchatPage> {

  bool _formSubmitted = false;
String ? dropdownValue ;
  TextEditingController dateAchatSouhaiteeController = TextEditingController();
  TextEditingController typePaiementController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Widget inputDropDown({String? labelText, String? hintText , TextEditingController? controller}) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 15, bottom: 5),
            child: Text(
              labelText.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(left: 8, right: 8, bottom: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    border: Border.all(color: Colors.transparent, width: 0.0),
                    color: darkGrey

                ),
                width: 400,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: <String>['En cash', 'Virement bancaire','Orange money','mobile money'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: dropdownValue,
                    onChanged: (String? val) {
                      setState(() {
                        dropdownValue = val ;
                      });
                    },
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Center(child:
            Text("Page d\'Achat")),
              backgroundColor: Colors.deepPurple.shade300,
            ),
            body: SingleChildScrollView(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                // Formulaire de demande de location
                TextFormField(
                decoration: InputDecoration(hintText: 'Date d\'achat souhaitée',
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
                controller: dateAchatSouhaiteeController
                ),SizedBox(height: 15.0,),
                      Row(
                        children: [
                        inputDropDown(hintText: "Type de paiment",
                        labelText: "Type de paiement",
                        controller: typePaiementController),
                     ], ),SizedBox(height: 10.0,),
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
                        controller: descriptionController,
                      ),
    ],)
            )
        );
  }
  void save () async {
    Operation operation = Operation();
    operation.datedebut= DateTime.tryParse(dateAchatSouhaiteeController.text);
    operation.typepaiement= typePaiementController.text;

    final response = await ApiProvider.addOperation(operation.toJson());
    print(response);

  }
}