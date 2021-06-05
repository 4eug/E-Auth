import 'package:flutter/material.dart';

class LoginQr extends StatefulWidget {
  LoginQr({Key key}) : super(key: key);

  @override
  _LoginQrState createState() => _LoginQrState();
}

String imageUrl;

class _LoginQrState extends State<LoginQr> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qr Code Generator"),
        leading: Icon(
          Icons.android,
          color: Colors.greenAccent,
        ),
        backgroundColor: Color(0xFF5ABD8C),
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(Icons.image), color: Colors.white, onPressed: () {})
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/frame.png'),
                      ),
                    ),
                    imageUrl != null
                        ? Center(
                            child: Container(
                              padding: EdgeInsets.only(top: 10),
                              height: 150,
                              width: 150,
                              child: FadeInImage.assetNetwork(
                                  placeholder: "", image: imageUrl),
                            ),
                          )
                        : Container()
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
