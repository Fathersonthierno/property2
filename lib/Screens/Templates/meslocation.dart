
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property2/Models/Datamodel/meslocations.dart';
import 'package:property2/Screens/Templates/locationcard.dart';
import 'package:property2/model/operation.dart';
import 'package:property2/network/api.provider.dart';

class MesLocations extends StatefulWidget {

  @override
  State<MesLocations> createState() => _MesLocationsState();
}

class _MesLocationsState extends State<MesLocations> {

  List<Operation> operation = [];

  @override
  void initState() {
    // TODO: implement initState
    loadData();
    super.initState();
  }

  void loadData() async{
    var data = [];
    ApiProvider.getOperation(data).then((value) => {
      data = jsonDecode(value.body),
      setState((){
        operation = List<Operation>.from(data.map((x) => Operation.fromJson(x)));

      })
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: ListView.builder(
        itemCount: LocationProvider.locationData.length,
        itemBuilder: (context, index) {
          return LocationCard(mesLocations: LocationProvider.locationData[index],

          );
        },
      ),
    );
  }
}
