import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/screens/items_screen/item.dart';
import 'package:flutter/material.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 700,
      width: 1000,
      color: Colors.green,
      child: GridView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => Item(
          index: index,
            chocoItem: DummyData
                .chocoList[index]),
        itemCount:
            DummyData.chocoList.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
        ),
      )
    );
  }
}