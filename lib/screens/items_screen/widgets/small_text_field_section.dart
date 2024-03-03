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
  List<String> slecteCatStrings = [];
  List<String> slecteBranchStrings = [];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (context, provider, child) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(12),
              
          width: 550,
          height: 650,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                // height: 50,
                width: 350,
                child: AppTextField(
                  isValid: provider.nameValid,
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
                // height: 80,
                width: 350,
                child: AppTextField(
                  isValid: provider.discriptionValid,
                  label: AppStrings.discription,
                  controller: provider.discriptionC,
                  hintText: AppStrings.discription,
                  keyboardType: TextInputType.text,
                  icon: const Icon(Icons.details_outlined),
                  maxLines: 3,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      // height: 100,
                      width: 350,
                      child: AppTextField(
                        isValid: provider.categoryValid,
                        label: AppStrings.categories,
                        controller: provider.categoryC,
                        hintText: AppStrings.categories,
                        keyboardType: TextInputType.text,
                        icon: const Icon(Icons.category),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: DropdownMenu<String>(
                        width: 160,
                        requestFocusOnTap: true,
                        label: Text(AppStrings.categories),
                        onSelected: (cat) {
                          slecteCatStrings = provider.categoryC.text.split(',');
                    
                          // Check if the selected category is already in the list
                          if (!slecteCatStrings.contains(cat)) {
                            // Remove any leading or trailing whitespace from the selected category
                            cat = cat?.trim();
                    
                            // Add the selected category to the list
                            slecteCatStrings.add(cat!);
                    
                            // Join the categories with commas, excluding any empty strings
                            var concatenatedString =
                                slecteCatStrings.where((c) => c.isNotEmpty).join(',');
                    
                            provider.categoryC =
                                TextEditingController(text: concatenatedString);
                          }
                    
                          setState(() {});
                        },
                        dropdownMenuEntries: provider.categoryList!
                            .map<DropdownMenuEntry<String>>((cat) {
                          return DropdownMenuEntry<String>(
                            value: cat,
                            label: cat,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(
                      // height: 100,
                      width: 350,
                      child: AppTextField(
                        isValid: provider.branchValid,
                        label: AppStrings.branches,
                        controller: provider.branchC,
                        hintText: AppStrings.branches,
                        keyboardType: TextInputType.text,
                        icon: const Icon(Icons.location_on_sharp),
                        maxLines: 1,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: DropdownMenu<String>(
                        width: 160,
                        requestFocusOnTap: true,
                        label: Text(AppStrings.branches),
                        onSelected: (branch) {
                          slecteBranchStrings = provider.branchC.text.split(',');
                          if (slecteBranchStrings.contains(branch) == false) {
                            slecteBranchStrings.add(branch?.trim() ?? '');
                            var concatenatedString = slecteBranchStrings.where((element) => element.isNotEmpty).join(',');
                            // provider.categoryC.text = concatenatedString ;
                            provider.branchC.text=concatenatedString;
                          }
                          setState(() {});
                        },
                        dropdownMenuEntries: provider.branches
                            .map<DropdownMenuEntry<String>>((branch) {
                          return DropdownMenuEntry<String>(
                            value: branch,
                            label: branch,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: SizedBox()),
              Text('Not Required',style: TextStyle(color: Colors.grey),),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
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
            ],
          ),
        ),
      ),
    );
  }
}
