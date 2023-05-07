import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPro extends StatelessWidget {
  int mins;
  NumberPro(this.mins, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: Center(
          child: Text(
            mins.toString().padLeft(2, "0"),
            style: TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
