import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreateQR extends StatefulWidget {
  @override
  _CreateQRState createState() => _CreateQRState();
}

class _CreateQRState extends State<CreateQR> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BarcodeWidget(
                  barcode: Barcode.qrCode(),
                  color: Color(0xFF5ABD8C),
                  data: controller.text ?? 'Hello world',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(child: buildTextField(context)),
                    const SizedBox(width: 12),
                    FloatingActionButton(
                      backgroundColor: Color(0xFF5ABD8C),
                      child: Icon(Icons.done, size: 30),
                      onPressed: () => setState(() {}),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildTextField(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            labelText: 'Enter the data',
            isCollapsed: false,
            focusedBorder: new OutlineInputBorder(
              borderSide: new BorderSide(color: Color(0xFF5ABD8C), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x80EFEFEF), width: 2),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            ),
            filled: true,
            hintStyle: new TextStyle(color: Color(0x75000000)),
          ),
        ),
      );
}
