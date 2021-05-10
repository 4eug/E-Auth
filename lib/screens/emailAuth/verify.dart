import 'dart:async';
import 'package:e_auth/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  get uid => null;

  @override
  _VerifyScreenState createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  final auth = FirebaseAuth.instance;
  User uid;
  Timer timer;

  @override
  void initState() {
    uid = auth.currentUser;
    uid.sendEmailVerification();

    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      checkEmailVerified();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('An email has been sent to ${uid.email} please verify'),
      ),
    );
  }

  Future<void> checkEmailVerified() async {
    uid = auth.currentUser;
    await uid.reload();
    if (uid.emailVerified) {
      timer.cancel();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Home(uid: widget.uid)));
    }
  }
}
