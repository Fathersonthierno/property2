import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:property2/Models/Datamodel/PlaceModel.dart';
import 'package:property2/Models/constants.dart';
import 'package:property2/Screens/Templates/hiddendrawer.dart';
import 'package:property2/Screens/Templates/locationPage.dart';
import 'package:property2/Screens/Templates/pageAchat.dart';
import 'package:property2/model/property.dart';

class PlaceDetails extends StatelessWidget {
  final Property property;
  PlaceDetails({required this.property});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade300,
        title: Center(
          child: Text(
            "Détails",
                style: TextStyle(
              color: Colors.white
          ),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag:"${property.titre}" ,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: property.images != null ?
                    Image(
                      fit: BoxFit.cover,
                      image: ImageUtils.imageFromBase64String(property.images?[0].piece).image,
                    )
                        : Container(
                  color:  Colors.blueAccent,
                  height: 220,
                    width: 120,),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: Text(
                     "${property.titre}",
                        style: textTheme.headline4?.apply(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${property.prix}\ Fcfa ",
                              style: textTheme.headline5,
                            ),
                            Text(
                              "/ Mo",
                              style: textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FlutterIcons.bed_faw,
                              size: 16,
                            ),
                            Text("5")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FlutterIcons.bath_faw,
                              size: 16,
                            ),
                            Text("3")
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FlutterIcons.fridge_outline_mco,
                              size: 16,
                            ),
                            Text("2"),
                          ],
                        ),

                      ),
                    ),
                    SizedBox(width: 30.0,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple.shade300
                      ),

                      onPressed: () {

    if (property.statut == "Mettre en vente" ){

      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: LocationPage(property: property,)));
    }
    else
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.fade,
              child: AchatPage(property: property)));
    },
                      child: Container(
                        decoration: BoxDecoration(
                            // color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(
                            "${property.statut}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.0
                          ),
                        ),
                      ),

                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 12,
                        ),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(18),
                        //   child: Image(
                        //     width: 65,
                        //     fit: BoxFit.cover,
                        //     image: AssetImage('assets/images/face.jpg'),
                        //   ),
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Propriétaire",
                              style: textTheme.caption,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "shouaib konaré",
                              style: textTheme.subtitle1,
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              FlutterIcons.comment_dots_faw5s,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "A propos ",
                  style: textTheme.headline5,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Cette maison en vente est une charmante propriété située dans un quartier résidentiel paisible. Elle dispose de trois chambres spacieuses et lumineuses, idéales pour accueillir une famille. La maison offre également une cuisine moderne et fonctionnelle, ainsi qu'un salon accueillant avec une cheminée. Les caractéristiques extérieures comprennent un jardin bien entretenu avec une terrasse, parfait pour profiter des journées ensoleillées, ainsi qu'un garage attenant pour deux voitures. L'emplacement est idéal, à proximité des écoles, des commerces et des transports en commun. Cette maison offre une belle opportunité d'achat pour ceux qui recherchent un foyer confortable et convivial dans un quartier calme.",
                  style: textTheme.subtitle1?.apply(
                    color: Colors.black45,
                    // fontSizeDelta:10
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Photos",
                  style: textTheme.headline5,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: property.images?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: property.images != null?
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
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
