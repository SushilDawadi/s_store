class CustomValidators {
  // email validation
  static String? emailValidator(String? value) {
    if (value!.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    if (value.length > 50) {
      return 'Email must not be more than 50 characters';
    }
    return null;
  }

  // password validation
  static String? passwordValidator(String? value) {
    if (value!.isEmpty) {
      return 'Password is required';
    }
    //more validation for password

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    if (!RegExp(r'^(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[0-9]).{6,}$')
        .hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter and one number';
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    return null;
  }

  //phone number validation
  static String? phoneNumberValidator(String? value) {
    if (value!.isEmpty) {
      return 'Phone number is required';
    }
    if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
      return 'Please enter a valid phone number';
    }
    if (value.length > 10) {
      return 'Phone number must not be more than 10 characters';
    }
    return null;
  }
}
