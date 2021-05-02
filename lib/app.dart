import 'package:e_auth/routes/router.dart';
import 'package:e_auth/routes/routes.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Authentication System',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoute,
      initialRoute: welcomeScreenRoute,
    );
  }
}
