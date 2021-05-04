import 'package:e_auth/screens/login.dart';
import 'package:e_auth/screens/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // ignore: unused_field
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
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.person),
                  isCollapsed: false,
                  focusedBorder: new OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Color(0xFF5ABD8C), width: 2),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Color(0x80EFEFEF), width: 2),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Color(0x75000000)),
                ),
                onChanged: (value) {
                  setState(() {
                    _email = value.trim();
                  });
                },
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  isCollapsed: false,
                  focusedBorder: new OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Color(0xFF5ABD8C), width: 2),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  enabledBorder: new OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: Color(0x80EFEFEF), width: 2),
                    borderRadius: const BorderRadius.all(
                      const Radius.circular(20.0),
                    ),
                  ),
                  filled: true,
                  hintStyle: new TextStyle(color: Color(0x75000000)),
                ),
                onChanged: (value) {
                  setState(() {
                    _password = value.trim();
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.all(20),
                child: MaterialButton(
                  height: 56,
                  minWidth: double.infinity,
                  color: Color(0xFF5ABD8C),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0)),
                  onPressed: () => _register(_email, _password),
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                )),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                InkWell(
                  child: Text(
                    "Log In",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _register(String _email, String _password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: _email, password: _password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => VerifyScreen()));
    } on FirebaseAuthException catch (error) {
      Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }
}
