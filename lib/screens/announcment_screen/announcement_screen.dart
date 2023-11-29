import 'package:choco_panel/core/colors.dart';
import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/screens/items_screen/item_details.dart';
import 'package:choco_panel/screens/shared/shared_widget.dart';
import 'package:flutter/material.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    // var screenHight = MediaQuery.of(context).size.height;
    // var screenWidth = MediaQuery.of(context).size.width*0.90;
    return Container(
      height: double.infinity,
      width: 1300,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: LayoutBuilder(
          builder: (context, constraints) => Column(
                children: [
                  // const Text('SettingsScreen'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: () {
                TextEditingController announC=TextEditingController();
                              TextEditingController branchC=TextEditingController();
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    width: 500,
                                    height: 130,
                                    child: Column(
                                      children: [
                                        AppTextField(controller: announC, keyboardType: TextInputType.text, icon: Icon(Icons.abc), hintText: 'Add Announ', label: 'Announcment'),
                                        SizedBox(height: 20,),
                                      AppTextField(controller: branchC, keyboardType: TextInputType.text, icon: Icon(Icons.location_off_rounded), hintText: 'Add Branch', label: 'Branch'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Edit'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: const Text('Add New Announcment'),
                                ),
                              );
              }, 
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.amber)
              ),
              child: const SizedBox(
                width: 150,
                height: 30,
                child: Row(
                  children: [Text('Add Announcment',style: TextStyle(fontWeight: FontWeight.bold),),Icon(Icons.add)],
                ),
              )),
                    ],
                  ),
                  const Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Announcment',
                        style: TextStyle(fontSize: 40),
                      )),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                        'Branch',
                        style: TextStyle(fontSize: 40),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          color: index.isEven ? AppColors.golden : Colors.amber,
                          padding: const EdgeInsets.all(5),
                          height: 50,
                          child: InkWell(
                            onTap: () {
                              TextEditingController announC=TextEditingController(text: DummyData.announcments[index].txt);
                              TextEditingController branchC=TextEditingController(text: DummyData.announcments[index].branch);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    width: 500,
                                    height: 130,
                                    child: Column(
                                      children: [
                                        AppTextField(controller: announC, keyboardType: TextInputType.text, icon: Icon(Icons.abc), hintText: 'Add Announ', label: 'Announcment'),
                                        SizedBox(height: 20,),
                                      AppTextField(controller: branchC, keyboardType: TextInputType.text, icon: Icon(Icons.location_off_rounded), hintText: 'Add Branch', label: 'Branch'),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: const Text('Edit'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text('Cancel'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: const Text('Edit Announcment'),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  '${DummyData.announcments[index].txt}',
                                  style: const TextStyle(fontSize: 20),
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Text(
                                  '${DummyData.announcments[index].branch}',
                                  style: const TextStyle(fontSize: 20),
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 20,
                          ),
                      itemCount: DummyData.announcments.length)
                ],
              )),
    );
  }
}
