import 'package:contact/hive_manager/box_constants.dart';
import 'package:contact/route/app_routes.dart';
import 'package:contact/test_hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'models/card_info_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // ✅ Register adapter first
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(CardInfoModelAdapter());
  }
  if (await Hive.boxExists(cardHiveBox)) {
    await Hive.deleteBoxFromDisk(cardHiveBox);
  }
  // ✅ Then open the box
  if (!Hive.isBoxOpen(cardHiveBox)) {
    await Hive.openBox<CardInfoModel>(cardHiveBox);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRoutes.GeneratedRoute,
    );
  }
}
