import 'package:form_field_validator/form_field_validator.dart';

String? validateFullName(value) {
  if (value!.isEmpty && value.length < 3) {
    return 'Name must be more than 2 charater.'; // form is not valid
  } else {
    return null; // form is valid
  }
}

final validatorEmail =
    EmailValidator(errorText: 'Enter a valid email address ');

String? validatorStudentId(value) {
  if (value?.length != 10) {
    return "Please Enter a Student Id";
  } else if (!RegExp(
          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
      .hasMatch(value!)) {
    return "Please Enter a Valid Student Id";
  }
  return null;
}

String? validatorPhoneNumber(value) {
  if (value?.length != 10) {
    return "Please Enter a Phone Number 10 digit";
  } else if (!RegExp(
          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
      .hasMatch(value!)) {
    return "Please Enter a Valid Phone Number";
  }
  return null;
}

final passwordValidator = MultiValidator([
  RequiredValidator(errorText: 'Password is required'),
  MinLengthValidator(6, errorText: 'Password must be at least 6 digits long'),
  PatternValidator(r'(?=.*?[#?!@$%^&*-])',
      errorText: 'Passwords must have at least one special character')
]);


