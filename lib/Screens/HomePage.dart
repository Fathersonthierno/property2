import 'dart:convert';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:http/http.dart';
import 'package:icons_flutter/icons_flutter.dart';
import 'package:property2/Models/Datamodel/PlaceModel.dart';
import 'package:property2/Models/ViewModel/BestOffer.dart';
import 'package:property2/Models/ViewModel/RecentAddedHome.dart';
import 'package:property2/Models/constants.dart';
import 'package:property2/Screens/Templates/hiddendrawer.dart';
import 'package:property2/network/api.provider.dart';

import '../model/property.dart';
import 'Templates/AccountPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Property> recentAdd = [];
  List<Property> bestOffer = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();

  }

  void loadData() async{
    var data = await ApiProvider.findAllProperties();
      print("AAAAA");
      print(data.body);

    //    data = jsonDecode(value.body),
    //   print(data),
    //    setState((){
    //      recentAdd = List<Property>.from(data.map((x) => Property.fromJson(x)));
    //      bestOffer = recentAdd ;
    //    })
  }
  List<Widget> getRecentAddList() {
    List<Widget> list = [];
    recentAdd.forEach((element) => list.add(RecentAdded(property: element))) ;
    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Text(
      //       "HomePage", style: TextStyle(
      //       color: Colors.black54
      //     ),
      //   ),
      // )
      // ),
      drawer: HiddenDrawer(),
      body: SafeArea(

          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              shrinkWrap: true,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Container(
                //         height: 55,
                //         width: 55,
                //         decoration: BoxDecoration(
                //           color: Colors.grey[300],
                //           borderRadius: BorderRadius.circular(18),
                //           boxShadow: [
                //             BoxShadow(
                //               blurRadius: 15,
                //               color: Colors.black.withOpacity(0.3),
                //               offset: Offset(5, 5),
                //             )
                //           ],
                //         ),
                //         child: GestureDetector(
                //           onTap: () => Navigator.push(context, MaterialPageRoute(builder:
                //             (context) => HiddenDrawer())),
                //           child: Icon(
                //             FlutterIcons.th_large_faw,
                //             color: kCustomBlackColor,
                //           ),
                //         ),
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //           boxShadow: [
                //             BoxShadow(
                //               blurRadius: 15,
                //               color: Colors.black.withOpacity(0.4),
                //               offset: Offset(-5, 10),
                //             )
                //           ],
                //         ),
                //         child: ClipRRect(
                //           borderRadius: BorderRadius.circular(18),
                //           child: Image(
                //             fit: BoxFit.fill,
                //             width: 55,
                //             image: AssetImage('assets/images/face.jpg'),
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(5, 5),
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(FlutterIcons.magnify_mco),
                                border: InputBorder.none,
                                hintStyle: new TextStyle(color: Colors.grey[800]),
                                hintText: "Recherche",
                                fillColor: Color(0xffF3F4F8),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade300,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 15,
                                color: Colors.black.withOpacity(0.4),
                                offset: Offset(-5, 10),
                              )
                            ],
                          ),
                          child: Icon(
                            FlutterIcons.sliders_h_faw5s,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recemment ajoutés",
                       style: TextStyle(
                         fontSize: 18
                       ),
                      ),
                      Text(
                        "voir tous",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  height: 350,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: false,
                    children:
                      getRecentAddList()
                  ),
                ),
                SizedBox(height: 50),
                // ListView(
                //   scrollDirection: Axis.horizontal,
                //   shrinkWrap: true,
                //   children: [
                    Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                         " Meilleurs offres d'aujourd'hui ✨",
                        style: TextStyle(
                          fontSize: 18
                        ),
                      ),
                      Text(
                        "voir tous",
                        style: TextStyle(
                            // color: Colors.black54,
                            ),
                      ),
                    ],
                  ),
               // ] ),
                SizedBox(height: 30),
                recentAdd.length>0?
                BestOffer(
                  property: recentAdd[0],
                )
                : Container(

                ),

                SizedBox(height: 60),
              ],
            ),
          ),
      ),

    floatingActionButton: FloatingActionButton(onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder:(context) =>AddPropertyPage(),));
    },
    backgroundColor: Colors.deepPurple.shade300,
    child: Icon(Icons.add,
    )

    )

        );

  }

}

