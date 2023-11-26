import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

class AppTheme{
  static var normalTheme =ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      );

      static SidebarXTheme sideTheme= const SidebarXTheme(
         width: 150,
         padding: EdgeInsets.all(8),
        //  hoverColor: AppColors.golden,
         decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),topRight: Radius.circular(25)),
          ),
         itemPadding: EdgeInsets.all(8),
        
      );
}