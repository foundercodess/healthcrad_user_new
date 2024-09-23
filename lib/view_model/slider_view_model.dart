import 'package:flutter/foundation.dart';
import 'package:health_crad_user/model/slider_model.dart';
import 'package:health_crad_user/utils/utils.dart';
import '../repo/silder_repo.dart';


class SliderViewModel with ChangeNotifier {
  final _sliderRepo = SliderRepo();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  SliderModel? _sliderModelData;

  SliderModel get sliderModelData => _sliderModelData!;

  setListData(SliderModel value) {
    _sliderModelData = value;
    notifyListeners();
  }

  Future<void> sliderApi(context) async {
    setLoading(true);
    _sliderRepo.sliderApi({"userid":"1111"}).then((value) {

      if (value.status == 200) {

        setLoading(false);
        setListData(value);
      } else {
        setLoading(false);

        Utils.show(value.message.toString(), context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        Utils.show(error.toString(), context);
        print('error: $error');
      }
    });
  }
}
