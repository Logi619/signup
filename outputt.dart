import 'package:flutter/material.dart';
class str extends StatefulWidget {
  String a ;
  str({super.key,required this.a});


  @override
  State<str> createState() => _strState();
}

class _strState extends State<str> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.a);
  }
}
