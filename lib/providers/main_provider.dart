import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int? selectedIndex = 0;
  
  TextEditingController nameC = TextEditingController();

  TextEditingController discriptionC = TextEditingController();

  TextEditingController priceC = TextEditingController();

  TextEditingController categoryC = TextEditingController();

  TextEditingController branchC = TextEditingController();

  TextEditingController discountC = TextEditingController();

  TextEditingController ingredientsC = TextEditingController();

  TextEditingController nutritionDeclarationC = TextEditingController();

  setSiderIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }
}
