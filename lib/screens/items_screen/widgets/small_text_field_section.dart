import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/shared/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SmallTextFields extends StatefulWidget {
  const SmallTextFields({Key? key}) : super(key: key);

  @override
  State<SmallTextFields> createState() => _SmallTextFieldState();
}

class _SmallTextFieldState extends State<SmallTextFields> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) => Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      // height: 50,
                      width: 350,
                      child: AppTextField(
                        label: 'Name',
                        controller: provider.nameC,
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
                        controller: provider.priceC,
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
                        controller: provider.categoryC,
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
                        controller: provider.branchC,
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
                        controller: provider.discountC,
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
                        controller: provider.discriptionC,
                        hintText: 'Discription',
                        keyboardType: TextInputType.text,
                        icon: const Icon(Icons.details_outlined),
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
    );
  }
}