

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:signup/Homepage.dart';
import 'package:signup/bottom.dart';
import 'package:signup/signup.dart';
import 'package:signup/val.dart';
import 'firebase_options.dart';
import 'package:signup/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'signup.dart';
import 'package:fluttertoast/fluttertoast.dart';



class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {


  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GoogleSignIn  googleSignIn = GoogleSignIn(
    clientId:
    "726617485507-qjnjafu3ctdi8mq7irspk9n7mgdc5ltg.apps.googleusercontent.com"
  );




  Future<User?> signInWithGoogle(BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        var googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        GoogleSignInAccount googleUser = (await GoogleSignIn().signIn())!;
        final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
        final googleAuthCredential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }
      final user = userCredential.user;
      if (user != null) {

        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context)=>Bottom()),(route)
        {
          return false;
        });

      }
    } catch (e) {
      print(e);
    }
  }
  Future<void>Login()async{
    try{
      setState(() {

      });
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Bottom()));
    }
    catch(e){
         // Fluttertoast.showToast(msg: "$e");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("login")),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter mail id",
                hintStyle: TextStyle(color: Colors.black)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: password,
              decoration:InputDecoration(
                border: OutlineInputBorder(),
                hintText: "enter the password",
                hintStyle: TextStyle(color: Colors.black),
                labelStyle: TextStyle(color: Colors.red)
              ) ,
            ),
          ),
          ElevatedButton(onPressed: (){
            Login();
            }, child: Text("login")),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: Icon(Icons.account_circle, size: 24),
              label: Text(
                "Continue with Google",
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ), onPressed: (){
              setState(() {
                signInWithGoogle(context);
              }
              );
              },
            ),
          ),
          Spacer(),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Signup()));
          }, child: Text("sign up")),
        ],
      ),
    );
  }
}



