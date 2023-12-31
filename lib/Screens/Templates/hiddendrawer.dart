import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
import 'package:property2/Screens/HomePage.dart';
import 'package:property2/Screens/RegisterScreen.dart';
import 'package:property2/Screens/Templates/meslocation.dart';
import 'package:property2/Screens/login_page.dart';

import '../../introduction_animation/components/welcome_view.dart';

class HiddenDrawer extends StatefulWidget {

  @override
  _HiddenDrawerState createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> with TickerProviderStateMixin {
  AnimationController? _animationController;
  List<ScreenHiddenDrawer> pages = [];
  final mytextestyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15.0,
    color: Colors.black,

  );
  @override
  void initState (){
  super.initState();
  _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 8));
  _animationController?.animateTo(0.0);

  pages = [
    ScreenHiddenDrawer(
      ItemHiddenMenu(colorLineSelected: Colors.deepPurple.shade50,

        name: "Page d'accueil",
          baseStyle: mytextestyle,
        selectedStyle: TextStyle(),
      ),
      HomePage()

    ),
    ScreenHiddenDrawer(
        ItemHiddenMenu(colorLineSelected: Colors.deepPurple.shade100,
            name: "Mes locations ",
            baseStyle: mytextestyle,
            selectedStyle: TextStyle()
        ),
        MesLocations()

    ),
    ScreenHiddenDrawer(
        ItemHiddenMenu(colorLineSelected: Colors.deepPurple.shade100,

            name: "Mes achats",
            baseStyle: mytextestyle,
            selectedStyle: TextStyle()
        ),
        HomePage()

    ),
    ScreenHiddenDrawer(
        ItemHiddenMenu(colorLineSelected: Colors.deepPurple.shade50,
            name: "Page d'authentification",
            baseStyle: mytextestyle,
            selectedStyle: TextStyle(),


        ),
 LoginPage()
 // WelcomeView(animationController: AnimationController(duration: Duration(seconds: 2), vsync:  )),
    ),
 // ScreenHiddenDrawer(
 //        ItemHiddenMenu(colorLineSelected: Colors.deepPurple.shade50,
 //            name: "Bienvenue",
 //            baseStyle: mytextestyle,
 //            selectedStyle: TextStyle()
 //
 //        ),
 //
 // WelcomeView(animationController: _animationController!,)
 //
 //    ),

  ];

  }
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
        backgroundColorAppBar: Colors.deepPurple.shade300,
        screens: pages,

        backgroundColorMenu: Colors.deepPurple.shade100,
        initPositionSelected: 0,
        slidePercent: 40,

    );
  }
}
