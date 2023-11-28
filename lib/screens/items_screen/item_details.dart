import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            color: Colors.greenAccent,
            height: 350,
            width: 350,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Main Image'),
                    SizedBox(height: 10),
                    ClipOval(
                        child: ImageNetwork(
                            image:
                                'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
                            height: 150,
                            width: 150)),
                    TextButton(onPressed: () {}, child: Text('Change')),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Details Images '),
                    Row(
                      children: [
                        ClipOval(
                            child: ImageNetwork(
                                image:
                                    'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
                                height: 50,
                                width: 50)),
                        ClipOval(
                            child: ImageNetwork(
                                image:
                                    'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
                                height: 50,
                                width: 50)),
                        ClipOval(
                            child: ImageNetwork(
                                image:
                                    'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
                                height: 50,
                                width: 50))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
