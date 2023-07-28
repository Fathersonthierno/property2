
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:property2/Models/Datamodel/meslocations.dart';
import 'package:property2/Screens/Templates/locationcard.dart';

class MesLocations extends StatelessWidget {

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
