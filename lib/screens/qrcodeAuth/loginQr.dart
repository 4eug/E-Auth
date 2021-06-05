import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class LoginQr extends StatefulWidget {
  LoginQr({Key key}) : super(key: key);

  @override
  _LoginQrState createState() => _LoginQrState();
}

class _LoginQrState extends State<LoginQr> with SingleTickerProviderStateMixin {
  String imageUrl;
  String word;
  bool color = false;
  Color pickerColor = new Color(0xff443a49);
  AnimationController _animatedController;

  @override
  void initState() {
    _animatedController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    super.initState();
  }

  void _handleOnPressed() {
    setState(() {
      color = !color;
      color ? _animatedController.forward() : _animatedController.reverse();
    });
  }

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
    });
  }

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
                        child: Image.asset('assets/images/frame.png'),
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
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Colors.green),
                  child: Center(
                    child: ListTile(
                      title: Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            setState(() {
                              word = value;
                            });
                          },
                          decoration: new InputDecoration(
                              icon: Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.vpn_key,
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Enter Something",
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 11, top: 11, right: 15)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                AnimatedContainer(
                  padding: EdgeInsets.all(10),
                  duration: Duration(milliseconds: 300),
                  width: 300,
                  height: color == false ? 70 : 280,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.only(right: 100),
                            child: Row(
                              children: [
                                Text(
                                  "COLOR",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 300),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: pickerColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                              icon: AnimatedIcon(
                                  icon: AnimatedIcons.menu_arrow,
                                  progress: _animatedController),
                              onPressed: () {
                                _handleOnPressed();
                              })
                        ],
                      ),
                      color == true
                          ? Container(
                              height: 200,
                              child: MaterialPicker(
                                pickerColor: pickerColor,
                                onColorChanged: changeColor,
                                enableLabel: true,
                              ),
                            )
                          : Container()
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
