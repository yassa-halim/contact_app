import 'dart:io';

import 'package:contact_app/app_assets.dart';
import 'package:contact_app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class BottomSheetHeader extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final ValueNotifier<File?> pickedImage;

  const BottomSheetHeader({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.phoneController,
    required this.pickedImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      children: [
        Expanded(
          flex: 35,
          child: GestureDetector(
            onTap: () async {
              final ImagePicker imagePicker = ImagePicker();
              final XFile? selectedFile = await imagePicker.pickImage(
                source: ImageSource.gallery,
              );
              if (selectedFile != null) {
                pickedImage.value = File(selectedFile.path);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gold, width: 1),
                borderRadius: BorderRadius.circular(28),
              ),
              child: ValueListenableBuilder(
                valueListenable: pickedImage,
                builder: (context, imageFile, child) {
                  if (imageFile != null) {
                    return AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.file(imageFile, fit: BoxFit.cover),
                      ),
                    );
                  } else {
                    return LottieBuilder.asset(AppAnimations.imagePicker);
                  }
                },
              ),
            ),
          ),
        ),
        Expanded(
          flex: 65,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: nameController,
                builder: (context, nameValue, child) {
                  return Text(
                    nameValue.text.isEmpty ? 'Contact Name' : nameValue.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.gold,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
              const Divider(color: AppColors.gold),
              ValueListenableBuilder(
                valueListenable: emailController,
                builder: (context, emailValue, child) => Text(
                  emailValue.text.isEmpty ? 'example@email.com' : emailValue.text,
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.gold,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Divider(color: AppColors.gold),
              ValueListenableBuilder(
                valueListenable: phoneController,
                builder: (context, phoneValue, child) {
                  return Text(
                    phoneValue.text.isEmpty ? '+200000000000' : phoneValue.text,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.gold,
                      fontWeight: FontWeight.w500,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}