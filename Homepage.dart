import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class Homepagee extends StatefulWidget {
  const Homepagee({super.key});

  @override
  State<Homepagee> createState() => _HomepageeState();
}

class _HomepageeState extends State<Homepagee> {


  var user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"),),
      body: Column(
        children: [
          Text(user!.email.toString()),
        ],
      ),
    );
  }
}
