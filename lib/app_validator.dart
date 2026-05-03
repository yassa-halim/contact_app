abstract class AppValidator {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'This field cannot be empty';
    }

    final RegExp emailRegex = RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Invalid Email Address';
    }

    return null;
  }

  static String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'This field cannot be empty';
    }

    return null;
  }

  static String? validatePhone(String? phone) {
    if (phone == null || phone.isEmpty) {
      return 'This field cannot be empty';
    }
    if (phone.length < 11) {
      return 'Invalid phone number';
    }
    return null;
  }
}
