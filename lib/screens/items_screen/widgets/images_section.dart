import 'dart:io';

import 'package:choco_panel/models/item_model.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:image_picker/image_picker.dart';

class ImagesSection extends StatefulWidget {
ItemModel? item; 
   ImagesSection({Key? key,this.item}) : super(key: key);

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  List<String>imagesList=[];
  @override
  void initState() {
    widget.item?.imagesList?.trim().split(',').forEach((element) { 
      if(element.isNotEmpty){
      imagesList.add(element);
      }
        
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              const Text(
                                'Main Image',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ClipOval(
                                  child: widget.item!=null ?  ImageNetwork(
                                      image:widget.item?.image ?? '',
                                      height: 150,
                                      width: 150):const Icon(Icons.add_photo_alternate,size: 100,)),
                              TextButton(onPressed: () async{
                                final pickedFile =
                                    await ImagePicker().pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 70,
                                );
                                if (pickedFile != null) {
                                  debugPrint('pickedFile :$pickedFile');
                                  final imageFile = File(pickedFile.path);
                                  debugPrint('imageFile :$imageFile');
                              }}, child: const Text('Change')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Details Images ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 100,
                                // width: 300,
                                child: widget.item!=null? ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => ClipOval(
                                        child:ImageNetwork(
                                            image:imagesList[index],
                                            height: 100,
                                            width: 100)),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 5,
                                        ),
                                    itemCount: imagesList.length):const Row(
                                      children: [Icon(Icons.add_photo_alternate,size: 100,),Icon(Icons.add_photo_alternate,size: 100,)],
                                    ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () async{
                                    List<XFile>? imageFileList = [];
                                    final pickedFiles =
                                    await ImagePicker().pickMultiImage();
                                if (pickedFiles.isNotEmpty) {
                                  imageFileList.addAll(pickedFiles);
                                  debugPrint('imageFileList :$imageFileList');
                              }
                                  }, child: const Text('Change')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
  }
}