
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/models/announ_model.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
// import 'package:path/path.dart' as p;
// import 'package:firebase_storage/firebase_storage.dart';
// import '../../models/dept_model.dart';
// import '../../models/invoice_model.dart';

class FirebaseHelper {
  // static String? collectionName;

 static CollectionReference getInvoiceCollection() {
    return FirebaseFirestore.instance
        .collection('benha')
        .withConverter<ItemModel>(
          fromFirestore: (snapshot, _) => ItemModel.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

  static CollectionReference getAnnouncmentCollection() {
    return FirebaseFirestore.instance
        .collection('announcment')
        .withConverter<Announcment>(
          fromFirestore: (snapshot, _) => Announcment.fromJson(snapshot.data()!),
          toFirestore: (task, _) => task.toJson(),
        );
  }

    static Future getItemsFromFirestore() async{
      DummyData.chocoList.clear();
     var querySnapshot =await getInvoiceCollection().get();
    // Get data from docs and convert map to List
    for (var element in querySnapshot.docs) {
      DummyData.chocoList.add(element.data() as ItemModel);
    }
    debugPrint('Firebase :${DummyData.chocoList}');
    // handleCategoryItemsList(branchName: branch);
    // handleBranchesItemsList(branchName: branch);
    // return querySnapshot;
  }

      static Future getAnnouncmentFromFirestore() async{
    //   DummyData.chocoList.clear();
     var querySnapshot =await getAnnouncmentCollection().get();
    // // Get data from docs and convert map to List
    for (var element in querySnapshot.docs) {
      DummyData.announcments.add(element.data() as Announcment);
    }
    // debugPrint('Firebase :${DummyData.chocoList}');
    // handleCategoryItemsList(branchName: branch);
    // handleBranchesItemsList(branchName: branch);
    // return querySnapshot;
  }

  // Future<String> addInvoiceToFirebase(
  //     {String? id,
  //     required String clientName,
  //     required double total,
  //     required double deptTotal,
  //     required String imageUrl,
  //     required String notes,
  //     required bool isDelivered,
  //     required DateTime date}) async {
  //   var collection = getInvoiceCollection();
  //   var docRef = collection.doc();
  //    await docRef.set(Invoice(
  //       id: docRef.id,
  //       name: clientName,
  //       total: total,
  //       deptTotal: deptTotal,
  //       imageUrl: imageUrl,
  //       isDelivered: isDelivered,
  //       notes: notes,
  //       date: date));
  //       return docRef.id;
  // }

// static Future<String?> uploadImageOnFirebaseStorage() async {
//   PickedFile pickedFile =
//           await ImagePicker.pick(source: ImageSource.gallery);

// final fileBytes = pickedFile.readAsBytes();
// var now = DateTime.now().millisecondsSinceEpoch;
// Reference reference =
//   FirebaseStorage.instance.ref().child("images/$now");

// UploadTask uploadTask = reference.putData(fileBytes);

// //Upload the file to firebase
// StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

// // Waits till the file is uploaded then stores the download url
// String url = await taskSnapshot.ref.getDownloadURL();
//   return url;
// }


static Future<String> uploadImageToStorage() async {
  String imageUrl='';
  PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
if(kIsWeb){
Reference _reference = FirebaseStorage.instance
        .ref()
        .child('images/${p.basename(pickedFile!.path)}');
    await _reference
        .putData(
      await pickedFile!.readAsBytes(),
      SettableMetadata(contentType: 'image/jpeg'),
    )
        .whenComplete(() async {
      await _reference.getDownloadURL().then((value) {
        imageUrl = value;
      });
    });
 }else{
//write a code for android or ios
}
return imageUrl;
}




  // Future<QuerySnapshot<Invoice>> seaechInvoicesFromFirestore(
  //     String searchWord) async {
  //   QuerySnapshot<Invoice> querySnapshot = await getInvoiceCollection()
  //       .where('name', isGreaterThanOrEqualTo: searchWord)
  //       .get() as QuerySnapshot<Invoice>;
  //   // Get data from docs and convert map to List
  //   return querySnapshot;
  // }

  // Future<void> deleteUser(String? taskId, String url) async {
  //   var collection = getInvoiceCollection();
  //   var docRef = collection.doc(taskId);
  //   url!='' ? await deleteImageFromCloud(url):null;    //! delete this image from FireBase Cloud .
  //   await deleteDept(taskId);           //! delete Dept collection related this document .
  //   return docRef
  //       .delete()
  //       .then((value) => debugPrint("User Deleted"))
  //       .catchError((error) => debugPrint("Failed to delete user: $error"));
  // }

  // deleteImageFromCloud(String url) {
  //   FirebaseStorage.instance.refFromURL(url).delete();
  // }

  // Future<void> updateTask(String taskId, Invoice invoice) {
  //   var collection = getInvoiceCollection();
  //   var docRef = collection.doc(taskId);
  //   return docRef.update({
  //     'name': invoice.name,
  //     'total': invoice.total,
  //     'imageUrl': invoice.imageUrl,
  //     'notes': invoice.notes,
  //     'isDelivered': invoice.isDelivered,
  //   });
  // }

  // Future<void> updateDeptTotal(String taskId, double deptTotal) {
  //   var collection = getInvoiceCollection();
  //   var docRef = collection.doc(taskId);
  //   return docRef.update({
  //     'deptTotal': deptTotal,
  //   });
  // }
  //! Dept FireBase Oprations
 
  // CollectionReference getDeptCollection(String id) {
  //   return getInvoiceCollection().doc(id).collection('dept').withConverter<Dept>(
  //         fromFirestore: (snapshot, _) => Dept.fromJson(snapshot.data()!),
  //         toFirestore: (value, options) => value.toJson(),
  //       );
  // }

  // addDeptToFirebase({String? id, double? done, double? dept}) {
  //   var collection = getDeptCollection(id!);
  //   var docRef = collection.doc();
  //   return docRef.set(Dept(
  //     id: docRef.id,
  //     done: done!,
  //     dept: dept!,
  //     date: DateTime.now()
  //   ));
  // }

  // Stream<QuerySnapshot<Dept?>> getDeptHistory(String id){
  //   Stream<QuerySnapshot<Dept?>> querySnapshot = getDeptCollection(id)
  //       .orderBy('date', descending: true)
  //       .snapshots() as Stream<QuerySnapshot<Dept?>>;

  //       return querySnapshot;
  // }

  //  Future<void> deleteDept(String? deptId) async {
  //   var collection = getDeptCollection(deptId!);
  //   var docRef = collection.doc();
    
  //    docRef
  //       .delete()
  //       .then((value) => debugPrint("User Deleted"))
  //       .catchError((error) => debugPrint("Failed to delete user: $error"));
  // }



// Future<QuerySnapshot<Invoice>> getAllDoneInvoices() async {
//     QuerySnapshot<Invoice> querySnapshot = await getInvoiceCollection()
//         .where('deptTotal', isLessThanOrEqualTo: 0.0)
//         .get() as QuerySnapshot<Invoice>;
//     // Get data from docs and convert map to List
//     return querySnapshot;
//   }


  
}