import 'package:e_auth/screens/emailAuth/login.dart';
import 'package:e_auth/screens/emailAuth/register.dart';
import 'package:flutter/material.dart';

class SelectAuthType extends StatefulWidget {
  SelectAuthType({Key key}) : super(key: key);

  @override
  _SelectAuthTypeState createState() => _SelectAuthTypeState();
}

class _SelectAuthTypeState extends State<SelectAuthType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
                child: Center(
                  child: Text(
                    "E Auth",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 80),
              Container(
                width: double.infinity,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Text(
                          "Register With Your Email",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              letterSpacing: 0.168,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  color: Color(0xFF5ABD8C),
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(20.0),
                  child: MaterialButton(
                    height: 56,
                    minWidth: double.infinity,
                    color: Color(0xFF5ABD8C),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text(
                      "Log In Using Email",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
