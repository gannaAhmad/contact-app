import 'package:contact/core/constant/AppImages.dart';
import 'package:contact/models/card_info_model.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

class CardView extends StatefulWidget {
  final List<CardInfoModel> cardInfo;
  final Function onRemove;
  const CardView({super.key, required this.cardInfo, required this.onRemove});

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(top: 16,left: 8,right: 8),
        child: GridView.builder(
          itemCount: widget.cardInfo.length,
            gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              childAspectRatio: 0.6,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (context,index){
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
                borderRadius:
                    BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          child: Image.file(
                              widget.cardInfo[index].img,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 200),
                        ),
                        Positioned(
                          top: 140,
                            left: 15,
                            child: Container(
                              width: 100,
                          height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.offColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:
                          Text(widget.cardInfo[index].name,style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color:AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),)
                        ))
                      ],
                    ),
                    Expanded(
                        flex:2,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(EvaIcons.email),
                                  SizedBox(width: 20,),
                                  Text(widget.cardInfo[index].email,style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color:AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),),

                                ],
                              ),
                              Row(
                                children: [
                                  Icon(EvaIcons.phoneCall),
                                  SizedBox(width: 20,),
                                  Text(widget.cardInfo[index].phoneNum,style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                    color:AppColors.primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),),

                                ],
                              ),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    widget.onRemove(index);
                                  });
                                },
                                  child:Container(
                                width:double.infinity ,
                                height: 50,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.redColor,
                                ),
                                child:
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(EvaIcons.trash2,color: Colors.white,),
                                    SizedBox(width: 20,),
                                    Text("Delete",style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color:Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  ],
                                ) ,
                              ))
                            ],
                          ),
                        )
                    ),

                  ],
                ),
              );
            }),
      );
  }
}
