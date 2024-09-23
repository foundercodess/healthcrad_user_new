import 'package:flutter/material.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/utils/routes/routes.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/service/bottom_nav_view_model.dart';
import 'package:health_crad_user/view_model/auth_view_model.dart';
import 'package:health_crad_user/view_model/slider_view_model.dart';
import 'package:provider/provider.dart';

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
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColor.scaffoldBgGreenColor),
        debugShowCheckedModeBanner: false,
        initialRoute: RoutesName.mainScreen,
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
