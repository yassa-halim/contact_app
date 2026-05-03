import 'package:contact_app/contact_model.dart';
import 'package:contact_app/app_assets.dart';
import 'package:contact_app/app_colors.dart';
import 'package:contact_app/contacts_bottom_sheet.dart';
import 'package:contact_app/contacts_card.dart';
import 'package:contact_app/empty_list_widget.dart';
import 'package:contact_app/home_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> contactList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
        title: SvgPicture.asset(AppImages.logo),
      ),
      body: contactList.isEmpty
          ? const EmptyListWidget()
          : GridView.builder(
        itemCount: contactList.length,
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: .65,
        ),
        itemBuilder: (context, index) {
          return ContactsCard(
            contact: contactList[index],
            onDeletePressed: () => _deleteContact(index),
          );
        },
      ),
      floatingActionButton: HomeActionButtons(
        currentContacts: contactList,
        onAddPressed: _showAddContactBottomSheet,
        onDeleteLastPressed: _deleteLastContact,
      ),
    );
  }

  void _deleteContact(int index) {
    contactList.removeAt(index);
    setState(() {});
  }

  void _deleteLastContact() {
    if (contactList.isNotEmpty) {
      contactList.removeLast();
      setState(() {});
    }
  }

  void _showAddContactBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.darkBlue,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: ContactsBottomSheet(
            contactList: contactList,
            onContactAdded: () {
              setState(() {});
            },
          ),
        );
      },
    );
  }
}