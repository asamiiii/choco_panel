import 'dart:io';

import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/data_source/remote_firebase.dart';
import 'package:choco_panel/models/announ_model.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int? selectedIndex = 0;
  bool isLoading = false;
  List<String>? categoryList = [];
  List<String> branches = [];
  List<Announcment> announcmentList = [];
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

  getItems() async {
    isLoading = true;
    notifyListeners();
    await FirebaseHelper.getItemsFromFirestore();
    isLoading = false;
    notifyListeners();
  }

  Future<String> uploadeImageAndGetUrl()async{
    isLoading = true;
    notifyListeners();
   var imageUrl= await FirebaseHelper.uploadImageToStorage();
   isLoading =false;
   notifyListeners();
   return imageUrl??'';
  }

//! Keep one item if item is found more than one time
  List<String>? keepOneInstance(List<String>? list) {
    final seenItems = <dynamic>{};

    final filteredList = list?.where((item) {
      final hasSeen = seenItems.contains(item);
      seenItems.add(item);
      return !hasSeen;
    }).toList();

    return filteredList ?? [];
  }

// Handle Categories text to list using splittin by comma ','
  void handleCategoryItemsList() {
    for (var element in DummyData.chocoList) {
      /*---> split the cat list <---*/
      var splitted = element.category?.split(',');
      categoryList?.addAll(splitted ?? []);
    }
    categoryList = keepOneInstance(categoryList);

    //! initiat the first item in category list as default
  }

  void handleBranchesItemsList() {
    for (var element in DummyData.chocoList) {
      /*---> split the cat list <---*/
      var splitted = element.branch?.split(',');
      branches.addAll(splitted ?? []);
    }
    branches = keepOneInstance(branches) ?? [];

    //! initiat the first item in category list as default
  }

/*Initiat the first item in category list as default*/
  void setSelectedCategory({String? categoryTxt, String? branch}) {
    debugPrint('branch set sel :$branch');
    DummyData.filteredChocoList = DummyData.chocoList.where((element) {
      return element.category!.contains(categoryTxt ?? '') &&
          element.branch!.contains(branch ?? '');
    }).toList();
    notifyListeners();
  }

  getAnnouncment() async {
    isLoading = true;
    notifyListeners();
    await FirebaseHelper.getAnnouncmentFromFirestore();
    for (var element in DummyData.announcments) {
      announcmentList.add(element);
    }
    isLoading = false;
    notifyListeners();
  }
}
