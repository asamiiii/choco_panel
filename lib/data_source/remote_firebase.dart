import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/models/announ_model.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirebaseHelper {
  //* ------ Items Services ------- *//

  static CollectionReference getItemsCollection() {
    return FirebaseFirestore.instance
        .collection('Items')
        .withConverter<ItemModel>(
          fromFirestore: (snapshot, _) => ItemModel.fromJson(snapshot.data()!),
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

  static Future<String> addItemToFirebase({required ItemModel? item}) async {
    var collection = getItemsCollection();
    var docRef = collection.doc();
    item?.id = docRef.id;
    await docRef.set(item);
    return docRef.id;
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

  //* ------ Announcment Services ------- *//

  static CollectionReference getAnnouncmentCollection() {
    return FirebaseFirestore.instance
        .collection('Announcment')
        .withConverter<Announcment>(
          fromFirestore: (snapshot, _) =>
              Announcment.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static Future getAnnouncmentFromFirestore() async {
    DummyData.announcments.clear();
    var querySnapshot = await getAnnouncmentCollection().get();
    // // Get data from docs and convert map to List
    for (var element in querySnapshot.docs) {
      DummyData.announcments.add(element.data() as Announcment);
    }
  }

  static Future<String> addAnnouncToFirebase(
      {required Announcment? announcment}) async {
    var collection = getAnnouncmentCollection();
    var docRef = collection.doc();
    announcment?.id = docRef.id;
    await docRef.set(announcment);
    return docRef.id;
  }

  static Future<void> updateAnnouncment(
      {required String itemID, required Announcment announ}) {
    var collection = getAnnouncmentCollection();
    var docRef = collection.doc(itemID);
    return docRef.update({'txt': announ.txt, 'branch': announ.branch});
  }

  static Future<void> deleteAnnounc(String? announId) async {
    var collection = getAnnouncmentCollection();
    var docRef = collection.doc(announId);

    docRef
        .delete()
        .then((value) => debugPrint("Announ Deleted"))
        .catchError((error) => debugPrint("Failed to delete Announ: $error"));
  }
}
