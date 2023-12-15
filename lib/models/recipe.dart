import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_sample/models/vegetable.dart';
part 'recipe.freezed.dart';
part 'recipe.g.dart';

// レベル3 料理レシピ
@freezed
class Recipe with _$Recipe {
  const factory Recipe({
    // タイトル
    required String title,
    // カロリー
    required int calories,
    // 必要な野菜たち
    required List<Vegetable> vegetables,
  }) = _Recipe;
  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}