import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/items_screen/widgets/big_tf.dart';
import 'package:choco_panel/screens/items_screen/widgets/images_section.dart';
import 'package:choco_panel/screens/items_screen/widgets/small_text_field_section.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

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
    provider.formValid = true;
    provider.handleCategoryItemsList();
    provider.handleBranchesItemsList();
    if (widget.item != null) {
      provider.initTextFiledsWhenEdit(item: widget.item);
    } else {
      provider.initTextFiledsWhenEdit();
    }
    provider.imageUrl = null;
    provider.imagesUrl?.clear();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) => provider.isLoading == false
          ? Scaffold(
              appBar: AppBar(
                actions: [
                  widget.item != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextButton(
                              onPressed: () {
                                // showAlertDialog(BuildContext context) {

                                // set up the button
                                Widget okButton = TextButton(
                                  child: const Text("OK"),
                                  onPressed: () async {
                                    
                                    await context
                                        .read<MainProvider>()
                                        .deleteItem(itemId: widget.item?.id);
                                    await context
                                        .read<MainProvider>()
                                        .getItems();
                                        Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                );

                                Widget cancelButton = TextButton(
                                  child: const Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                );

                                // set up the AlertDialog
                                AlertDialog alert = AlertDialog(
                                  title: Text("Are you sure ?"),
                                  content: Text("This item will remove now !"),
                                  actions: [okButton, cancelButton],
                                );

                                // show the dialog
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return alert;
                                  },
                                );
                              },
                              // },
                              child: const Text(
                                'Remove',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )),
                        )
                      : const SizedBox()
                ],
                centerTitle: true,
                title: widget.item != null
                    ? Text('${AppStrings.itemId} ${widget.item?.id}')
                    : const Text('Add New Item'),
              ),
              floatingActionButton: SizedBox(
                width: 120,
                child: FloatingActionButton(
                  onPressed: () async {
                    // provider.imagesUrl?.removeWhere((element) => element==''||element==' ');
                    String? imgesListInString = provider.imagesUrl?.join(',');
                    provider.formValidation();
                    if (provider.formValid == true) {
                      Navigator.pop(context);
                      if (widget.item == null) {
                        await provider.addItem(ItemModel(
                          branch: provider.branchC.text,
                          category: provider.categoryC.text,
                          discount: provider.discountC.text,
                          discription: provider.discriptionC.text,
                          image: provider.imageUrl,
                          imagesList: imgesListInString,
                          ingredients: provider.ingredientsC.text,
                          name: provider.nameC.text,
                          nutritionDeclaration:
                              provider.nutritionDeclarationC.text,
                          price: provider.priceC.text,
                        ));
                      } else {
                        await provider.editItem(
                            itemId: widget.item?.id ?? '',
                            item: ItemModel(
                              branch: provider.branchC.text,
                              category: provider.categoryC.text,
                              discount: provider.discountC.text,
                              discription: provider.discriptionC.text,
                              image: provider.imageUrl,
                              imagesList: imgesListInString,
                              ingredients: provider.ingredientsC.text,
                              name: provider.nameC.text,
                              nutritionDeclaration:
                                  provider.nutritionDeclarationC.text,
                              price: provider.priceC.text,
                            ));
                      }

                      await provider.getItems();
                    } else {
                      Toast.show('Please Verify Your data !!', duration: 3);
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.item != null
                            ? AppStrings.editItem
                            : AppStrings.addItem),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(widget.item != null
                            ? Icons.edit_outlined
                            : Icons.add)
                      ],
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
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
                      // const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
              ))
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
