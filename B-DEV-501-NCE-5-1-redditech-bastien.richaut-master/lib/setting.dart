import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Setting extends StatefulWidget {
  Setting(this.text, this.state, {Key? key}) : super(key: key);
  String text;
  bool state;
  SettingState createState() => SettingState();
}
class SettingState extends State<Setting> {

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
            child: Text(widget.text,
              style: GoogleFonts.raleway(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child:
              Switch(
              value: widget.state,
              onChanged: (value) {
                setState(() {
                  widget.state = value;
                });
              },
              activeTrackColor: Colors.lightGreenAccent,
              activeColor: Colors.green,
            ),
          )
        ]
    );
  }
}