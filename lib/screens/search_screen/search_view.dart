import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/models/item_model.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/items_screen/widgets/item.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<ItemModel> searchedList = [];
  @override
  void initState() {
    searchedList = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHight = MediaQuery.of(context).size.height;
    return Container(
      height: double.infinity,
      width: 1300,
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        SizedBox(
          width: screenWidth * 0.30,
          child: TextFormField(
            onChanged: (value) {
              searchedList.clear();
              for (var element in DummyData.chocoList) {
                if (element.name!.toLowerCase().contains(value.toLowerCase()) &&
                        value.isNotEmpty) {
                  searchedList.add(element);
                }
                
              }
              setState(() {});
            },
            controller: searchController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: AppStrings.search,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Consumer<MainProvider>(
          builder: (context, provider, child) => provider.isLoading == false
              ? Expanded(
                  child: GridView.builder(
                    // shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        Item(index: index, chocoItem: searchedList[index]),
                    itemCount: searchedList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 6,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 10,
                    ),
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ),
      ]),
    );
  }
}
