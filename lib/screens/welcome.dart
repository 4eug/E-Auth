import 'dart:async';

import 'package:e_auth/routes/routes.dart';
import 'package:e_auth/utils/config.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  loadContext() async {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(homeScreenRoute, (route) => false);
    });
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold();
  }
}
