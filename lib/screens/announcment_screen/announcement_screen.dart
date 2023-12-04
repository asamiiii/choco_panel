import 'package:choco_panel/core/colors.dart';
import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/data_source/dummy_data/dummy.dart';
import 'package:choco_panel/models/announ_model.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/shared/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  @override
  void initState() {
    var provider = context.read<MainProvider>();
    provider.handleCategoryItemsList();
    provider.handleBranchesItemsList();
    provider.announcmentList.clear();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await provider.getAnnouncment();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var slecteBranchStrings = [];
    return Consumer<MainProvider>(
      builder: (context, provider, child) => provider.isLoading == false
          ? Container(
              height: double.infinity,
              width: 1300,
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: LayoutBuilder(
                  builder: (context, constraints) => SingleChildScrollView(
                        child: Column(
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
                                            height: 200,
                                            child: Column(
                                              children: [
                                                AppTextField(
                                                    controller: announC,
                                                    keyboardType:
                                                        TextInputType.text,
                                                    icon: const Icon(Icons.abc),
                                                    hintText: AppStrings
                                                        .addAnnouncement,
                                                    label: AppStrings
                                                        .announcement),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: AppTextField(
                                                          controller: branchC,
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          icon: const Icon(Icons
                                                              .location_off_rounded),
                                                          hintText: AppStrings
                                                              .addBranches,
                                                          label: AppStrings
                                                              .branches),
                                                    ),
                                                    DropdownMenu<String>(
                                                      requestFocusOnTap: true,
                                                      label:
                                                          const Text('Branch'),
                                                      onSelected: (branch) {
                                                        slecteBranchStrings =branchC.text
                                                                .split(',');
                                                        if (slecteBranchStrings
                                                                .contains(
                                                                    branch) ==
                                                            false) {
                                                          slecteBranchStrings
                                                              .add(branch
                                                                      ?.trim() ??
                                                                  '');
                                                          var concatenatedString =
                                                              slecteBranchStrings
                                                                  .where((element) =>
                                                                      element
                                                                          .isNotEmpty)
                                                                  .join(',');
                                                          // provider.categoryC.text = concatenatedString ;
                                                          branchC.text =
                                                                      concatenatedString;
                                                        }
                                                        setState(() {});
                                                      },
                                                      dropdownMenuEntries:
                                                          provider.branches.map<
                                                                  DropdownMenuEntry<
                                                                      String>>(
                                                              (branch) {
                                                        return DropdownMenuEntry<
                                                            String>(
                                                          value: branch,
                                                          label: branch,
                                                          // enabled: color.label != 'Grey',
                                                          style: MenuItemButton
                                                              .styleFrom(
                                                                  // foregroundColor: color.color,
                                                                  ),
                                                        );
                                                      }).toList(),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: [
                                            TextButton(
                                              child: Text(AppStrings.add),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                                await provider.addAnnouncement(
                                                    Announcment(
                                                        branch: branchC.text,
                                                        txt: announC.text));
                                                await provider.getAnnouncment();
                                              },
                                            ),
                                            TextButton(
                                              child: Text(AppStrings.cancel),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                          title: Text(
                                              AppStrings.addNewAnnouncment),
                                        ),
                                      );
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.amber)),
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
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: InkWell(
                                      onTap: () {
                                        TextEditingController announC =
                                            TextEditingController(
                                                text: DummyData
                                                    .announcments[index].txt);
                                        TextEditingController branchC =
                                            TextEditingController(
                                                text: DummyData
                                                    .announcments[index]
                                                    .branch);
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
                                                      keyboardType:
                                                          TextInputType.text,
                                                      icon:
                                                          const Icon(Icons.abc),
                                                      hintText: AppStrings
                                                          .addAnnouncement,
                                                      label: AppStrings
                                                          .addAnnouncement),
                                                  const SizedBox(
                                                    height: 20,
                                                  ),
                                                  AppTextField(
                                                      controller: branchC,
                                                      keyboardType:
                                                          TextInputType.text,
                                                      icon: const Icon(Icons
                                                          .location_off_rounded),
                                                      hintText: AppStrings
                                                          .addBranches,
                                                      label:
                                                          AppStrings.branches),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                child: Text(AppStrings.edit),
                                                onPressed: () async {
                                                  //! Edit function here
                                                  Navigator.pop(context);
                                                  await provider
                                                      .editAnnouncment(
                                                          announ: Announcment(
                                                              branch:
                                                                  branchC.text,
                                                              txt:
                                                                  announC.text),
                                                          announId: DummyData
                                                                  .announcments[
                                                                      index]
                                                                  .id ??
                                                              '');
                                                  await provider
                                                      .getAnnouncment();
                                                },
                                              ),
                                              TextButton(
                                                child: Text(AppStrings.cancel),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                            ],
                                            title: Text(
                                                AppStrings.editAnnouncement),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            '${DummyData.announcments[index].txt}',
                                            style:
                                                const TextStyle(fontSize: 20),
                                          )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                              child: Text(
                                            '${DummyData.announcments[index].branch}',
                                            style:
                                                const TextStyle(fontSize: 20),
                                          )),
                                          TextButton(
                                              onPressed: () {
                                                Widget okButton = TextButton(
                                                  child: const Text("OK"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                    context
                                                        .read<MainProvider>()
                                                        .deleteAnnouncment(
                                                            announId: DummyData
                                                                .announcments[
                                                                    index]
                                                                .id);
                                                    context
                                                        .read<MainProvider>()
                                                        .getAnnouncment();
                                                  },
                                                );

                                                Widget cancelButton =
                                                    TextButton(
                                                  child: const Text("Cancel"),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                );

                                                // set up the AlertDialog
                                                AlertDialog alert = AlertDialog(
                                                  title: Text("Are you sure ?"),
                                                  content: Text(
                                                      "This Announ will remove now !"),
                                                  actions: [
                                                    okButton,
                                                    cancelButton
                                                  ],
                                                );

                                                // show the dialog
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return alert;
                                                  },
                                                );
                                              },
                                              child: const Text(
                                                'Remove',
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                      height: 3,
                                    ),
                                itemCount: DummyData.announcments.length)
                          ],
                        ),
                      )),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
