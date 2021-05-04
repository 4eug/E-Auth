import 'package:e_auth/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // ignore: deprecated_member_use
        child: FlatButton(
          child: Text('Log Out'),
          onPressed: () {
            auth.signOut();
            Navigator.of(context)
                .pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()))
                .catchError((e) {
              print(e);
            });
          },
        ),
      ),
    );
  }
}
