class Validator {
  static bool validateEmail(String value) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(value);
  }

  static bool isAllZeros(String phoneNumber) {
    return phoneNumber.isNotEmpty && phoneNumber.split('').every((digit) => digit == '0');
  }

  static bool validatePhone(String phoneNumber) {
    bool isDigitsOnly = RegExp(r'^[0-9]*$').hasMatch(phoneNumber);
    bool isNotAllZeros = phoneNumber.split('').any((digit) => digit != '0');
    bool isTenDigits = phoneNumber.length == 10;

    return isDigitsOnly && isNotAllZeros && isTenDigits;
  }
}
