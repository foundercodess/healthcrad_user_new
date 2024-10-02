import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/model/address_get_model.dart';
import 'package:health_crad_user/repo/address_repo.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AddressViewModel with ChangeNotifier {
  final _addressRepo = AddressRepo();


// Add Address API






  bool _loadingAddAddress = false;

  bool get loadingAddAddress => _loadingAddAddress;

  setLoadingAddAddress(bool value) {
    _loadingAddAddress = value;
    notifyListeners();
  }

  Future<void> addAddressApi(dynamic userName, dynamic pName, dynamic pinCode,
      dynamic state, dynamic city,dynamic landmark,dynamic address,dynamic phoneNo, context) async {
    setLoadingAddAddress(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data = {
      "user_id": userId,
      "user_name": userName,
      "patient_name": pName,
      "pincode": pinCode,
      "state": state,
      "city": city,
      "landmark": landmark,
      "address": address,
      "phone_no": phoneNo,
    };
    _addressRepo.addAddressApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingAddAddress(false);
        final addressViewModel =Provider.of<AddressViewModel>(context, listen: false);
        addressViewModel.getAddressApi(context);
        Utils.show(value["message"], context);
        Navigator.pop(context);
      }
    }).onError((error, stackTrace) {
      setLoadingAddAddress(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

// Get Address
  AddressGetModel? _modelAddressData ;
  AddressGetModel? get modelAddressData => _modelAddressData;

  void setModelAddressData(AddressGetModel name) {
    _modelAddressData = name;
    notifyListeners();
  }


  int _selectedIndex = 0;


  int get selectedIndex => _selectedIndex;

  String _selectedAddress = "";
  String get selectedAddress => _selectedAddress;
  String _selectedName = "";
  String get selectedName => _selectedName;

  void setSelectedIndex(int index,String address,String name) {
      _selectedIndex = index;
      _selectedAddress = address;
      _selectedName =name;
      notifyListeners();

  }

  Future<void> getAddressApi(context) async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _addressRepo.getAddressApi(userId).then((value) {
      if (value.status == 200) {
        setSelectedIndex(selectedIndex,value.getAddressData![selectedIndex].address.toString(),value.getAddressData![selectedIndex].userName.toString());
        setModelAddressData(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

  // Delete Address

  bool _loadingDa = false;

  bool get loadingDa => _loadingDa;

  setLoadingDa(bool value) {
    _loadingDa = value;
    notifyListeners();
  }

  Future<void> deleteAddressApi(dynamic addressId, context) async {
    setLoadingDa(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data = {
      "user_id": userId,
      "address_id": addressId,
    };

    _addressRepo.deleteAddressApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingDa(false);

        final addressViewModel =Provider.of<AddressViewModel>(context, listen: false);
        addressViewModel.getAddressApi(context);
        Utils.show(value["message"], context);
      } else {}
    }).onError((error, stackTrace) {
      setLoadingDa(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

}


