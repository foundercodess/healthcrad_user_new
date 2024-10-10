import 'package:flutter/material.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view/ambulance/ambulance_booking_history.dart';
import 'package:health_crad_user/view/ambulance/ambulance_page.dart';
import 'package:health_crad_user/view/ambulance/ambulance_review.dart';
import 'package:health_crad_user/view/ambulance/map_page.dart';
import 'package:health_crad_user/view/appointment_page/appointment_booking.dart';
import 'package:health_crad_user/view/appointment_page/slot_page.dart';
import 'package:health_crad_user/view/appointment_page/view_appointment_page.dart';
import 'package:health_crad_user/view/auth/notification_page.dart';
import 'package:health_crad_user/view/auth/verify_otp_screen.dart';
import 'package:health_crad_user/view/auth/login_screen.dart';
import 'package:health_crad_user/view/auth/register.dart';
import 'package:health_crad_user/view/bottom_nav_bar/appointment_screen.dart';
import 'package:health_crad_user/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:health_crad_user/view/bottom_nav_bar/doctor_category_screen.dart';
import 'package:health_crad_user/view/bottom_nav_bar/home_screen.dart';
import 'package:health_crad_user/view/doctor/doctor_profile_page.dart';
import 'package:health_crad_user/view/help_page.dart';
import 'package:health_crad_user/view/medicine/cart_page.dart';
import 'package:health_crad_user/view/medicine/medicine_details.dart';
import 'package:health_crad_user/view/medicine/medicines_page.dart';
import 'package:health_crad_user/view/more/saved_address_screen.dart';
import 'package:health_crad_user/view/more/view_profile.dart';
import 'package:health_crad_user/view/more/widget/common_app_bar_more.dart';
import 'package:health_crad_user/view/path_lab/my_path_report.dart';
import 'package:health_crad_user/view/path_lab/path_lab_page.dart';
import 'package:health_crad_user/view/path_lab/request_lab_report.dart';
import 'package:health_crad_user/view/path_lab/widgets/filter_popup.dart';
import 'package:health_crad_user/view/payments/apply%20_coupon_page.dart';
import 'package:health_crad_user/view/payments/payment_screen.dart';
import 'package:health_crad_user/view/prescription/order_by_prescription.dart';
import 'package:health_crad_user/view/prescription/prescription_order_history_details.dart';
import 'package:health_crad_user/view/auth/main_screen.dart';
import 'package:health_crad_user/view/splash_screen.dart';

import '../../res/common_order_successfully_screen.dart';
import '../../view/doctor/category_list_doctor.dart';
import '../../view/medicine/medicine_history_order_detail.dart';
import '../../view/medicine/medicine_order_history.dart';
import '../../view/more/add_new_address.dart';

class Routers {
  static WidgetBuilder generateRoute(String routeName) {
    switch (routeName) {
      case RoutesName.splashScreen:
        return (context) => const SplashScreen();
        case RoutesName.mainScreen:
        return (context) => const MainScreen();
      case RoutesName.login:
        return (context) => const LoginScreen();
      case RoutesName.register:
        return (context) => const RegisterScreen();
      // case RoutesName.singUpOtpScreen:
      //   return (context) => const SingUpOtpScreen();
      case RoutesName.commonOrderScreen:
        return (context) => const CommonOrderScreen();
      case RoutesName.verifyOtpScreen:
        return (context) => const LoginOtpScreen();
      case RoutesName.medicines:
        return (context) => const MedicinesPage();
      case RoutesName.medicineDetails:
        return (context) => const MedicineDetails();
      case RoutesName.payment:
        return (context) => const PaymentScreen();
      case RoutesName.applyCouponPage:
        return (context) => const ApplyCouponPage();
      case RoutesName.ambulancePage:
        return (context) => const AmbulancePage();
      case RoutesName.pathLab:
        return (context) => const PathLabPage();
      case RoutesName.ambulanceReview:
        return (context) => const AmbulanceReview();
      case RoutesName.cartPage:
        return (context) => const CartPage();
      case RoutesName.orderPrescription:
        return (context) => const OrderByPrescription();
      case RoutesName.requestReport:
        return (context) => const RequestLabReport();
      case RoutesName.pathReport:
        return (context) => const MyPathReport();
      case RoutesName.cTapDoctor:
        return (context) => const CategoryTapListDoctor();
      case RoutesName.doctorProfile:
        return (context) => const DoctorProfilePage();
      case RoutesName.slotPage:
        return (context) => const SlotPage();
      case RoutesName.appointmentBooking:
        return (context) => const AppointmentBooking();
      case RoutesName.notificationPage:
        return (context) => const NotificationPage();
      case RoutesName.viewProfile:
        return (context) => const ViewProfile();
      case RoutesName.ambulanceBookingHistory:
        return (context) => const AmbulanceBookingHistory();
      case RoutesName.viewAppointmentPage:
        return (context) => const ViewAppointmentPage();
      case RoutesName.medicineOrderHistoryScreen:
        return (context) => const MedicineOrderHistoryScreen();
      case RoutesName.bottomNavBar:
        return (context) => const BottomNavBar();
      case RoutesName.medicineOrderHistoryDetailScreen:
        return (context) => const MedicineHistoryOrderDetailScreen();
      case RoutesName.prescriptionOrderHistoryDetailsScreen:
        return (context) => const PrescriptionOrderHistoryDetailsScreen();
      case RoutesName.appointmentHistoryScreen:
        return (context) => const AppointmentScreen();
      case RoutesName.savedAddressScreen:
        return (context) => const SavedAddressScreen();
      case RoutesName.addNewAddressScreen:
        return (context) => const AddNewAddressScreen();
        case RoutesName.helpPage:
        return (context) => const HelpPage();
      case RoutesName.mapPage:
        return (context) =>  const MapPage();
      case RoutesName.doctorCetagoryScreen:
        return (context) => const DoctorCategoryScreen();
      default:
        return (context) => const Scaffold(
              body: Center(
                child: Text(
                  'No Route Found!',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            );
    }
  }
}
