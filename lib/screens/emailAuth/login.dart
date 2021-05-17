import 'package:e_auth/screens/emailAuth/register.dart';
import 'package:e_auth/screens/emailAuth/reset.dart';
import 'package:e_auth/screens/home.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final _formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isLoading = false;

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
            SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
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
                    emailController.text = value.trim();
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
                    passwordController.text = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    child: Text(
                      "Forgot Password? ",
                      style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Color(0xFF5ABD8C),
                          fontWeight: FontWeight.w500),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ResetScreen()),
                      );
                      // Navigator.of(context).pushNamedAndRemoveUntil(
                      //     resetScreenRoute, (route) => false);
                    },
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : MaterialButton(
                        height: 56,
                        minWidth: double.infinity,
                        color: Color(0xFF5ABD8C),
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)),
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          _signin();
                        },
                        child: Text(
                          "Log In",
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      )),
            SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You dont\'t have an account? ",
                  style: GoogleFonts.poppins(fontSize: 18),
                ),
                InkWell(
                  child: Text(
                    "Register",
                    style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ignore: unused_element
//   _signin() async {

//        firebaseAuth.signInWithEmailAndPassword(
//           email: emailController.text, password: passwordController.text);

//       //Sucessful

//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (context) => LoginPhoneScreen()));
//     } on FirebaseAuthException catch (error) {
//       Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
//     }

// }

  void _signin() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((result) {
      // print(result.user);
      isLoading = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                  uid: '',
                )),
      );
    }).catchError((err) {
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                ElevatedButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
