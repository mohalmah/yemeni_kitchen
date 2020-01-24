import 'package:flutter/material.dart';
import 'package:yemeni_kitchen/pages/home_page.dart';
import 'package:yemeni_kitchen/pages/home_page_ar.dart';

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.white, accentColor: Colors.white, dialogBackgroundColor: Colors.transparent),
        home:  HomePageAr(),
      );
  }
}