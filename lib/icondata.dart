import 'package:flutter/material.dart';

class Icondata extends StatelessWidget {
  Icondata(this.ivan, this.tt);
  final Icon ivan;
  final String tt;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ivan,
          SizedBox(
            height: 20.0,
          ),
          Text(
            tt,
            style: TextStyle(fontSize: 25.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
