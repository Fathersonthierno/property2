import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:property2/Screens/HomePage1.dart';
import 'package:property2/Screens/Templates/hiddendrawer.dart';
import 'package:property2/library/Common.dart';
import 'package:property2/network/api.provider.dart';
import 'package:property2/network/localstorage.dart';
import 'package:property2/screens/HomePage.dart';
import 'package:property2/screens/Login_Page.dart';

class RegisterScreen extends StatefulWidget {


  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

Widget input({String? labelText, String? hintText, TextEditingController? controller}) {
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
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
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
              // disabledBorder: new InputBorder(borderSide: BorderSide.none),
              hintStyle: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              filled: true,
              fillColor: darkGrey,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17, vertical: 12),

              hintText: hintText,
            ),
          ),
        ),
      ],
    ),
  );
}




class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController? lastnameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? roleController = TextEditingController();
  String? dropdownValue ;
  Widget inputDropDown({String? labelText, String? hintText}) {
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
                  items: <String>['Acheteur', 'Annonceur'].map((String value) {
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
      backgroundColor: white,
      appBar: null,

      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: <Widget>[
              AnimatedContainer(
                height: MediaQuery.of(context).size.height,
                duration: Duration(milliseconds: 5),
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                      child: Text(
                        "Inscription",
                        style: TextStyle(
                            color: Colors.brown[100],
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Row(
                    //  children: [
                    //    DropdownButtonHideUnderline(
                    //   child: DropdownButton(
                    //     isExpanded: true,
                    //   // padding: const EdgeInsets.all(),
                    //    borderRadius: BorderRadius.circular(5),
                    //    // border: const BorderSide(
                    //    // color: Colors.black12, width: 1),
                    //    // dropdownButtonColor: Colors.white,
                    //    value: dropdownValue,
                    //    onChanged: (newValue) {
                    //     setState(() {
                    //     dropdownValue = newValue;
                    //      });
                    //   },
                    //     items: [
                    //       'Acheteur',
                    //       'Annonceur',
                    //       'Loueur',
                    //       'Les deux'
                    //     ]
                    //     // return DropdownMenuItem
                    //
                    //         .map((value) => DropdownMenuItem(
                    //       value: value,
                    //       child: Text(value),
                    //     ))
                    //         .toList(),
                    //   ),
                    // )], ),
                    Row(
                      children: <Widget>[
                        input(labelText: "Prenom", hintText: "prenom" , controller: firstnameController),
                        input(labelText: "Nom", hintText: "nom" , controller: lastnameController),
                      ],
                    ),

                    Row(
                      children: [
                        inputDropDown(
                          labelText: "Type utilisateur", hintText: "choisissez un type"
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        input(labelText: "Email", hintText: "thierno@gmail.com", controller: emailController),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        input(labelText: "mot de pass", hintText: "********" , controller: passwordController),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: 45,
                        child: ElevatedButton(
                          // padding: EdgeInsets.only(bottom: 10),
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.brown[300],

                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(35.0)),
                        ),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: HiddenDrawer()));
                            save();
                          },
                          child: RichText(
                            text: TextSpan(children: <TextSpan>[
                              TextSpan(
                                  text: "Inscription",
                                  style: TextStyle(
                                      color: Colors.brown[100],
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ]),
                          ),
                        ),
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    //     Text(
                    //       "By Sign up, you agree our ",
                    //       overflow: TextOverflow.ellipsis,
                    //       style: TextStyle(
                    //           fontSize: 12, fontStyle: FontStyle.italic),
                    //     ),
                    //     TextButton(
                    //       style: TextButton.styleFrom(
                    //       padding: EdgeInsets.only(left: 5),),
                    //       onPressed: () {},
                    //       child: Text(
                    //         "Terms and Condition",
                    //         overflow: TextOverflow.ellipsis,
                    //         style: TextStyle(
                    //             fontSize: 12,
                    //             fontStyle: FontStyle.italic,
                    //             color: primaryColor,
                    //             fontWeight: FontWeight.bold),
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    // input(labelText: "Mobile", hintText: "dave@gmail.com"),


              Positioned.fill(
                bottom: 0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Divider(
                        height: 80.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already have a account?",
                            style: TextStyle(),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                            padding: EdgeInsets.only(right: 20),),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.fade,
                                      child: LoginPage()));
                            },
                            child: Text(
                              "Login ",
                              style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ))
      ],
    )
    )
    );
  }

  void save() async {
    Map<String,dynamic> data = {
      'firstname': firstnameController?.text ,
      'lastname': lastnameController?.text ,
      'email': emailController?.text ,
      'password': passwordController?.text ,
      'typeUtilisateur': dropdownValue
    } ;
   final response = await ApiProvider.register(data);
   print(response.body);
   final resp = jsonDecode(response.body);
   LocalStorage.saveToken(resp['access_token']);
   LocalStorage.saveRefreshToken(resp['refresh_token']);
  }
}
