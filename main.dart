
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signup/Homepage.dart';
import 'package:signup/spl.dart';
import 'package:signup/tog.dart';
import 'package:signup/toggbutt.dart';


import 'bottom.dart';
import 'firebase_options.dart';
import 'imgpic.dart';





Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(create: (BuildContext context)=>tubb(),
      child: const MyApp()));
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    Provider.of<tubb>(context,listen: false).load();
    super.initState();
  }

  @override

  Widget build(BuildContext context) {

    var provider = Provider.of<tubb>(context);



    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:provider.show?ThemeData.dark():ThemeData.light(),
        home: inputt(),
    );
  }
}

class tubb extends ChangeNotifier {

  bool show = true;

  void bol({required bool mode}) async
  {
    show = mode;

    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('repeat', show);
    notifyListeners();
  }

  Future<void> load() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    show = prefs.getBool('repeat')! ?? true;

    notifyListeners();
  }
}