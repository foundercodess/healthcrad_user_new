import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AuthViewModel with ChangeNotifier {
  final dateController =TextEditingController();
  final genderList=['Male', 'Female', 'Other'];
  String _isSelectedValue = "Select";
  String get isSelectedValue => _isSelectedValue;

  setSelectedValue(String value) {
    _isSelectedValue = value;
    setDropdownOpen(false);
    notifyListeners();
  }

  bool _isDropdownOpen = false;
  bool get isDropdownOpen => _isDropdownOpen;
  setDropdownOpen(val) {
    _isDropdownOpen = val;
    notifyListeners();
  }

  pickDate(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
        dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
    notifyListeners();
  }
}
