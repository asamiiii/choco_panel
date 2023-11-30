import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ImagesSection extends StatefulWidget {
  ItemModel? item;
  bool? isUpdate;
  ImagesSection({Key? key, this.item,this.isUpdate}) : super(key: key);

  @override
  State<ImagesSection> createState() => _ImagesSectionState();
}

class _ImagesSectionState extends State<ImagesSection> {
  // List<String> imagesList = [];
  // String mainImageUrl = '';
  // List<String> detailsImages = [];
  @override
  void initState() {

    var provider = context.read<MainProvider>();
    // provider.imagesUrl?.clear();
    // provider.imageUrl=null;
    if(widget.item !=null){
        widget.item?.imagesList?.trim().split(',').forEach((element) {
      if (element.isNotEmpty) {
        provider.imagesUrl?.add(element);
      }
      provider.imageUrl = widget.item?.image; 
    });
    }
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer<MainProvider>(
        builder: (context, provider, child) => provider.isLoading == false
            ? Column(
                children: [
                  SingleChildScrollView(
                    child: Row(
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            children: [
                               Text(
                                AppStrings.mainImage,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              ClipOval(
                                  child:  provider.imageUrl != null
                                      ? ImageNetwork(
                                          image: provider.imageUrl ?? '',
                                          height: 150,
                                          width: 150)
                                      : const Icon(
                                          Icons.add_photo_alternate,
                                          size: 100,
                                        )),
                              TextButton(
                                  onPressed: () async {
                                    await provider.uploadeImageAndGetUrl();
                                    debugPrint(
                                        'mainImageUrl : ${provider.imageUrl}');
                                  },
                                  child:  Text(AppStrings.change)),
                              const SizedBox(
                                height: 10,
                              ),
                               Text(
                                AppStrings.detailsImages,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 100,
                                width: 300,
                                child:provider.imagesUrl!.isNotEmpty ?
                                    ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            ClipOval(
                                                child: ImageNetwork(
                                                    image: provider.imagesUrl![index],
                                                    height: 100,
                                                    width: 100)),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: 5,
                                            ),
                                        itemCount: provider.imagesUrl!.length)
                                    : const Row(
                                        children: [
                                          Icon(
                                            Icons.add_photo_alternate,
                                            size: 100,
                                          ),
                                          Icon(
                                            Icons.add_photo_alternate,
                                            size: 100,
                                          )
                                        ],
                                      )
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () async {
                                    provider.uploadeMultiImagesAndGetUrl();
                                  },
                                  child:  Text(AppStrings.change)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
