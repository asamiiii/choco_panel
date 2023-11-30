import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/items_screen/widgets/item.dart';
import 'package:choco_panel/screens/items_screen/item_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  void initState() {
    var provider = context.read<MainProvider>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await provider.getItems();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 1300,
      padding: const EdgeInsets.all(20),
      // color:Colors.green,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetails(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                child: SizedBox(
                  width: 100,
                  height: 30,
                  child: Row(
                    children: [
                      Text(
                        AppStrings.addItem,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.add)
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Consumer<MainProvider>(
              builder: (context, provider, child) => provider.isLoading == false
                  ? GridView.builder(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Item(
                          index: index, chocoItem: DummyData.chocoList[index]),
                      itemCount: DummyData.chocoList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 10,
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
            ),
          ],
        );
      }),
    );
  }
}
