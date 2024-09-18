import 'package:flutter/cupertino.dart';
import 'package:health_crad_user/view/bottom_nav_bar/appointment_screen.dart';
import 'package:health_crad_user/view/bottom_nav_bar/doctor_screen.dart';
import 'package:health_crad_user/view/bottom_nav_bar/home_screen.dart';
import 'package:health_crad_user/view/bottom_nav_bar/more_screen.dart';

class BottomNavViewModel with ChangeNotifier {

  final List widgetOptions = [
    const HomeScreen(),
    const AppointmentScreen(),
    const DoctorScreen(),
    const MoreScreen(),
    const MoreScreen(),
  ];




  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onItemTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
