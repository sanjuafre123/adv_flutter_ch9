import 'package:flutter/material.dart';

import '../../../helper/helper.dart';
import '../model/home_model.dart';

class HomeProvider extends ChangeNotifier {
  RecipeHelper recipeHelper = RecipeHelper();
  RecipeModal? recipeModal;

  Future<RecipeModal?> fromApi() async {
    final data = await recipeHelper.fetchDataFromApi();
    recipeModal = RecipeModal.fromJson(data);
    return recipeModal;
  }
}
