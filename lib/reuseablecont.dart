import 'package:flutter/material.dart';

Icon iva = Icon(Icons.abc);
String rr = '';

// ignore: camel_case_types, must_be_immutable
class reuseablecont extends StatefulWidget {
  reuseablecont({required this.colour, required this.cardchild});
  Widget cardchild;
  Color colour;

  @override
  State<reuseablecont> createState() => _reuseablecontState();
}

class _reuseablecontState extends State<reuseablecont> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.cardchild,
      height: 200.0,
      //width: 150.0,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: widget.colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}
