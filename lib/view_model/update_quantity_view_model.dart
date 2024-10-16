import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:health_crad_user/repo/update_quantity_repo.dart';
import 'package:health_crad_user/res/common_delete_popup.dart';
import 'package:health_crad_user/utils/utils.dart';
import 'package:health_crad_user/view_model/cart_view_model.dart';
import 'package:health_crad_user/view_model/medicine_view_model.dart';

import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class UpdateQuantityViewModel with ChangeNotifier {
  final _updateQuantityRepo = UpdateQuantityRepo();

  bool _loading = false;

  bool get loadingRegister => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  // getMedicineQuantityFromCart(context, index) {
  //   final medicViewModel =
  //       Provider.of<MedicineViewModel>(context, listen: false);
  //   final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
  //
  //   medicViewModel.allMedicineModelData!.allMedicineData![index].quantity =
  //       int.parse((cartViewModel.vModelData!.viewCartData!
  //               .where((e) =>
  //                   medicViewModel
  //                       .allMedicineModelData!.allMedicineData![index].id ==
  //                   e.id)
  //               .first
  //               .productQuantity)
  //           .toString());
  // }

  // getMedicineQuantityFromCart(BuildContext context, int index) {
  //   final medicViewModel = Provider.of<MedicineViewModel>(context, listen: false);
  //   final cartViewModel = Provider.of<CartViewModel>(context, listen: false);
  //
  //   // Check if any of these objects are null
  //   final allMedicines = medicViewModel.allMedicineModelData?.allMedicineData;
  //   final cartItems = cartViewModel.vModelData?.viewCartData;
  //   if (allMedicines == null || cartItems == null) {
  //     // Return early or handle the null case as needed
  //     print("Medicine or Cart data is null.");
  //     return;
  //   }
  //
  //   // Ensure the index is within bounds
  //   if (index >= cartItems.length) {
  //     print("Index out of bounds.");
  //     return;
  //   }
  //
  //   final medicine = allMedicines[index];
  //   // Find the cart item that matches the medicine by ID
  //   medicine.quantity=1;
  //   final cartItem = cartItems.firstWhere(
  //         (e) => medicine.id == e.id,
  //   );
  //
  //   if (cartItem != null) {
  //     medicine.quantity = int.tryParse(cartItem.productQuantity?.toString() ?? '0') ?? 0;
  //   } else {
  //     print("Cart item not found for the medicine ID: ${medicine.id}");
  //   }
  //   medicViewModel.notifyListeners();
  // }


  updateProductQuantity(context, int index, String type) {
    final medicViewModel =
        Provider.of<MedicineViewModel>(context, listen: false);
    if (type == "add") {
      if (int.parse((medicViewModel
                  .allMedicineModelData!.allMedicineData![index].addedQuantity)
              .toString()) <
          15) {
        medicViewModel.allMedicineModelData!.allMedicineData![index].addedQuantity =
            int.parse(medicViewModel
                    .allMedicineModelData!.allMedicineData![index].addedQuantity
                    .toString()) +
                1;
      } else {
        Utils.show("Max quantity limit reached", context);
      }
    } else if (type == "sub") {
      if (int.parse((medicViewModel
                  .allMedicineModelData!.allMedicineData![index].addedQuantity)
              .toString()) >
          1) {
        medicViewModel.allMedicineModelData!.allMedicineData![index].addedQuantity =
            int.parse(medicViewModel
                    .allMedicineModelData!.allMedicineData![index].addedQuantity
                    .toString()) -
                1;
      } else {
        if (medicViewModel
                .allMedicineModelData!.allMedicineData![index].isAddedToCart ==
            1) {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return CommonDeletePopup(
                    title: 'Do you want to delete the added medicines',
                    yes: () {
                      Provider.of<CartViewModel>(context, listen: false)
                          .deleteToCartApi(
                              medicViewModel.allMedicineModelData!
                                  .allMedicineData![index].id
                                  .toString(),
                              context,index);
                    });
              });
        }
        print("min 0 quantity selected");
      }
    } else {
      debugPrint("not valid type selected for update product");
    }
    medicViewModel.notifyListeners();
    updateQuantityApi(
        medicViewModel.allMedicineModelData!.allMedicineData![index].addedQuantity
            .toString(),
        medicViewModel.allMedicineModelData!.allMedicineData![index].id
            .toString(),
        context);
    notifyListeners();
  }

  Future<void> updateQuantityApi(
      dynamic quantity, dynamic productId, context) async {
    setLoading(true);
    print(quantity);
    print(productId);
    print('kkkkk');
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();

    Map data = {
      "uid": userId,
      "quantity": quantity,
      "cartid": productId,
    };
    _updateQuantityRepo.updateQuantityApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Provider.of<CartViewModel>(context, listen: false).cartViewApi(context);
        // Provider.of<MedicineViewModel>(context, listen: false).allMedicineApi(context,'','10','1');
        Provider.of<MedicineViewModel>(context, listen: false)
            .medicineCatApi(context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }

}
