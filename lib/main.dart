import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_sample/models/pack.dart';
import 'package:json_sample/models/recipe.dart';
import 'package:json_sample/models/vegetable.dart';
import 'package:json_sample/utils.dart';

Future main() async {
  await test1();
  await test2();
  await test3();
  await test4();
  await test5();
  await test6();
}

Future test1() async {
  // Stub を準備
  WidgetsFlutterBinding.ensureInitialized();
  // JSON <--- Stub
  final json = await rootBundle.loadString('stub/level1.json');
  // JsonMap <--- JSON
  final map = jsonDecode(json);
  // 野菜データ <--- JsonMap
  final data = Vegetable.fromJson(map);

  logger.d('Vegetable データの中身は $data');
  logger.d(data.name);
}

Future test2() async {
  // 野菜データを作る
  const data = Vegetable(
    name: 'キャベツ',
    color: 'みどり',
    season: '春と冬',
  );
  // JsonMap <--- データ
  final map = data.toJson();
  // JSON <--- JsonMap
  final json = jsonEncode(map);

  logger.d('Vegetable JSONの中身は $json');
}

Future test3() async {
  WidgetsFlutterBinding.ensureInitialized();
  final json = await rootBundle.loadString('stub/level2.json');
  final map = jsonDecode(json);
  final data = Pack.fromJson(map);

  logger.d('Pack データの中身は $data');
  logger.d(data.content.color);
}

Future test4() async {
  const content = Vegetable(
    name: 'アボガド',
    color: '濃いみどり',
    season: '秋',
  );
  const data = Pack(
    size: '中',
    price: 800,
    content: content,
  );
  final map = data.toJson();
  final json = jsonEncode(map);

  logger.d('Pack JSONの中身は $json');
}

Future test5() async {
  WidgetsFlutterBinding.ensureInitialized();
  final json = await rootBundle.loadString('stub/level3.json');
  final map = jsonDecode(json);
  final data = Recipe.fromJson(map);

  logger.d('Recipe データの中身は $data');
}

Future test6() async {
  const vegetables = [
    Vegetable(
      name: 'しょうが',
      color: '黄色',
      season: '秋',
    ),
    Vegetable(
      name: 'かぶ',
      color: '白',
      season: '冬',
    ),
    Vegetable(
      name: 'たけのこ',
      color: '茶色',
      season: '春',
    ),
  ];
  const data = Recipe(
    title: '健康スープ',
    calories: 150,
    vegetables: vegetables,
  );
  final map = data.toJson();
  final json = jsonEncode(map);

  logger.d('Recipe JSONの中身は $json');
}
