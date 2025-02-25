import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/AppImages.dart';
import '../../../core/theme/app_colors.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(AppImages.emptyIcn),
            Lottie.asset(AppImages.emptyIcn),
            Text("There is No Contacts Added Here",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.offColor)),
          ],
        ));
  }

}
