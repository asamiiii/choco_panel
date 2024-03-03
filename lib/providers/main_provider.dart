import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/data_source/fire_storage.dart';
import 'package:choco_panel/data_source/remote_firebase.dart';
import 'package:choco_panel/models/announ_model.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:toast/toast.dart';

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
    // String word = 'hello';
// String lastCharacter = ;
// print(lastCharacter);
    if (nameC.text.isEmpty ||
        discriptionC.text.isEmpty ||
        categoryC.text.isEmpty ||
        branchC.text.isEmpty ||
        ingredientsC.text.isEmpty ||
        nutritionDeclarationC.text[nutritionDeclarationC.text.length - 1] ==
            '-' ||
        nutritionDeclarationC.text[nutritionDeclarationC.text.length - 1] ==
            ':' ||
        nutritionDeclarationC.text.isEmpty ||
        imageUrl == null ||
        imagesUrl!.isEmpty) {
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
    bool haveErro = false;
    notifyListeners();
    try {
      await FirebaseHelper.addItemToFirebase(item: item);
    } catch (error) {
      debugPrint('Error : $error');
      haveErro = true;
      isLoading = false;
      notifyListeners();
    }

    if (haveErro == true) {
      Toast.show('Error when adding the data',
          duration: 5,
          gravity: Toast.bottom,
          backgroundColor: HexColor("#FF0000"));
    } else {
      Toast.show('Item is added Sucssesfully',
          duration: 5, gravity: Toast.bottom);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> addAnnouncement(Announcment announcment) async {
    isLoading = true;
    bool haveErro = false;
    notifyListeners();
    try {
      await FirebaseHelper.addAnnouncToFirebase(announcment: announcment);
    } catch (error) {
      debugPrint('Error : $error');
      haveErro = true;
      isLoading = false;
      notifyListeners();
    }

    if (haveErro == true) {
      Toast.show('Error when adding the data',
          duration: 5,
          gravity: Toast.bottom,
          backgroundColor: HexColor("#FF0000"));
    } else {
      Toast.show('Announcment is added Sucssesfully',
          duration: 5, gravity: Toast.bottom);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> getAnnouncment() async {
    announcmentList.clear();
    DummyData.announcments.clear();
    isLoading = true;
    notifyListeners();
    await FirebaseHelper.getAnnouncmentFromFirestore();
    for (var element in DummyData.announcments) {
      announcmentList.add(element);
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteAnnouncment({required String? announId}) async {
    isLoading = true;
    bool haveErro = false;
    notifyListeners();
    try {
      await FirebaseHelper.deleteAnnounc(announId);
    } catch (error) {
      debugPrint('Error : $error');
      haveErro = true;
      isLoading = false;
      notifyListeners();
    }

    if (haveErro == true) {
      Toast.show('Error when delete the data',
          duration: 5,
          gravity: Toast.bottom,
          backgroundColor: HexColor("#FF0000"));
    } else {
      Toast.show('Item is deleted Sucssesfully',
          duration: 5,
          gravity: Toast.bottom,
          backgroundColor: HexColor("#FF0000"));
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> editAnnouncment(
      {required String announId, required Announcment announ}) async {
    isLoading = true;
    bool haveErro = false;
    notifyListeners();
    try {
      await FirebaseHelper.updateAnnouncment(announ: announ, itemID: announId);
    } catch (error) {
      debugPrint('Error : $error');
      haveErro = true;
      isLoading = false;
      notifyListeners();
    }

    if (haveErro == true) {
      Toast.show('Error when Update the data',
          duration: 5, gravity: Toast.bottom);
    } else {
      Toast.show('Item is Updated Sucssesfully',
          duration: 5, gravity: Toast.bottom);
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> deleteItem({required String? itemId}) async {
    isLoading = true;
    bool haveErro = false;
    notifyListeners();
    try {
      await FirebaseHelper.deleteItem(itemId);
    } catch (error) {
      debugPrint('Error : $error');
      haveErro = true;
      isLoading = false;
      notifyListeners();
    }

    if (haveErro == true) {
      Toast.show('Error when delete the data',
          duration: 5,
          gravity: Toast.bottom,
          backgroundColor: HexColor("#FF0000"));
    } else {
      Toast.show('Item is deleted Sucssesfully',
          duration: 5,
          gravity: Toast.bottom,
          backgroundColor: HexColor("#FF0000"));
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> editItem(
      {required String itemId, required ItemModel item}) async {
    isLoading = true;
    bool haveErro = false;
    notifyListeners();
    try {
      await FirebaseHelper.updateItem(item: item, itemID: itemId);
    } catch (error) {
      debugPrint('Error : $error');
      haveErro = true;
      isLoading = false;
      notifyListeners();
    }

    if (haveErro == true) {
      Toast.show('Error when Update the data',
          duration: 5, gravity: Toast.bottom);
    } else {
      Toast.show('Item is Updated Sucssesfully',
          duration: 5, gravity: Toast.bottom);
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

  Future<void> uploadeImageAndGetUrl() async {
    isLoading = true;
    notifyListeners();
    imageUrl = '';
    notifyListeners();

    imageUrl = await FireStorage.uploadImageToStorage();
    isLoading = false;

    debugPrint('item?.image $imageUrl');
    notifyListeners();
    // return imageUrl ?? '';
  }

  clearImagesUrlFromFireStorage() async {
    List<String> imgesList = await FireStorage.getAllImageUrls();
    List<String?> localImageUrls = [/* List of local image URLs */];


    for (var element in DummyData.chocoList) { 
      localImageUrls.add(element.image);
      element.imagesList?.split(',').forEach((element) {
        localImageUrls.add(element);
      });
    }

// Find unused images in Firebase Storage
    List<String> unusedFirebaseImages = imgesList
        .where((imageUrl) => !localImageUrls.contains(imageUrl))
        .toList();

// Delete unused images from Firebase Storage
    for (var imageUrl in unusedFirebaseImages) {
     await FireStorage.deleteImageFromCloud(imageUrl);
      debugPrint('deleted item');
    }
  }

  Future<void> uploadeMultiImagesAndGetUrl() async {
    isLoading = true;
    notifyListeners();
    imagesUrl?.clear();
    imagesUrl = await FireStorage.uploadMultiImagesToStorage();
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
      var splitted = element.category?.trim().split(',');
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

  initTextFiledsWhenEdit({ItemModel? item}) {
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
