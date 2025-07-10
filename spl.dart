
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:signup/bottom.dart';
import 'package:signup/imgpic.dart';
import 'package:signup/login%20page.dart';
import 'package:signup/val.dart';






class inputt extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<inputt> {
  @override
  var user=FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      if(user!=null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));
      }
      else
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>login()));
      }
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Google Account ',
          style: TextStyle(fontSize: 40,color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}