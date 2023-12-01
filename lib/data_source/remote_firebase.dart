import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/models/announ_model.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseHelper {
  static CollectionReference getItemsCollection() {
    return FirebaseFirestore.instance
        .collection('Items')
        .withConverter<ItemModel>(
          fromFirestore: (snapshot, _) => ItemModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static CollectionReference getAnnouncmentCollection() {
    return FirebaseFirestore.instance
        .collection('Announcment')
        .withConverter<Announcment>(
          fromFirestore: (snapshot, _) =>
              Announcment.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future getItemsFromFirestore() async {
    DummyData.chocoList.clear();
    var querySnapshot = await getItemsCollection().get();
    // Get data from docs and convert map to List
    for (var element in querySnapshot.docs) {
      DummyData.chocoList.add(element.data() as ItemModel);
    }
    debugPrint('Firebase :${DummyData.chocoList}');
  }

  static Future getAnnouncmentFromFirestore() async {
    var querySnapshot = await getAnnouncmentCollection().get();
    // // Get data from docs and convert map to List
    for (var element in querySnapshot.docs) {
      DummyData.announcments.add(element.data() as Announcment);
    }
  }

  static Future<String> addItemToFirebase({required ItemModel? item}) async {
    var collection = getItemsCollection();
    var docRef = collection.doc();
    item?.id = docRef.id;
    await docRef.set(item);
    return docRef.id;
  }

  static Future<List<String>> uploadMultiImagesToStorage() async {
    List<String> imageUrl = [];
    List<XFile>? pickedFile = await ImagePicker().pickMultiImage();
    debugPrint('Multi: $pickedFile');

    if (kIsWeb) {
      await Future.wait(pickedFile.map((element) async {
        Reference reference = FirebaseStorage.instance
            .ref()
            .child('images/${p.basename(element.path)}');

        await reference.putData(
          await element.readAsBytes(),
          SettableMetadata(contentType: 'image/jpeg'),
        );

        String downloadURL = await reference.getDownloadURL();
        imageUrl.add(downloadURL);
        debugPrint('Add image');
      }));

      debugPrint('image length: ${imageUrl.length}');
    } else {
      // Write code for Android or iOS
    }

    return imageUrl;
  }

  static Future<String> uploadImageToStorage() async {
    String imageUrl = '';
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    if (kIsWeb) {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child('images/${p.basename(pickedFile!.path)}');
      await reference
          .putData(
        await pickedFile.readAsBytes(),
        SettableMetadata(contentType: 'image/jpeg'),
      )
          .whenComplete(() async {
        await reference.getDownloadURL().then((value) {
          imageUrl = value;
        });
      });
    } else {
//write a code for android or ios
    }
    return imageUrl;
  }

  static Future<void> updateItem(
      {required String itemID, required ItemModel item}) {
    var collection = getItemsCollection();
    var docRef = collection.doc(itemID);
    return docRef.update({
      'name': item.name,
      'image': item.image,
      'imagesList': item.imagesList,
      'discription': item.discription,
      'category': item.category,
      'branch': item.branch,
      'price': item.price,
      'discount': item.discount,
      'ingredients': item.ingredients,
      'nutritionDeclaration': item.nutritionDeclaration
    });
  }

  static Future<void> deleteItem(String? itemId) async {
    var collection = getItemsCollection();
    var docRef = collection.doc(itemId);

    docRef
        .delete()
        .then((value) => debugPrint("Item Deleted"))
        .catchError((error) => debugPrint("Failed to delete Item: $error"));
  }
}
