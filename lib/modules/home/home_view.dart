import 'dart:io';

import 'package:contact/models/card_info_model.dart';
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

  List<CardInfoModel> cardInfo = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Image.asset(AppImages.routeLogo,),
        leadingWidth: MediaQuery.of(context).size.width * 0.5,
      ),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:  Column(
            children: [
    Expanded(
    child: cardInfo.isEmpty
                    ? EmptyScreen()
                    : CardView(cardInfo: cardInfo, onRemove: _onRemove,),
    ),
              Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Visibility(
                      visible: cardInfo.isNotEmpty,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {

                            cardInfo.removeLast();

                          });
                        },
                        heroTag: null,
                        backgroundColor: AppColors.redColor,
                        child: Icon(EvaIcons.trash2, color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 15),
                    Visibility(
                      visible: cardInfo.length <6,
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
        builder: (context) =>ModalView(onAddContact: _addContact),);
  }
  void _addContact(CardInfoModel contactInfo) {
    setState(() {
      cardInfo.add(contactInfo);
    });
  }
  void _onRemove(int index) {
    setState(() {
      cardInfo.removeAt(index);
    });
  }
}
