import 'dart:io';

import 'package:contact/hive_manager/hive_services.dart';
import 'package:contact/models/card_info_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CardView extends StatefulWidget {
  const CardView({
    super.key,
  });

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 8, right: 8),
      child: GridView.builder(
          itemCount: HiveServices.getContacts().length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            childAspectRatio: 0.6,
            mainAxisSpacing: 15,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.offColor,
              ),
              child: Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.file(
                            File(HiveServices.getContact(index)!.img),
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: size.height * 0.24),
                      ),
                      Positioned(
                          top: size.height * 0.17,
                          left: size.width * .04,
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: 20, right: 20, top: 8, bottom: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColors.offColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                HiveServices.getContact(index)!.name,
                                style: textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )))
                    ],
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(EvaIcons.email),
                                SizedBox(
                                  width: size.width * .035,
                                ),
                                Text(
                                  HiveServices.getContact(index)!.email,
                                  style:textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(EvaIcons.phoneCall),
                                SizedBox(
                                  width: size.width * .035,
                                ),
                                Text(
                                  HiveServices.getContact(index)!.phoneNum,
                                  style: textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    HiveServices.deleteContact(index);
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(top: 8, bottom: 8),

                                  // margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.redColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        EvaIcons.trash2,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: size.width * .035,
                                      ),
                                      Text(
                                        "Delete",
                                        style:textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w800,
                                            ),
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      )),
                ],
              ),
            );
          }),
    );
  }
}
