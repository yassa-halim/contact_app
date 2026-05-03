import 'package:contact_app/contact_model.dart';
import 'package:contact_app/app_colors.dart';
import 'package:flutter/material.dart';

class HomeActionButtons extends StatelessWidget {
  final VoidCallback onAddPressed;
  final VoidCallback onDeleteLastPressed;
  final List<Contact> currentContacts;

  const HomeActionButtons({
    super.key,
    required this.onAddPressed,
    required this.onDeleteLastPressed,
    required this.currentContacts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        Visibility(
          visible: currentContacts.isNotEmpty,
          child: FloatingActionButton(
            onPressed: onDeleteLastPressed,
            backgroundColor: AppColors.red,
            child: const Icon(Icons.delete_rounded, color: AppColors.gold),
          ),
        ),
        Visibility(
          visible: currentContacts.length < 6,
          child: FloatingActionButton(
            onPressed: onAddPressed,
            backgroundColor: AppColors.gold,
            child: const Icon(Icons.add_rounded, color: AppColors.darkBlue),
          ),
        ),
      ],
    );
  }
}