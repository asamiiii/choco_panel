import 'package:choco_panel/providers/main_provider.dart';
import 'package:provider/provider.dart';

class AppProviders{
  static List<ChangeNotifierProvider<MainProvider>> providers =
  [
    ChangeNotifierProvider(create: (_) => MainProvider()),
  ] ;
}