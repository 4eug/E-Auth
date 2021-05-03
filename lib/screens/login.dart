import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
              child: Center(
                child: Text(
                  "Log In",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 50),
            _textField1(context),
            SizedBox(height: 20),
            _textField2(context),
            SizedBox(height: 20),
            _loginButton,
            SizedBox(height: 50),
            _already()
          ],
        ),
      ),
    );
  }
}

Widget _textField1(context) => Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.person),
          isCollapsed: false,
          focusedBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF5ABD8C), width: 2),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          enabledBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0x80EFEFEF), width: 2),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Color(0x75000000)),
        ),
        onChanged: (value) {},
      ),
    );

Widget _textField2(context) => Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: new InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock),
          isCollapsed: false,
          focusedBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0xFF5ABD8C), width: 2),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          enabledBorder: new OutlineInputBorder(
            borderSide: new BorderSide(color: Color(0x80EFEFEF), width: 2),
            borderRadius: const BorderRadius.all(
              const Radius.circular(20.0),
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(color: Color(0x75000000)),
        ),
        onChanged: (value) {},
      ),
    );

Widget get _loginButton => Padding(
    padding: const EdgeInsets.all(20),
    child: MaterialButton(
      height: 56,
      minWidth: double.infinity,
      color: Color(0xFF5ABD8C),
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
      onPressed: () {},
      child: Text(
        "Log In",
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    ));

Widget _already() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Already have an account? ",
        style: GoogleFonts.poppins(fontSize: 18),
      ),
      InkWell(
        child: Text(
          "Sign In",
          style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline),
        ),
        onTap: () {},
      )
    ],
  );
}
