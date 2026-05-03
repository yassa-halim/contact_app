import 'dart:io';

class Contact {
  final String contactName;
  final String contactEmail;
  final String contactPhone;
  final File? contactImage;

  const Contact({
    required this.contactName,
    required this.contactEmail,
    required this.contactPhone,
    this.contactImage,
  });
}