import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});
  
  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(25)
            ),
            height: 420,
            width: 320,
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Column(
                  children: [
                    Text('Main Image',style: TextStyle(fontWeight: FontWeight.bold),),
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
                    const Text('Details Images ',style: TextStyle(fontWeight: FontWeight.bold),),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 100,
                      width: 300,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => ClipOval(
                              child: ImageNetwork(
                                  image:
                                      'https://selectitaly.com/blog/wp-content/uploads/ferrero-rocher-3992585_1920.jpg',
                                  height: 100,
                                  width: 100)), 
                                  separatorBuilder: (context, index) => SizedBox(width: 5,), itemCount: 3),
                    ),
                                
                    SizedBox(
                      height: 5,
                    ),
                    TextButton(onPressed: () {}, child: Text('Change')),
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
