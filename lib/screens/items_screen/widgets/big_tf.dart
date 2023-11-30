import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/shared/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BigTextFields extends StatelessWidget {
  const BigTextFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) =>Expanded(
                  child: Column(
                    children: [
                      
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        // height: 150,
                        width: 350,
                        child: AppTextField(
                          isValid: provider.formValid,
                          label: AppStrings.ingredients,
                          controller: provider.ingredientsC,
                          hintText:AppStrings.ingredients,
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
                          isValid: provider.formValid,
                          label:AppStrings.nutritionDeclaration ,
                          controller: provider.nutritionDeclarationC,
                          hintText: AppStrings.nutritionDeclaration,
                          keyboardType: TextInputType.text,
                          icon: const Icon(Icons.numbers_outlined),
                          maxLines: 10,
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }
}