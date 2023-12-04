import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;

class FireStorage {
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

  static Future<List<String>> getAllImageUrls() async {
    List<String> imageUrls = [];

    // Reference to your Firebase Storage bucket
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageRef = storage.ref('images/');

    // List all items (files) in the bucket
    ListResult result = await storageRef.listAll();

    // Iterate through each item and add the download URL to the list
    for (Reference ref in result.items) {
      String downloadUrl = await ref.getDownloadURL();
      imageUrls.add(downloadUrl);
    }
    debugPrint('imageUrls : ${imageUrls.length}');

    return imageUrls;
  }
}
