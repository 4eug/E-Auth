import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:http/http.dart' as http;

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

  createQrCode(text, color) async {
    var uri = (Uri.parse(
        "https://dev4fun007-qr-code-generator-v1.p.rapidapi.com/hello"));

    var response = await http.get(
        uri.replace(queryParameters: <String, String>{
          "text": "string",
          "type": "text | url | tel | sms | email",
          "backcolor": "00237c",
          "forecolor": color,
          "pixel": "9",
          "ecl": "L | M| Q | H"
        }),
        headers: {
          "x-rapidapi-key":
              "47977a8876mshee1bdfc73acbeb4p114995jsnfdc9e143d406",
          "x-rapidapi-host": "dev4fun007-qr-code-generator-v1.p.rapidapi.com",
          "useQueryString": "true"
        });

    setState(() {
      imageUrl = response.body;
    });
  }

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
                                  placeholder: "assets/images/loading.gif",
                                  image: imageUrl),
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
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(255, 144, 39, 1)),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        child: Text(
                          "CREATE QR",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (word != null) {
                            createQrCode(word,
                                "${pickerColor.red.toRadixString(16)}${pickerColor.green.toRadixString(16)}${pickerColor.blue.toRadixString(16)}");
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 50),
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: Color.fromRGBO(0, 180, 245, 1)),
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        child: Text(
                          "SAVE QR",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          if (word != null) {}
                        },
                      ),
                    )
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
