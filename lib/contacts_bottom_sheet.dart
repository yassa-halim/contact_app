import 'dart:io';

import 'package:contact_app/contact_model.dart';
import 'package:contact_app/app_colors.dart';
import 'package:contact_app/app_validator.dart';
import 'package:contact_app/button_sheet_holder.dart';
import 'package:contact_app/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class ContactsBottomSheet extends StatefulWidget {
  final List<Contact> contactList;
  final VoidCallback onContactAdded;

  const ContactsBottomSheet({
    super.key,
    required this.contactList,
    required this.onContactAdded,
  });

  @override
  State<ContactsBottomSheet> createState() => _ContactsBottomSheetState();
}

class _ContactsBottomSheetState extends State<ContactsBottomSheet> {
  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();
  final ValueNotifier<File?> selectedImage = ValueNotifier(null);

  final TextEditingController nameInputController = TextEditingController();
  final TextEditingController emailInputController = TextEditingController();
  final TextEditingController phoneInputController = TextEditingController();

  @override
  void dispose() {
    nameInputController.dispose();
    emailInputController.dispose();
    phoneInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 16,
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetHeader(
            emailController: emailInputController,
            nameController: nameInputController,
            phoneController: phoneInputController,
            pickedImage: selectedImage,
          ),
          Form(
            key: contactFormKey,
            child: Column(
              spacing: 8,
              children: [
                CustomTextFormField(
                  controller: nameInputController,
                  hintText: 'Enter Contact Name ',
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  validator: (name) => AppValidator.validateName(name),
                ),
                CustomTextFormField(
                  controller: emailInputController,
                  hintText: 'Enter Contact Email ',
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (email) => AppValidator.validateEmail(email),
                ),
                CustomTextFormField(
                  controller: phoneInputController,
                  hintText: 'Enter Contact Phone ',
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.done,
                  validator: (phone) => AppValidator.validatePhone(phone),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (contactFormKey.currentState!.validate()) {
                widget.contactList.add(
                  Contact(
                    contactName: nameInputController.text,
                    contactEmail: emailInputController.text,
                    contactPhone: phoneInputController.text,
                    contactImage: selectedImage.value,
                  ),
                );
                widget.onContactAdded();
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.gold,
              foregroundColor: AppColors.darkBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size.fromHeight(56),
            ),
            child: const Text(
              'Add Contact',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
        ],
      ),
    );
  }
}