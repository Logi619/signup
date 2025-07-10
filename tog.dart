import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/toggbutt.dart';

import 'main.dart';
class togbut extends StatefulWidget {
  const togbut({super.key});

  @override
  State<togbut> createState() => _togbutState();
}

class _togbutState extends State<togbut> {

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<tubb>(context);
    return Scaffold(
      body: Column(
        children: [
          Center(child: Text("Home page")),
          Spacer(),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>thenn()));
          }, child: Text("logon"))
        ],
      ),
    );
  }
}
