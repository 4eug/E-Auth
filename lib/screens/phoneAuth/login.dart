import 'package:e_auth/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginPhoneScreen extends StatefulWidget {
  @override
  _LoginPhoneScreenState createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends State<LoginPhoneScreen> {
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  String verificationId;

  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState
          // ignore: deprecated_member_use
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  getMobileFormWidget(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 0, 0),
          child: Center(
            child: Text(
              "Enter Your Phone Number",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),

        SizedBox(height: 30),

        TextField(
          keyboardType: TextInputType.phone,
          controller: phoneController,
          decoration: InputDecoration(
            labelText: "Phone Number",
            prefixIcon: Icon(Icons.phone),
            isCollapsed: false,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Color(0x80EFEFEF), width: 2),
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
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
            setState(() {
              showLoading = true;
            });

            await auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async {
                setState(() {
                  showLoading = false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed) async {
                setState(() {
                  showLoading = false;
                });
                // ignore: deprecated_member_use
                _scaffoldKey.currentState.showSnackBar(
                    SnackBar(content: Text(verificationFailed.message)));
              },
              codeSent: (verificationId, resendingToken) async {
                setState(() {
                  showLoading = false;
                  currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                  this.verificationId = verificationId;
                });
              },
              codeAutoRetrievalTimeout: (verificationId) async {},
            );
          },
          child: Text(
            "Send",
            style: TextStyle(fontSize: 15, color: Colors.white),
          ),
          color: Color(0xFF5ABD8C),
          textColor: Colors.white,
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        ));
  }
}
