class Validator {
  static String? validateMobile(String value) {
    const pattern = r'(?:\+977[- ])?\d{2}-?\d{7,8}';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "This field is required";
    } else if (value.length != 10) {
      return "Mobile number must be of 10 digits";
    } else if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }

  static String? validatePassword(String value) {
    const pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "This field is required";
    } else if (!regExp.hasMatch(value)) {
      return "Password must have at least 8 characters,an uppercase, a special symbol and a number";
    }
    return null;
  }

  static String? validateName(String value) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "This field is required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }

  static String? validateNumber(String value) {
    const pattern = r'^[0-9]+$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "This field is required";
    } else if (!regExp.hasMatch(value)) {
      return "Value must be [0-9]";
    }
    return null;
  }

  static String? validatePasswordLength(String value) {
    if (value.isEmpty) {
      return "This field is required";
    } else if (value.length < 5) {
      return "Password must be longer than 5 characters";
    }
    return null;
  }

  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  static String? validateEmail(String value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return "This field is required";
    } else if (!regExp.hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  static String? validateCartItem(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a quantity';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    if (int.parse(value) <= 0) {
      return 'Quantity must be greater than zero';
    }

    if (int.parse(value) >= 21) {
      return 'Quantity must be less than Twenty One';
    }
    return null;
  }
}
