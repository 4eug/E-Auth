import 'dart:async';

import 'package:e_auth/routes/routes.dart';
import 'package:e_auth/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    loadContext();
  }

  loadContext() async {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(loginPhoneScreenRoute, (route) => false);
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            height: SizeConfig.blockSizeVertical * 100,
            child: Opacity(
              opacity: .4,
              child: Image.asset(
                "assets/images/background.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical * 50,
            left: SizeConfig.blockSizeHorizontal * 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "E-Authentication",
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "System",
                  style: GoogleFonts.montserrat(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
