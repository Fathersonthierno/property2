import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../library/Common.dart';



class AchatPage extends StatefulWidget {
  @override
  _AchatPageState createState() => _AchatPageState();
}

class _AchatPageState extends State<AchatPage> {

  bool _formSubmitted = false;

  TextEditingController dateDebutController = TextEditingController();
  TextEditingController dateFinController = TextEditingController();
  TextEditingController dureeLocationController = TextEditingController();


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

                )
            )
        );
  }
}