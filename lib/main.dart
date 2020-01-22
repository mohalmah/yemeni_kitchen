import 'package:flutter/material.dart';
import 'package:yemeni_kitchen/app.dart';
import 'package:yemeni_kitchen/viewmodels/recipe_viewmodel.dart';
//import 'package:yemeni_kitchen/viewmodels/recipe_viewmodel_ar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await RecipeViewModel.load();
  //await RecipeViewModelAr.load();
  runApp(new RecipeApp());
}
