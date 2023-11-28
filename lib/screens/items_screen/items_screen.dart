import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/screens/items_screen/item.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 1300,
      padding: const EdgeInsets.all(20),
      // color:Colors.green,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) => Item(
            index: index,
              chocoItem: DummyData
                  .chocoList[index]),
          itemCount:
              DummyData.chocoList.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
            crossAxisSpacing: 10,
          ),
        );}
      ),
    );
  }
}