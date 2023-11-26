import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier{
  int? selectedIndex = 0;

  setSiderIndex({required int index}){
    selectedIndex = index;
    notifyListeners();
  }
}