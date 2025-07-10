import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup/tog.dart';

import 'main.dart';

class thenn extends StatefulWidget {
  const thenn({super.key});

  @override
  State<thenn> createState() => _thennState();
}

class _thennState extends State<thenn> {

  bool show = true;

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      show = prefs.getBool('isDarkMode') ?? true;
    });
  }

  Future<void> _saveTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', value);
  }

  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<tubb>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: show ? ThemeData.dark():ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Toggle Theme"),
        ),
        body:
        Center(
          child: Column(
            children: [
              Switch(value: provider.show, onChanged: (value)
              {
                setState(() {
                  show = value;
                  provider.bol(mode: show);
                });
                _saveTheme(value);
              }),
              Spacer(),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>togbut()));
              }, child: Text("Home"))
            ],
          ),
        ),

        )
       );
        }
    }