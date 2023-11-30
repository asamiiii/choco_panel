import 'package:choco_panel/core/colors.dart';
import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/screens/items_screen/item_details.dart';
import 'package:choco_panel/screens/shared/shared_widget.dart';
import 'package:flutter/material.dart';

class AnnouncementScreen extends StatelessWidget {
  const AnnouncementScreen({super.key});

  get itemCount => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 1300,
      padding: const EdgeInsets.all(20),
      color: Colors.white,
      child: LayoutBuilder(
          builder: (context, constraints) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            TextEditingController announC =
                                TextEditingController();
                            TextEditingController branchC =
                                TextEditingController();
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                content: SizedBox(
                                  width: 500,
                                  height: 130,
                                  child: Column(
                                    children: [
                                      AppTextField(
                                          controller: announC,
                                          keyboardType: TextInputType.text,
                                          icon: const Icon(Icons.abc),
                                          hintText: AppStrings.addAnnouncement,
                                          label: AppStrings.announcement),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      AppTextField(
                                          controller: branchC,
                                          keyboardType: TextInputType.text,
                                          icon: const Icon(
                                              Icons.location_off_rounded),
                                          hintText: AppStrings.addBranches,
                                          label: AppStrings.branches),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(AppStrings.edit),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(AppStrings.cancel),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                                title: Text(AppStrings.addNewAnnouncment),
                              ),
                            );
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.amber)),
                          child: SizedBox(
                            width: 150,
                            height: 30,
                            child: Row(
                              children: [
                                Text(
                                  AppStrings.addAnnouncement,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const Icon(Icons.add)
                              ],
                            ),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        AppStrings.announcement,
                        style: const TextStyle(fontSize: 40),
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Text(
                        AppStrings.branches,
                        style: const TextStyle(fontSize: 40),
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
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 20),
                          height: 50,
                          decoration: BoxDecoration(
                              color: index.isEven
                                  ? AppColors.golden
                                  : Colors.amber,
                              borderRadius: BorderRadius.circular(15)),
                          child: InkWell(
                            onTap: () {
                              TextEditingController announC =
                                  TextEditingController(
                                      text: DummyData.announcments[index].txt);
                              TextEditingController branchC =
                                  TextEditingController(
                                      text:
                                          DummyData.announcments[index].branch);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: SizedBox(
                                    width: 500,
                                    height: 130,
                                    child: Column(
                                      children: [
                                        AppTextField(
                                            controller: announC,
                                            keyboardType: TextInputType.text,
                                            icon: const Icon(Icons.abc),
                                            hintText:
                                                AppStrings.addAnnouncement,
                                            label: AppStrings.addAnnouncement),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        AppTextField(
                                            controller: branchC,
                                            keyboardType: TextInputType.text,
                                            icon: const Icon(
                                                Icons.location_off_rounded),
                                            hintText: AppStrings.addBranches,
                                            label: AppStrings.branches),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(AppStrings.edit),
                                      onPressed: () {
                                        //! Edit function here
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: Text(AppStrings.cancel),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                  title: Text(AppStrings.editAnnouncement),
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
                            height: 3,
                          ),
                      itemCount: DummyData.announcments.length)
                ],
              )),
    );
  }
}
