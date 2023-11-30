import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/items_screen/widgets/big_tf.dart';
import 'package:choco_panel/screens/items_screen/widgets/images_section.dart';
import 'package:choco_panel/screens/items_screen/widgets/small_text_field_section.dart';
import 'package:choco_panel/screens/main_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ItemDetails extends StatefulWidget {
  ItemModel? item;
  ItemDetails({super.key, this.item});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool? editItem;

  @override
  void initState() {
    var provider = context.read<MainProvider>();
    provider.formValid=true;
    if(widget.item != null){
      provider.initTextFiledsWhenEdit(widget.item);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) => provider.isLoading==false? Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  Text('${AppStrings.itemId} ${widget.item?.id}'),
          ),
          floatingActionButton: SizedBox(
            width: 120,
            child: FloatingActionButton(
              onPressed: () async{
                String? imgesListInString = provider.imagesUrl?.join(',');
                provider.formValidation();
                if(provider.formValid==true){
                 await provider.addItem(ItemModel(
                    branch: provider.branchC.text,
                    category: provider.categoryC.text,
                    discount: provider.discountC.text,
                    discription: provider.discriptionC.text,
                    image: provider.imageUrl,
                    imagesList: imgesListInString,
                    ingredients: provider.ingredientsC.text,
                    name: provider.nameC.text,
                    nutritionDeclaration: provider.nutritionDeclarationC.text,
                    price: provider.priceC.text,  
                  ));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainView(),));
                }
              },
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppStrings.editItem),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(Icons.add)
                  ],
                ),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const SmallTextFields(),
                  const SizedBox(
                    width: 30,
                  ),
                  const BigTextFields(),
                  const SizedBox(
                    width: 30,
                  ),
                  ImagesSection(
                    item: widget.item,
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
            ),
          )):const Center(child: CircularProgressIndicator()),
    );
  }
}
