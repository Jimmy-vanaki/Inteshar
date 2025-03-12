import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inteshar/app/config/constants.dart';
import 'package:inteshar/app/features/home/data/models/home_model.dart';

class FavorityController extends GetxController {
  final String key = "favorite_items";
  var favoriteItems = <CardCategory>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadFavorites();
  }

  void loadFavorites() {
    List<dynamic>? storedList = Constants.localStorage.read<List>(key);

    if (storedList != null) {
      try {
        favoriteItems.assignAll(
          storedList
              .map((e) => CardCategory.fromJson(e as Map<String, dynamic>))
              .toList(),
        );
      } catch (e) {
        print("Error loading favorites: $e");
      }
    }
  }

  void toggleFavorite(CardCategory item, {BuildContext? context}) {
    bool wasFavorite = favoriteItems.any((element) => element.id == item.id);

    if (wasFavorite) {
      favoriteItems.removeWhere((element) => element.id == item.id);
    } else {
      favoriteItems.add(item);
    }

    saveFavorites();

    // اگر آیتم حذف شد و `context` مقدار داشت، مودال را ببندیم
    if (wasFavorite && context != null) {
      Navigator.pop(context);
    }
  }

  void saveFavorites() {
    List<Map<String, dynamic>> jsonList =
        favoriteItems.map((e) => e.toJson()).toList();
    Constants.localStorage.write(key, jsonList);
  }

  bool isFavorite(int itemId) {
    return favoriteItems.any((element) => element.id == itemId);
  }
}
