import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:property2/Models/Datamodel/PlaceModel.dart';
import 'package:property2/Screens/PlaceDetails.dart';
import 'package:property2/model/property.dart';

class RecentAdded extends StatefulWidget {
  final Property property;
  RecentAdded({required this.property});

  @override
  State<RecentAdded> createState() => _RecentAddedState();
}

class _RecentAddedState extends State<RecentAdded> {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlaceDetails(property: widget.property),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 12,
        ),
        child: Container(
          height: 380,
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
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Hero(
                      tag: "${widget.property.titre}" ,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child:  (widget.property.images != null) ?
                        Image(
                          fit: BoxFit.cover,
                          image: ImageUtils.imageFromBase64String(widget.property.images?[0].piece).image,
                        )
                            : Container(
                          color:  Colors.blueAccent,
                          height: 220,
                          width: 120,),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GlassContainer(
                        height: 50,
                        blur: 5,
                        // shadowStrength: 10,
                        opacity: 0.5,
                        width: 180,
                        //this below code to remove border
                        border: Border.fromBorderSide(BorderSide.none),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            24,
                          ),
                          bottomRight: Radius.circular(
                            24,
                          ),
                        ),
                        child: Center(
                            child: RichText(
                          text: TextSpan(
                            text: "\ Fcfa ${widget.property.prix.toString()} / ",
                            style: textTheme.titleLarge,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Mo',
                                style: DefaultTextStyle.of(context).style,
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                 "${widget.property.titre}",
                  style: textTheme.titleLarge?.apply(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                // Text(
                //   // placeModel.details,
                //   style: textTheme.bodyLarge?.apply(
                //     color: Colors.black45,
                //   ),
                // ),
                SizedBox(
                  height: 12,
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
                          color: Colors.grey[300],
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
                          color: Colors.grey[300],
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
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FlutterIcons.fridge_outline_mco,
                              size: 16,
                            ),
                            Text("2")
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
