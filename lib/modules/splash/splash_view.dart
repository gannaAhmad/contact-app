import 'dart:async';

import 'package:contact/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../core/constant/AppImages.dart';
import '../../route/page_route.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, PagesRoute.home);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.routeLogo),
          ],
        ),
      )
    );
  }
}
