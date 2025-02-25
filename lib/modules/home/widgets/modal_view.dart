import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

import '../../../core/constant/AppImages.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/card_info_model.dart';

class ModalView extends StatefulWidget {
  final Function onAddContact;

  const ModalView({super.key, required this.onAddContact});

  @override
  State<ModalView> createState() => _ModalViewState();
}

class _ModalViewState extends State<ModalView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  RegExp nameRegex = RegExp(r"^[a-zA-Z\s]{3,}$");
  RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  RegExp phoneRegExp = RegExp(r"^01[0-2,5]{1}[0-9]{8}$");
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child:
      Container(
        margin: EdgeInsets.all(16.0),
        child: Wrap(
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap:(){
                            _onPickImage();
                          },
                          child: Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(color: AppColors.offColor) ,
                                image: selectedImage != null
                                    ? DecorationImage(
                                  image: FileImage(selectedImage!),
                                  fit: BoxFit.cover,
                                ):null

                            ),
                            child: selectedImage ==null?Lottie.asset(AppImages.imgIcn):null,
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nameController.text,style:Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColors.offColor)),
                                Divider(color: AppColors.offColor,thickness: 1,),
                                Text(emailController.text,style:Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColors.offColor)),
                                Divider(color: AppColors.offColor,thickness: 1,),
                                Text(phoneController.text,style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: AppColors.offColor),),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter User Name',
                        hintStyle: TextStyle(color: AppColors.aquaColor),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.offColor, width: 1), // Border when focused
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.redColor, width: 1), // Border when error
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.offColor),
                      cursorColor: AppColors.offColor,
                      keyboardType: TextInputType.name,
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Name is required';
                        }else if (!nameRegex.hasMatch(value)) {
                          return 'Invalid name';
                        }
                        return null;

                      },

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        hintText: 'Enter User Email',
                        hintStyle: TextStyle(color: AppColors.aquaColor),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.offColor, width: 1), // Border when focused
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.redColor, width: 1), // Border when error
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.offColor),
                      cursorColor: AppColors.offColor,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Email is required';
                        }else if (!emailRegExp.hasMatch(value)) {
                          return 'Invalid Email Format';
                        }
                        return null;

                      },

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    TextFormField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        hintText: 'Enter User Phone Number',
                        hintStyle: TextStyle(color: AppColors.aquaColor),

                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.offColor, width: 1), // Border when focused
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: AppColors.redColor, width: 1), // Border when error
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.offColor),
                      cursorColor: AppColors.offColor,
                      keyboardType: TextInputType.phone,
                      validator: (value){
                        if (value!.isEmpty) {
                          return 'Phone Number is required';
                        }else if (!phoneRegExp.hasMatch(value)) {
                          return 'Invalid Phone Number Format';
                        }
                        return null;


                      },

                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                )),
            InkWell(
                onTap:(){
                  if(formKey.currentState!.validate()) {
                    // todo add contact info
                    final newContact = CardInfoModel(
                      name: nameController.text,
                      email: emailController.text,
                      phoneNum: phoneController.text,
                      img: selectedImage!,
                    );

                    widget.onAddContact(newContact);
                    Navigator.pop(context);
                  }
                },
                child:Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    color: AppColors.offColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:Center(
                    child: Text("Add Contact",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                          color: AppColors.primaryColor,
                        )),
                  ),

                )
            )

          ],
        ),
      ),
    );
  }
  void _onPickImage() async {
    ImagePicker imgPicker = ImagePicker();
    var image = await imgPicker.pickImage(source: ImageSource.gallery);
    selectedImage = File(image!.path);
    setState(() {

    });
  }

}


