import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:signup/login%20page.dart';

import 'main.dart';



class ImgPic extends StatefulWidget {
  const ImgPic({super.key});

  @override
  State<ImgPic> createState() => _ImgPicState();
}

class _ImgPicState extends State<ImgPic> {
  bool show = true;
  File? image;
  final ImagePicker _picker = ImagePicker();



  Future<void> _pickImageFromGallery() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    }
  }

  Future<void> _takePicture() async {
    final XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);


      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<tubb>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  provider.show? ThemeData.dark():ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Theme"),
          actions: [
            Switch(value: provider.show, onChanged: (value)
            {
              setState(() {
                show = value;
                provider.bol(mode: show);
              });
            })
          ],
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                onPressed: _pickImageFromGallery,
                child: const Text("Select an image from gallery"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: _takePicture,
                child: const Text("Take a picture"),
              ),
            ),
            Spacer(),
            ElevatedButton(onPressed: ()async{
              await FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
            }, child: Text("signout")),
            Container(
              height: 300,
              width: 300,
              child: image != null
                  ? Image.file(
                image!,
                fit: BoxFit.fill,
              )
                  : const Center(child: Text("No image selected")),
            ),
          ],

        ),
      ),
    );


  }
}