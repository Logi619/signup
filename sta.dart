import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

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