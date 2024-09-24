import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/repo/auth_repo.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final dateController = TextEditingController();
  final genderList = ['Male', 'Female', 'Other'];
  String _isSelectedValue = "";
  String get isSelectedValue => _isSelectedValue;
  DateTime? pickedDate;
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
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate!);
    }
    notifyListeners();
  }

  final _authRepo = AuthRepository();

  // Login Api

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic mobileCon, context) async {
    setLoading(true);
    Map data = {
      "mobileno": mobileCon,
    };
    _authRepo.loginApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.verifyOtpScreen,
            arguments: {'phone': mobileCon});
      }
      if (value['status'] == 400) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.register,
            arguments: {'phone': mobileCon});
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

// REGISTER API
  bool _loadingRegister = false;

  bool get loadingRegister => _loadingRegister;

  setLoadingRegister(bool value) {
    _loadingRegister = value;
    notifyListeners();
  }

  Future<void> registerApi(dynamic mobileCon, dynamic nameCon, dynamic emailCon,
      dynamic isSelectedValue, dynamic dob, context) async {
    setLoadingRegister(true);
    Map data = {
      "mobileno": mobileCon,
      "name": nameCon,
      "email": emailCon,
      "gender": isSelectedValue,
      "dob": dob,
    };
    _authRepo.registerApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingRegister(false);
        Navigator.pushReplacementNamed(context, RoutesName.verifyOtpScreen,
            arguments: {'phone': mobileCon});
      }
    }).onError((error, stackTrace) {
      setLoadingRegister(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

// SEND OTP

  bool _sendOtp = false;

  bool get sendOtp => _sendOtp;

  setSendOtp(bool value) {
    _sendOtp = value;
    notifyListeners();
  }

  Future<void> sendOtpApi(dynamic mobileCon, context) async {
    setSendOtp(true);
    Map data = {
      "mobile": mobileCon,
    };
    _authRepo.sendOtpApi(data).then((value) {
      if (value['status'] == 200) {
        setSendOtp(false);
      }
    }).onError((error, stackTrace) {
      setLoadingRegister(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

// Verify OTP

  bool _verifyOtp = false;

  bool get verifyOtp => _verifyOtp;

  setVerifyOtp(bool value) {
    _verifyOtp = value;
    notifyListeners();
  }

  Future<void> verifyOtpApi(dynamic mobileCon, dynamic otpCon, context) async {
    setVerifyOtp(true);
    final userPref = Provider.of<UserViewModel>(context, listen: false);
    Map data = {
      "mobileno": mobileCon,
      "otp": otpCon,
    };
    _authRepo.verifyOtpApi(data).then((value) {
      if (value['status'] == 200) {
        userPref.saveUser(value['data']['id'].toString());
        setVerifyOtp(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
      }
    }).onError((error, stackTrace) {
      setLoadingRegister(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
