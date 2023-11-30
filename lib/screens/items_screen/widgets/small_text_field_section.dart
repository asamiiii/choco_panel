import 'package:choco_panel/core/strings.dart';
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
                        isValid: provider.formValid,
                        label: AppStrings.name,
                        controller: provider.nameC,
                        hintText: AppStrings.name,
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
                        label: AppStrings.price,
                        controller: provider.priceC,
                        hintText: AppStrings.price,
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
                        isValid: provider.formValid,
                        label: AppStrings.categories,
                        controller: provider.categoryC,
                        hintText: AppStrings.categories,
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
                        isValid: provider.formValid,
                        label: AppStrings.branches,
                        controller: provider.branchC,
                        hintText: AppStrings.branches,
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
                        label: AppStrings.discount,
                        controller: provider.discountC,
                        hintText: AppStrings.discount,
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
                        isValid: provider.formValid,
                        label:AppStrings.discription ,
                        controller: provider.discriptionC,
                        hintText: AppStrings.discription,
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