import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/data_source/remote_firebase.dart';
import 'package:choco_panel/models/announ_model.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  int? selectedIndex = 0;
  bool isLoading = false;
  List<String>? categoryList = [];
  List<String> branches = [];
  List<Announcment> announcmentList = [];

  bool formValid = true;

  String? imageUrl;

  List<String>? imagesUrl = [];

  TextEditingController nameC = TextEditingController();

  TextEditingController discriptionC = TextEditingController();

  TextEditingController priceC = TextEditingController();

  TextEditingController categoryC = TextEditingController();

  TextEditingController branchC = TextEditingController();

  TextEditingController discountC = TextEditingController();

  TextEditingController ingredientsC = TextEditingController();

  TextEditingController nutritionDeclarationC = TextEditingController();



  formValidation() {
    if (nameC.text.isEmpty ||
        discriptionC.text.isEmpty ||
        categoryC.text.isEmpty ||
        branchC.text.isEmpty ||
        ingredientsC.text.isEmpty ||
        nutritionDeclarationC.text.isEmpty) {
      formValid = false;
      notifyListeners();
    } else {
      formValid = true;
      notifyListeners();
    }
  }

  setSiderIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  Future<void> addItem(ItemModel item) async {
    isLoading = true;
    notifyListeners();
    try{
      await FirebaseHelper.addItemToFirebase(item:item);
    }catch(error){
      debugPrint('Error : $error');
     isLoading = false;
    }
    
    isLoading = false;
    notifyListeners();
  }

  getItems() async {
    isLoading = true;
    notifyListeners();
    await FirebaseHelper.getItemsFromFirestore();
    isLoading = false;
    notifyListeners();
  }

  Future<String> uploadeImageAndGetUrl() async {
    isLoading = true;
    notifyListeners();
    imageUrl = await FirebaseHelper.uploadImageToStorage();
    isLoading = false;

    debugPrint('item?.image $imageUrl');
    notifyListeners();
    return imageUrl ?? '';
  }

  Future<void> uploadeMultiImagesAndGetUrl() async {
    isLoading = true;
    notifyListeners();
    imagesUrl = await FirebaseHelper.uploadMultiImagesToStorage();
    isLoading = false;

    debugPrint('item?.image $imagesUrl');
    notifyListeners();
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
    initTextFiledsWhenEdit(ItemModel? item) {
    nameC = TextEditingController(text: item != null ? item.name : '');

    discriptionC =
        TextEditingController(text: item != null ? item.discription : '');

    priceC = TextEditingController(text: item != null ? item.price : '');

    categoryC = TextEditingController(text: item != null ? item.category : '');

    branchC = TextEditingController(text: item != null ? item.branch : '');

    discountC = TextEditingController(text: item != null ? item.discount : '');

    ingredientsC =
        TextEditingController(text: item != null ? item.ingredients : '');

    nutritionDeclarationC = TextEditingController(
        text: item != null ? item.nutritionDeclaration : '');
  }
}
