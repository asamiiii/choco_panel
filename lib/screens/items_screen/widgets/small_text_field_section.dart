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
      builder: (context, provider, child) => SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              // height: 80,
              width: 350,
              child: AppTextField(
                isValid: provider.formValid,
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
            Row(
              children: [
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
                  width: 15,
                ),
                DropdownMenu<String>(
                  requestFocusOnTap: true,
                  label: const Text('Cat'),
                  onSelected: (cat) {
                    slecteCatStrings = provider.categoryC.text.split(',');
                    if (slecteCatStrings.contains(cat) == false) {
                      slecteCatStrings.add(cat ?? '');
                      var concatenatedString = slecteCatStrings.join(', ');
                      // provider.categoryC.text = concatenatedString ;
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
                      // enabled: color.label != 'Grey',
                      style: MenuItemButton.styleFrom(
                          // foregroundColor: color.color,
                          ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
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
                SizedBox(width: 15,),
                Expanded(
                  child: DropdownMenu<String>(
                    requestFocusOnTap: true,
                    label: const Text('Branch'),
                    onSelected: (branch) {
                      slecteBranchStrings = provider.branchC.text.split(',');
                      if (slecteBranchStrings.contains(branch) == false) {
                        slecteBranchStrings.add(branch ?? '');
                        var concatenatedString = slecteBranchStrings.join(', ');
                        // provider.categoryC.text = concatenatedString ;
                        provider.branchC =
                            TextEditingController(text: concatenatedString);
                      }
                      setState(() {});
                    },
                    dropdownMenuEntries: provider.branches
                        .map<DropdownMenuEntry<String>>((branch) {
                      return DropdownMenuEntry<String>(
                        value: branch,
                        label: branch,
                        // enabled: color.label != 'Grey',
                        style: MenuItemButton.styleFrom(
                            // foregroundColor: color.color,
                            ),
                      );
                    }).toList(),
                  ),
                ),
              ],
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
          ],
        ),
      ),
    );
  }
}
