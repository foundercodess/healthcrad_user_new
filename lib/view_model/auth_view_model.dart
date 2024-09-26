// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:health_crad_user/repo/auth_repo.dart';
// import 'package:health_crad_user/utils/routes/routes_name.dart';
// import 'package:health_crad_user/utils/utils.dart';
// import 'package:health_crad_user/view_model/user_view_model.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
//
// class AuthViewModel with ChangeNotifier {
//   final dateController = TextEditingController();
//   final genderList = ['Male', 'Female', 'Other'];
//   String _isSelectedValue = "";
//   String get isSelectedValue => _isSelectedValue;
//   DateTime? pickedDate;
//
//
//   setSelectedValue(String value) {
//     _isSelectedValue = value;
//     setDropdownOpen(false);
//     notifyListeners();
//   }
//
//   bool _isDropdownOpen = false;
//   bool get isDropdownOpen => _isDropdownOpen;
//   setDropdownOpen(val) {
//     _isDropdownOpen = val;
//     notifyListeners();
//   }
//
//   pickDate(context) async {
//     pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//
//     if (pickedDate != null) {
//       dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate!);
//     }
//     notifyListeners();
//   }
//
//   final _authRepo = AuthRepository();
//
//   // Login Api
//
//   bool _loading = false;
//
//   bool get loading => _loading;
//
//   setLoading(bool value) {
//     _loading = value;
//     notifyListeners();
//   }
//
//   Future<void> loginApi(dynamic mobileCon, context) async {
//     setLoading(true);
//     Map data = {
//       "mobileno": mobileCon,
//     };
//     _authRepo.loginApi(data).then((value) {
//       if (value['status'] == 200) {
//         setLoading(false);
//         Navigator.pushReplacementNamed(context, RoutesName.verifyOtpScreen,
//             arguments: {'phone': mobileCon});
//       }
//       if (value['status'] == 400) {
//         setLoading(false);
//         Navigator.pushReplacementNamed(context, RoutesName.register,
//             arguments: {'phone': mobileCon});
//       }
//     }).onError((error, stackTrace) {
//       setLoading(false);
//       if (kDebugMode) {
//         print('error: $error');
//       }
//     });
//   }
//
// // REGISTER API
//   bool _loadingRegister = false;
//
//   bool get loadingRegister => _loadingRegister;
//
//   setLoadingRegister(bool value) {
//     _loadingRegister = value;
//     notifyListeners();
//   }
//
//   Future<void> registerApi(dynamic mobileCon, dynamic nameCon, dynamic emailCon,
//       dynamic isSelectedValue, dynamic dob, context) async {
//     setLoadingRegister(true);
//     Map data = {
//       "mobileno": mobileCon,
//       "name": nameCon,
//       "email": emailCon,
//       "gender": isSelectedValue,
//       "dob": dob,
//     };
//     _authRepo.registerApi(data).then((value) {
//       if (value['status'] == 200) {
//         setLoadingRegister(false);
//         Navigator.pushReplacementNamed(context, RoutesName.verifyOtpScreen,
//             arguments: {'phone': mobileCon});
//       }
//     }).onError((error, stackTrace) {
//       setLoadingRegister(false);
//       if (kDebugMode) {
//         print('error: $error');
//       }
//     });
//   }
//
// // SEND OTP
//
//   bool _sendOtp = false;
//
//   bool get sendOtp => _sendOtp;
//
//   setSendOtp(bool value) {
//     _sendOtp = value;
//     notifyListeners();
//   }
//
//   Future<void> sendOtpApi(dynamic mobileCon, context) async {
//     setSendOtp(true);
//     Map data = {
//       "mobile": mobileCon,
//     };
//     _authRepo.sendOtpApi(data).then((value) {
//       if (value['status'] == 200) {
//         setSendOtp(false);
//       }
//     }).onError((error, stackTrace) {
//       setLoadingRegister(false);
//       if (kDebugMode) {
//         print('error: $error');
//       }
//     });
//   }
//
// // Verify OTP
//
//   bool _verifyOtp = false;
//
//   bool get verifyOtp => _verifyOtp;
//
//   setVerifyOtp(bool value) {
//     _verifyOtp = value;
//     notifyListeners();
//   }
//
//   Future<void> verifyOtpApi(dynamic mobileCon, dynamic otpCon, context) async {
//     setVerifyOtp(true);
//     final userPref = Provider.of<UserViewModel>(context, listen: false);
//     Map data = {
//       "mobileno": mobileCon,
//       "otp": otpCon,
//     };
//     _authRepo.verifyOtpApi(data).then((value) {
//       if (value['status'] == 200) {
//         userPref.saveUser(value['data']['id'].toString());
//         setVerifyOtp(false);
//         Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
//       }
//     }).onError((error, stackTrace) {
//       setLoadingRegister(false);
//       if (kDebugMode) {
//         print('error: $error');
//       }
//     });
//   }
// }


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/repo/auth_repo.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier {
  final dateController = TextEditingController();
  final List<String> genderList = ['Male', 'Female', 'Other'];

  String _selectedGender = "";
  String get selectedGender => _selectedGender;
  bool _isDropdownOpen = false;
  DateTime? pickedDate;

  // Loading states
  bool _isLoading = false;
  bool _isRegistering = false;
  bool _isOtpSending = false;
  bool _isOtpVerifying = false;

  final _authRepo = AuthRepository();

  bool get isLoading => _isLoading;
  bool get isRegistering => _isRegistering;
  bool get isOtpSending => _isOtpSending;
  bool get isOtpVerifying => _isOtpVerifying;

  // Toggle dropdown visibility
  bool get isDropdownOpen => _isDropdownOpen;
  void setDropdownOpen(bool value) {
    _isDropdownOpen = value;
    notifyListeners();
  }

  // Select gender value
  void setSelectedGender(String value) {
    _selectedGender = value;
    setDropdownOpen(false);
    notifyListeners();
  }

  // Pick date
  Future<void> pickDate(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate!);
      notifyListeners();
    }
  }

  // Set loading states
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setRegistering(bool value) {
    _isRegistering = value;
    notifyListeners();
  }

  void _setOtpSending(bool value) {
    _isOtpSending = value;
    notifyListeners();
  }

  void _setOtpVerifying(bool value) {
    _isOtpVerifying = value;
    notifyListeners();
  }

  // Login API
  Future<void> loginApi(String mobileNumber, BuildContext context) async {
    _setLoading(true);
    Map<String, dynamic> data = {"mobileno": mobileNumber};

    try {
      final response = await _authRepo.loginApi(data);
      _handleLoginResponse(response, mobileNumber, context);
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    } finally {
      _setLoading(false);
    }
  }

  void _handleLoginResponse(Map<String, dynamic> response, String mobileNumber, BuildContext context) {
    if (response['status'] == 200) {
      Navigator.pushReplacementNamed(context, RoutesName.verifyOtpScreen, arguments: {'phone': mobileNumber});
    } else if (response['status'] == 400) {
      Navigator.pushReplacementNamed(context, RoutesName.register, arguments: {'phone': mobileNumber});
    }
  }

  // Register API
  Future<void> registerApi(String mobileNumber, String name, String email, String gender, String dob, BuildContext context) async {
    _setRegistering(true);
    Map<String, dynamic> data = {
      "mobileno": mobileNumber,
      "name": name,
      "email": email,
      "gender": gender,
      "dob": dob,
    };

    try {
      final response = await _authRepo.registerApi(data);
      if (response['status'] == 200) {
        Navigator.pushReplacementNamed(context, RoutesName.verifyOtpScreen, arguments: {'phone': mobileNumber});
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    } finally {
      _setRegistering(false);
    }
  }

  // Send OTP API
  Future<void> sendOtpApi(String mobileNumber, BuildContext context) async {
    _setOtpSending(true);
    Map<String, dynamic> data = {"mobile": mobileNumber};

    try {
      final response = await _authRepo.sendOtpApi(data);
      if (response['status'] == 200) {
        _setOtpSending(false);
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    } finally {
      _setOtpSending(false);
    }
  }

  // Verify OTP API
  Future<void> verifyOtpApi(String mobileNumber, String otp, BuildContext context) async {
    _setOtpVerifying(true);
    final userPref = Provider.of<UserViewModel>(context, listen: false);
    Map<String, dynamic> data = {
      "mobileno": mobileNumber,
      "otp": otp,
    };

    try {
      final response = await _authRepo.verifyOtpApi(data);
      if (response['status'] == 200) {
        userPref.saveUser(response['data']['id'].toString());
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error: $error');
      }
    } finally {
      _setOtpVerifying(false);
    }
  }
}
