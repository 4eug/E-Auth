import 'package:e_auth/routes/router.dart';
import 'package:e_auth/routes/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  static final String title = 'E-Authentication System';
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: welcomeScreenRoute,
    );
  }
}
