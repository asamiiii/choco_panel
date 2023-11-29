import 'package:choco_panel/models/item_model.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/items_screen/widgets/big_tf.dart';
import 'package:choco_panel/screens/items_screen/widgets/images_section.dart';
import 'package:choco_panel/screens/items_screen/widgets/small_text_field_section.dart';
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
    provider.nameC = TextEditingController(
        text: widget.item != null ? widget.item?.name : '');

    provider.discriptionC = TextEditingController(
        text: widget.item != null ? widget.item?.discription : '');

    provider.priceC = TextEditingController(
        text: widget.item != null ? widget.item?.price : '');

    provider.categoryC = TextEditingController(
        text: widget.item != null ? widget.item?.category : '');

    provider.branchC = TextEditingController(
        text: widget.item != null ? widget.item?.branch : '');

    provider.discountC = TextEditingController(
        text: widget.item != null ? widget.item?.discount : '');

    provider.ingredientsC = TextEditingController(
        text: widget.item != null ? widget.item?.ingredients : '');

    provider.nutritionDeclarationC = TextEditingController(
        text: widget.item != null ? widget.item?.nutritionDeclaration : '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:  Text('Item Id # ${widget.item?.id}'),
          ),
          floatingActionButton: SizedBox(
            width: 120,
            child: FloatingActionButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Edit Item'),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(Icons.add)
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
                  BigTextFields(),
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
          )),
    );
  }
}
