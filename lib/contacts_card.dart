import 'package:contact_app/contact_model.dart';
import 'package:contact_app/app_assets.dart';
import 'package:contact_app/app_colors.dart';
import 'package:flutter/material.dart';

class ContactsCard extends StatelessWidget {
  final Contact contact;
  final VoidCallback onDeletePressed;

  const ContactsCard({
    super.key,
    required this.contact,
    required this.onDeletePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gold,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    topLeft: Radius.circular(16),
                  ),
                  child: contact.contactImage == null
                      ? Image.asset(
                    AppImages.emptyImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                      : Image.file(
                    contact.contactImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.gold,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      contact.contactName,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 4,
              children: [
                Row(
                  spacing: 8,
                  children: [
                    const Icon(Icons.email_rounded, color: AppColors.darkBlue),
                    Text(
                      contact.contactEmail,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  spacing: 8,
                  children: [
                    const Icon(Icons.phone_rounded, color: AppColors.darkBlue),
                    Text(
                      '+2${contact.contactPhone}',
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.darkBlue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: onDeletePressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.delete_rounded),
                      Text(
                        'Delete',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}