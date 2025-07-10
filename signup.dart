import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:signup/Homepage.dart';
import 'package:signup/bottom.dart';



class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController email = new TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> create() async
  {

    setState(() {

    });
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text);

    Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepagee()));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Signup"),),
      body: Column(
        children: [
          TextFormField(controller: email,),
          TextFormField(controller: password,),
          ElevatedButton(onPressed: (){
            create();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));
          }, child: Text("Signup")),

        ],
      ),
    );
  }
}
