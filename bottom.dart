import 'package:flutter/material.dart';
import 'package:signup/imgpic.dart';
import 'package:signup/val.dart';


class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {

  int _index=0;

  final bot=[
    visi(),
    ImgPic()
  ];

  void navi(index)
  {
    setState(() {
      _index=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bot[_index],
      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),

        ],
        currentIndex: _index,
        onTap: navi,
      ),

    );
  }
}