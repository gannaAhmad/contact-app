import 'package:contact/hive_manager/hive_services.dart';
import 'package:contact/modules/home/widgets/card_view.dart';
import 'package:contact/modules/home/widgets/empty_screen.dart';
import 'package:contact/modules/home/widgets/modal_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../../core/constant/AppImages.dart';
import '../../core/theme/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    
  final len = HiveServices.getLen(); 

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Image.asset(
          AppImages.routeLogo,
        ),
        leadingWidth: MediaQuery.of(context).size.width * 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: len==0
                  ? EmptyScreen()
                  : CardView(),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Visibility(
                    visible: len>6,
                    child: FloatingActionButton(
                      onPressed: () {
                        setState(() {
                          HiveServices.deleteContact(
                              HiveServices.getContacts().length - 1);
                        });
                      },
                      heroTag: null,
                      backgroundColor: AppColors.redColor,
                      child: Icon(EvaIcons.trash2, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15),
                  Visibility(
                    visible: len!=0,
                    child: FloatingActionButton(
                      onPressed: () {
                        _showModalSheet();
                      },
                      heroTag: null,
                      backgroundColor: AppColors.offColor,
                      child: Icon(EvaIcons.plus, color: AppColors.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModalSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      
      backgroundColor: AppColors.primaryColor,
      builder: (context) => ModalView(),
    );
  }




}
