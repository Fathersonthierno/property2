import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:property2/Models/Datamodel/PlaceModel.dart';
import 'package:property2/model/property.dart';

import '../../Screens/PlaceDetails.dart';

class BestOffer extends StatelessWidget {
  final Property property;
  BestOffer({required this.property});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 12,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PlaceDetails(property: property),
            ),
          );
        },
        child: Container(
          height: 220,
          width: 300,
          decoration: BoxDecoration(
            // color: Colors.blue,
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(32),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(3, 5),
              ),
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.5),
                offset: Offset(-3, 0),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: property.images != null ?
                  Image(
                    height: 220,
                    width: 120,
                    fit: BoxFit.cover,
                    image:
                    ImageUtils.imageFromBase64String(property.images?[0].piece).image
                  )
                      : Container(
                    color:  Colors.blueAccent,
                    height: 220,
                    width: 120,),
                ),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                       "${property.titre}",
                        style: textTheme.titleLarge?.apply(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      // Text(
                      //   // placeModel.details,
                      //   overflow: TextOverflow.fade,
                      //   style: textTheme.bodyLarge?.apply(
                      //     color: Colors.black45,
                      //   ),
                      // // ),
                      // SizedBox(
                      //   height: 12,
                      // ),
                      Flexible(
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FlutterIcons.bed_faw,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "5",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FlutterIcons.bath_faw,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      FlutterIcons.fridge_outline_mco,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "\ Fcfa ${property.prix} / ",
                          style: textTheme.titleLarge?.apply(
                            color: Colors.black,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Mo',
                              style: DefaultTextStyle.of(context).style.apply(
                                    color: Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
