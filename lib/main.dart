import 'package:contact/route/app_routes.dart';
import 'package:flutter/material.dart';

import 'modules/home/home_view.dart';

void main() {
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

