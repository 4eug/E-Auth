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
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterScreen()),
                      );
                    },
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
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
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
                            "Log In Using Your Email",
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
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
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
                          Icons.qr_code,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Text(
                            "Log In Using QRCode",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
