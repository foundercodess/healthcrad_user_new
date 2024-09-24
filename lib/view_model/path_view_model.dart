import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:health_crad_user/repo/path_lab_repo.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:image_picker/image_picker.dart';

class PathViewModel with ChangeNotifier{


  final ImagePicker _picker = ImagePicker();
  String? _base64Image;
  String? _imageName;
  String? get base64Image => _base64Image;
  String? get imagePath => _imageName;

  Future<void> pickImage(ImageSource source, context) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      File imageFile = File(image.path);
      _imageName = image.name;
      List<int> imageBytes = await imageFile.readAsBytes();
        _base64Image = base64Encode(imageBytes);
        Navigator.of(context).pop();
    }
    notifyListeners();
  }



// Request Api



  final _pathRequestRepo = PathRequestRepo();


  bool _loadingRequest = false;

  bool get loadingRequest => _loadingRequest;

  setLoadingRequest(bool value) {
    _loadingRequest = value;
    notifyListeners();
  }

  Future<void> requestApi(dynamic labName, dynamic labAddress, dynamic patientName,
      dynamic labAge, dynamic labReferred, dynamic labDate,
      dynamic patientPhone, dynamic labPayMode,
      context) async {
    setLoadingRequest(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data = {
      "lab_name": labName,
      "lab_address": labAddress,
      "patient_name": patientName,
      "age": labAge,
      "referred_by": labReferred,
      "test_date": labDate,
      "patient_phone": patientPhone,
      "paymode": labPayMode,
      "user_id": userId,
      "images": _base64Image,
    };

    _pathRequestRepo.requestApi(data).then((value) {
      if (value['status'] == 200) {
        setLoadingRequest(false);
        Navigator.pushNamed(context, RoutesName.commonOrderScreen,
            arguments: {
              "name": "Your Request Report has been\nsubmitted successfully"
            });
      }else{
        setLoadingRequest(false);
      }
    }).onError((error, stackTrace) {
      setLoadingRequest(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }



}