import 'package:choco_panel/models/item_model.dart';
import 'package:choco_panel/screens/shared/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ItemDetails extends StatefulWidget {
  ItemModel? item; 
  ItemDetails({super.key,this.item});

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  bool? editItem;

  TextEditingController nameC = TextEditingController();

  TextEditingController discriptionC = TextEditingController();

  TextEditingController priceC = TextEditingController();

  TextEditingController categoryC = TextEditingController();

  TextEditingController branchC = TextEditingController();

  TextEditingController discountC = TextEditingController();

  TextEditingController ingredientsC = TextEditingController();

  TextEditingController nutritionDeclarationC = TextEditingController();

  @override
  void initState() {
       nameC = TextEditingController(text: widget.item!=null?widget.item?.name:'');

   discriptionC = TextEditingController(text: widget.item!=null?widget.item?.discription:'');

   priceC = TextEditingController(text: widget.item!=null?widget.item?.price:'');

   categoryC = TextEditingController(text: widget.item!=null?widget.item?.category:'');

   branchC = TextEditingController(text: widget.item!=null?widget.item?.branch:'');

   discountC = TextEditingController(text: widget.item!=null?widget.item?.discount:'');

   ingredientsC = TextEditingController(text: widget.item!=null?widget.item?.ingredients:'');

   nutritionDeclarationC = TextEditingController(text: widget.item!=null?widget.item?.nutritionDeclaration:'');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Item Id # 125wd5f5ds54'),
      ),
      floatingActionButton: SizedBox(
        width: 120,
        child: FloatingActionButton(
          onPressed: () {
            
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Edit Item'),
                SizedBox(width: 5,),
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
            Expanded(
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
                                  child: ImageNetwork(
                                      image:
                                          'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
                                      height: 150,
                                      width: 150)),
                              TextButton(onPressed: () {}, child: Text('Change')),
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
                                child: ListView.separated(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => ClipOval(
                                        child: ImageNetwork(
                                            image:
                                                'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
                                            height: 100,
                                            width: 100)),
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          width: 5,
                                        ),
                                    itemCount: 3),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              TextButton(
                                  onPressed: () {}, child: const Text('Change')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    // height: 50,
                    width: 350,
                    child: AppTextField(
                      label: 'Name',
                      controller: nameC,
                      hintText: 'Item Name',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.abc),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // height: 50,
                    width: 350,
                    child: AppTextField(
                      label: 'Price',
                      controller: priceC,
                      hintText: 'Price',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.monetization_on),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // height: 50,
                    width: 350,
                    child: AppTextField(
                      label: 'Categories',
                      controller: categoryC,
                      hintText: 'Categories',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.category),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // height: 50,
                    width: 350,
                    child: AppTextField(
                      label: 'Branches',
                      controller: branchC,
                      hintText: 'Branches',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.location_on_sharp),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // height: 50,
                    width: 350,
                    child: AppTextField(
                      label: 'Discount',
                      controller: discountC,
                      hintText: 'Discount',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.discount_outlined),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // height: 80,
                    width: 350,
                    child: AppTextField(
                      label:'Discription' ,
                      controller: discriptionC,
                      hintText: 'Discription',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.details_outlined),
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                children: [
                  
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // height: 150,
                    width: 350,
                    child: AppTextField(
                      label: 'Ingredients',
                      controller: ingredientsC,
                      hintText: 'Ingredients',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.details_outlined),
                      maxLines: 10,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    // height: 150,
                    width: 350,
                    child: AppTextField(
                      label:'Nutrition Declaration' ,
                      controller: nutritionDeclarationC,
                      hintText: 'Nutrition Declaration',
                      keyboardType: TextInputType.text,
                      icon: const Icon(Icons.numbers_outlined),
                      maxLines: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox())
          ],
        ),
      ),
    ));
  }
}
