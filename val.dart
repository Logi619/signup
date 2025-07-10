import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup/outputt.dart';

import 'main.dart';
class visi extends StatefulWidget {
  const visi({super.key});

  @override
  State<visi> createState() => _visiState();
}
List <String>items=[];

class _visiState extends State<visi> {
  final _key = GlobalKey<FormState>();
  bool _show1 = false;
  TextEditingController ctrl = TextEditingController();
  TextEditingController ctrl1 = TextEditingController();
  TextEditingController ctrl2 = TextEditingController();
  TextEditingController ctrl3 = TextEditingController();



  void additem()
  {
    String a=ctrl.text;
    String b=ctrl1.text;
    String c=ctrl2.text;
    String d=ctrl3.text;

    items.add("$a\n$b\n$c\n$d");
    setState(() {

    });
  }


  route(String data){
    setState(() {

    });
    Navigator.push(context, MaterialPageRoute(builder: (context)=>str(a: data))).
    then((edit)
    {
      setState(() {
        items[items.indexWhere((element)=>element==data)]=edit;
      });
    });
  }

  void list()async{

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('items',items);

    setState(() {
      items;
    });
  }
  a(){
    setState(() {
      ctrl.text.isNotEmpty && ctrl1.text.isNotEmpty && ctrl2.text.isNotEmpty && ctrl3.text.isNotEmpty? _show1 = true : _show1 =
      false;
    });
  }
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<tubb>(context);

    return Scaffold(
        body:
        SingleChildScrollView(
          child: Form(
            key:_key,
            child:
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ctrl,
                    onChanged: (i){
                      a();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.nature),
                        hintText: 'Enter your name',
                        border: OutlineInputBorder()
                    ),
                    validator:(input){
                      if (input == null || input .isEmpty){
                        return "please enter a valid name";
                      }
                    } ,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ctrl1,
                    onChanged: (i){
                      a();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.message),
                      hintText: "enter the mail id",
                      border: OutlineInputBorder(),
                    ),
                    validator: (input){
                      if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!)){
                        return 'please enter a valid id';
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      controller: ctrl2,
                      onChanged: (i){
                        a();
                      },
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: "enter the password",
                        border: OutlineInputBorder(),
                      ),
                      validator: (input){
                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(input!)){
                          return "please enter a valid mobile number";
                        }
                      }
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: ctrl3,
                    onChanged: (i){
                      a();
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.install_mobile),
                      hintText: "enter the mobile number",
                      border: OutlineInputBorder(),
                    ),
                    validator: (input){
                      if (RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(input!)){
                        return "please enter a valid mobile number";
                      }
                    },
                  ),
                ),
                Visibility(
                    visible: _show1,
                    child: ElevatedButton(
                        onPressed: (){
                          additem();
                        },
                        child: Text('Login')
                    )
                ),
                  
            Container(
            height: 300,
            child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext,index)
            {
            return GestureDetector(
            onTap: ()
            {
            route(items[index]);
            },
            child: Column(
            children: [
            Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
            color: Colors.cyanAccent
            ),
            child: Row(
            children: [
            Text(items[index],style: TextStyle(color: Colors.black),),
            IconButton(onPressed: ()
            {
            showDialog(context: (context), builder: (BuildContext)
            {
            return AlertDialog(
            title: TextFormField(controller: ctrl1,),
            actions: [
            ElevatedButton(onPressed: ()
            {
            setState(() {
            items[index]=ctrl1.text;
            Navigator.pop(context);
            });
            }, child: Text("Update"))
            ],
            );
            });
            }, icon: Icon(Icons.add,color: Colors.black,)),
            IconButton(onPressed: ()
            {
            setState(() {
            items.removeAt(index);
            });
            }, icon: Icon(Icons.delete,color: Colors.black,))
            ],
            ),
            )
            ],
            ),
            );
            }),
            )
            ]
            )
            ),
        )
    );
  }
}