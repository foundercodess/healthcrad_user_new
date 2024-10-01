import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/utils/routes/routes.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view/splash_screen.dart';
import 'package:health_crad_user/view_model/ambulance_view_model.dart';
import 'package:health_crad_user/view_model/auth_view_model.dart';
import 'package:health_crad_user/view_model/coupon_view_model.dart';
import 'package:health_crad_user/view_model/help_view_model.dart';
import 'package:health_crad_user/view_model/service/bottom_services.dart';
import 'package:health_crad_user/view_model/slider_view_model.dart';
import 'package:health_crad_user/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import 'view_model/address_view_model.dart';
import 'view_model/cart_view_model.dart';
import 'view_model/doctor_view_model.dart';
import 'view_model/lab_report_download_view_model.dart';
import 'view_model/map_view_model.dart';
import 'view_model/medicine_view_model.dart';
import 'view_model/path_view_model.dart';
import 'view_model/profile_view_model.dart';
import 'view_model/rating_view_model.dart';

void main() {
  runApp(const MyApp());
}

double screenHeight = 0;
double screenWidth = 0;

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ChangeNotifierProvider(create: (context) => BottomNavViewModel()),
        ChangeNotifierProvider(create: (context) => SliderViewModel()),
        ChangeNotifierProvider(create: (context) => UserViewModel()),
        ChangeNotifierProvider(create: (context) => ProfileViewModel()),
        ChangeNotifierProvider(create: (context) => DoctorViewModel()),
        ChangeNotifierProvider(create: (context) => MedicineViewModel()),
        ChangeNotifierProvider(create: (context) => PathViewModel()),
        ChangeNotifierProvider(create: (context) => CartViewModel()),
        ChangeNotifierProvider(create: (context) => AddressViewModel()),
        ChangeNotifierProvider(create: (context) => AmbulanceViewModel()),
        ChangeNotifierProvider(create: (context) => CouponViewModel()),
        ChangeNotifierProvider(create: (context) => MapViewModel()),
        ChangeNotifierProvider(create: (context) => LabReportDownloadViewModel()),
        ChangeNotifierProvider(create: (context) => HelpViewModel()),
        ChangeNotifierProvider(create: (context) => RatingViewModel()),





      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColor.scaffoldBgGreenColor),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.splashScreen,
        onGenerateRoute: (settings) {
          if (settings.name != null) {
            return MaterialPageRoute(
              builder: Routers.generateRoute(settings.name!),
              settings: settings,
            );
          }
          return null;
        },
      ),
    );
  }
}
