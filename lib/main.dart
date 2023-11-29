import 'package:choco_panel/core/providers_list.dart';
import 'package:choco_panel/core/strings.dart';
import 'package:choco_panel/core/theme.dart';
import 'package:choco_panel/screens/main_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const CohcoPanel());
  
}

class CohcoPanel extends StatelessWidget {
  const CohcoPanel({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AppStrings.appName,
        theme: AppTheme.normalTheme,
        home: const MainView(),
      ),
    );
  }
}
