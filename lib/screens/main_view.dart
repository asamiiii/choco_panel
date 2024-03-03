import 'package:choco_panel/core/images_path.dart';
import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/core/theme.dart';
import 'package:choco_panel/providers/main_provider.dart';
import 'package:choco_panel/screens/announcment_screen/announcement_screen.dart';
import 'package:choco_panel/screens/items_screen/items_screen.dart';
import 'package:choco_panel/screens/search_screen/search_view.dart';
import 'package:choco_panel/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidebarx/sidebarx.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainProvider>(
        builder: (context, provider, child) =>  SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SidebarX(
               headerBuilder: (context, extended) {
            return SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(AppImagesPath.avatar),
              ),
            );
          },
                extendedTheme: AppTheme.sideTheme,
                controller: SidebarXController(selectedIndex: provider.selectedIndex??0,extended: true),
                items:  [
                  SidebarXItem(icon: Icons.align_horizontal_left, label:AppStrings.items ,onTap: () {
                    provider.setSiderIndex(index: 0);
                  },),
                  SidebarXItem(icon: Icons.announcement, label:AppStrings.announcement ,onTap: () {
                    provider.setSiderIndex(index: 1);
                  },),

                  SidebarXItem(icon: Icons.search, label:AppStrings.search ,onTap: () {
                    provider.setSiderIndex(index: 2);
                  },),
                ],
              ),
              selectedScreenIndex(provider.selectedIndex)
              // Your app screen body
            ],
          ),
        ),
      ),
    );
  }
}

Widget selectedScreenIndex(int? index){
  switch(index){
    case 0:
    return const ItemsScreen();
    case 1:
    return const AnnouncementScreen();
    case 2:
    return  SearchScreen();
    default:
    return const ItemsScreen(); 
  }
  
}