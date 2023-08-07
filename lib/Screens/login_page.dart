import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:property2/Screens/HomePage.dart';
import 'package:property2/Screens/HomePage1.dart';
import 'package:property2/Screens/Templates/hiddendrawer.dart';
import 'package:property2/Screens/animation_trap.dart';
import 'package:property2/network/api.provider.dart';
import 'package:property2/network/localstorage.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController? emailController = TextEditingController();

  TextEditingController? passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        body: SafeArea(child: SingleChildScrollView(child:

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Icon(Icons.lock, size: 60,),
              SizedBox(height: 50,),


              // Hello Again
              Text("Salut!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20
                ),),

              SizedBox(height: 10),

              Text("Content de te revoir ",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15
                ),),

              SizedBox(height: 30),


              // Email Field
              Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 25.0),
                  child:
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white70)

                      ),


                      child: Padding(padding: EdgeInsets.only(left: 20.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',


                            ),
                            controller: emailController,
                          )
                      )
                  )
              ),

              SizedBox(height: 10.0,),

              // password field
              Padding(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 25.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[100],
                          border: Border.all(color: Colors.white)

                      ),
                      child: Padding(padding: EdgeInsets.only(left: 10.0),
                        child: TextField(
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "mot de pass",
                          ),
                          controller: passwordController,
                        ),
                      ))),
              SizedBox(height: 20.0,),

              // Sign IN up
              ElevatedButton(
                // padding: EdgeInsets.only(bottom: 10),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[300],

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
                        text: "Connexion",
                        style: TextStyle(
                            color: Colors.brown[100],
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                  ]),
                ),
              ),
              // GestureDetector(
              // onTap: () => Navigator.push(context,
              // MaterialPageRoute(builder:
              // (context) =>HomePage1(),)
              // ),
              //     child: Padding(padding: EdgeInsets.symmetric(horizontal: 25.0),
              //     child: Container(
              //       padding: EdgeInsets.all(25),
              //       decoration: BoxDecoration(
              //         color: Colors.grey[900],
              //         borderRadius: BorderRadius.circular(12),
              //
              //
              //       ),
              //       child: Center(
              //         child: Text("Login in",
              //         style: TextStyle(color: Colors.white,fontSize: 25,
              //         fontWeight: FontWeight.bold),
              //         ),
              //       ),
              //
              //     ),
              //     ),
              //   ),

              SizedBox(height: 15.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Square(imagepath: 'assets/images/Apple Icon.jpg'),
                  SizedBox(width: 10.0,),

                  Square(imagepath: 'assets/images/google Icon.jpg'),
                ],)

            ],),
        ))

        ));
  }

  void save() async {
    Map<String, dynamic> data = {
      'email': emailController?.text,
      'password': passwordController?.text,
    };
    final response = await ApiProvider.authenticate(data);
    final res = jsonDecode(response.body);
    LocalStorage.saveToken(res['access_token']);
    LocalStorage.saveRefreshToken(res['refresh_token']);
    // if (response.statusCode == 200) {
    //    showDialog(context: context,
    //       barrierDismissible: true,
    //       builder: (BuildContext dialogContext) {
    //         return AlertDialog(title: Text("inscription réussi"), content: Text(
    //             "réponse du server $res"
    //         ));
    //       }
    //   );
    // }
  }
}
