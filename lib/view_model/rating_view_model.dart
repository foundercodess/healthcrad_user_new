import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:health_crad_user/repo/rating_repo.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';

import '../res/app_color.dart';
import '../res/common_rating_popup.dart';
import '../res/text_const.dart';

class RatingViewModel with ChangeNotifier {
  final _ratingRepo = RatingRepo();

  int _ratingValue = 1;
  int get ratingValue => _ratingValue;
  final reviewMsgCon = TextEditingController();
  String _userToken = '';

  RatingViewModel() {
    getUserId();
  }

  getUserId() async {
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    _userToken = userId!;

    print("userId setted $_userToken");
    notifyListeners();
  }

  void setRatingValue(int rate) {
    _ratingValue = rate;
    notifyListeners();
  }

  rateWidget(context, String typeId, String reviewId,
      {isOpenInPopUp = false,}) {
    // 1-> doctor appointment, 2-> order medicine, 3-> prescription order, 4-> ambulance order
    final data = {
      "type": typeId,
      "review_id": reviewId
    };
    return Row(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(5, (i) {
            return InkWell(
                onTap: () {
                  setRatingValue(i+1);
                },
                child: Icon(
                  Icons.star_rounded,
                  color: ratingValue >= i+1
                      ? AppColor.greenColor
                      : AppColor.greyColor,
                  size: 30,
                ));
          }),
        ),
        if (!isOpenInPopUp)
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return CommonRatingPopup(
                        data: data,
                        title: "Rate your experience",);
                  },
                );
              },
              child: TextConst(
                title: "Submit",
                color: AppColor.primaryColor,
                fontSize: AppConstant.fontSizeOne,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
      ],
    );
  }

  bool _loadingRating = false;

  bool get loadingRating => _loadingRating;

  setLoadingRating(bool value) {
    _loadingRating = value;
    notifyListeners();
  }

  Future<void> ratingApi(context,dynamic val) async {
    final data = {
      "user_id": _userToken,
      "type": val['type'],
      "rating": _ratingValue,
      "message": reviewMsgCon.text,
      "review_id": val['review_id']
    };
    print("review data $data");
    setLoadingRating(true);

    _ratingRepo.ratingApi(data).then((value) {
      if (value['status'] == 200) {
        Utils.show(value["message"], context);
        setLoadingRating(false);
        reviewMsgCon.clear();
        Navigator.pop(context);
      }
    }).onError((error, stackTrace) {
      setLoadingRating(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}
