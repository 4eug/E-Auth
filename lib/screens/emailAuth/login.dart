import 'package:e_auth/screens/emailAuth/register.dart';
import 'package:e_auth/screens/emailAuth/reset.dart';
import 'package:e_auth/screens/home.dart';

import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  final String uid;
  const LoginScreen({Key key, this.uid}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  CollectionReference users = FirebaseFirestore.instance.collection("Users");

  // TextEditingController emailController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  bool isLoading = false;
  String verificationId;
  var retrievedNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                ? emailpasswrdWidget(context)
                : getOtpFormWidget(context),
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

  emailpasswrdWidget(context) {
    bool isLoading = false;

    return Column(
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
            onChanged: (value) {
              setState(() {
                emailController.text = value.trim();
              });
              print(emailController.text);
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
                      _signin(emailController.text, passwordController.text);
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
    );
  }

  getOtpFormWidget(context) {
    final otpController = TextEditingController();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
          child: Center(
            child: Text(
              "Enter OTP Code",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(height: 30),
        TextField(
          keyboardType: TextInputType.number,
          controller: otpController,
          decoration: InputDecoration(
            labelText: "Enter OTP",
            isCollapsed: false,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
              Radius.circular(20),
            )),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x80EFEFEF)),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                )),
            filled: true,
            hintStyle: new TextStyle(color: Color(0x75000000)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        // ignore: deprecated_member_use
        FlatButton(
          height: 56,
          minWidth: double.infinity,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () async {
            // ignore: unused_local_variable
            PhoneAuthCredential phoneAuthCredential =
                PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otpController.text);

            signInWithPhoneAuthCredential(phoneAuthCredential);
          },
          child: Text(
            "Verify",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          color: Color(0xFF5ABD8C),
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  void _signin(email, password) {
    print(email);
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((result) async {
      // print(FirebaseAuth.instance.currentUser.phoneNumber);
      // ignore: unused_field
      // ignore: unused_local_variable
      // var firebaseUser = FirebaseAuth.instance.currentUser;
      await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: email)
          .get()
          .then((QuerySnapshot querySnapshot) {
        querySnapshot.docs.forEach((doc) {
          print(doc["phoneNumber"]);

          retrievedNumber = doc["phoneNumber"];
        });
      });

      print(result.user.uid);
      isLoading = false;
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => Home(
      //             uid: '',
      //           )),
      // );

      //functon to otp

      firebaseAuth.verifyPhoneNumber(
        phoneNumber: retrievedNumber,
        verificationCompleted: (phoneAuthCredential) async {
          setState(() {
            isLoading = false;
          });
          signInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) async {
          setState(() {
            isLoading = false;
          });
          // ignore: deprecated_member_use
          _scaffoldKey.currentState.showSnackBar(
              SnackBar(content: Text(verificationFailed.message)));
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            isLoading = false;
            currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
            this.verificationId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {},
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

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      isLoading = true;
    });

    try {
      final authCredential =
          await firebaseAuth.signInWithCredential(phoneAuthCredential);

      setState(() {
        isLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Home(
                      uid: '',
                    )));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false;
      });

      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
