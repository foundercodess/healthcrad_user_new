import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/service/bottom_nav_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavViewModel>(builder: (context, bnm, child) {
      return Scaffold(
        body: bnm.widgetOptions.elementAt(bnm.selectedIndex),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, -1),
                    color: Colors.grey.shade200,
                    spreadRadius: 1,
                    blurRadius: 3)
              ]
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          height: 60,
          // shape: const CircularNotchedRectangle(),
          // notchMargin: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(
                index: 0,
                icon: Assets.iconsHome,
                label: "Home",
              ),
              _buildNavItem(
                index: 1,
                icon: Assets.iconsAppointments,
                label: "Appointments",
              ),
              _buildNavItem(
                index: 2,
                icon: Assets.iconsDoctor,
                label: "Doctor",
              ),
              _buildNavItem(
                  index: 3,
                  icon: Assets.iconsEmergency,
                  label: "Emergency",
                  isColorDiffer: true),
              _buildNavItem(
                index: 4,
                icon: Assets.iconsMore,
                label: "More",
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildNavItem(
      {required int index,
      required String icon,
      required String label,
      bool isColorDiffer = false}) {
    return Consumer<BottomNavViewModel>(builder: (context, bnm, child) {
      final isSelected = bnm.selectedIndex == index;

      return GestureDetector(
        onTap: () => bnm.onItemTapped(index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              scale: 2,
              color: isColorDiffer
                  ? Colors.red
                  : isSelected
                      ? AppColor.primaryColor
                      : AppColor.greyColor,
            ),
            TextConst(
              title: label,
              fontSize: AppConstant.fontSizeZero,
              color: isColorDiffer
                  ? Colors.red
                  : isSelected
                      ? AppColor.primaryColor
                      : AppColor.greyColor,
            ),
          ],
        ),
      );
    });
  }
}
// import 'package:flutter/material.dart';
// import 'package:health_crad_user/generated/assets.dart';
// import 'package:health_crad_user/res/app_color.dart';
// import 'package:health_crad_user/res/app_constant.dart';
// import 'package:health_crad_user/view/bottom_nav_bar/appointment_screen.dart';
// import 'package:health_crad_user/view/bottom_nav_bar/doctor_screen.dart';
// import 'package:health_crad_user/view/bottom_nav_bar/emergency_screen.dart';
// import 'package:health_crad_user/view/bottom_nav_bar/home_screen.dart';
// import 'package:health_crad_user/view/bottom_nav_bar/more_screen.dart';
//
// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({super.key});
//
//   @override
//   State<BottomNavBar> createState() => _BottomNavBarState();
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   int _selectedIndex = 0;
//   static const List _widgetOptions = [
//     HomeScreen(),
//     AppointmentScreen(),
//     DoctorScreen(),
//     EmergencyScreen(),
//     MoreScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     // Prevent selection of "Emergency"
//     if (index == 3) return;
//
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(Assets.iconsHome)),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(Assets.iconsAppointments)),
//             label: 'Appointments',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(Assets.iconsDoctor)),
//             label: 'Doctor',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(
//               AssetImage(Assets.iconsEmergency),
//               color: Colors.red, // Always red for the icon
//             ),
//             label: 'Emergency',
//           ),
//           BottomNavigationBarItem(
//             icon: ImageIcon(AssetImage(Assets.iconsMore)),
//             label: 'More',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         type: BottomNavigationBarType.fixed,
//         backgroundColor: Colors.white,
//         onTap: _onItemTapped,
//         selectedItemColor: _selectedIndex == 3 ? Colors.red : AppColor.primaryColor,
//         unselectedItemColor: AppColor.greyColor,
//         selectedLabelStyle: TextStyle(
//           fontSize: AppConstant.fontSizeOne,
//           color: _selectedIndex == 3 ? Colors.red : AppColor.primaryColor,
//         ),
//         unselectedLabelStyle: TextStyle(
//           fontSize: AppConstant.fontSizeOne,
//           color: _selectedIndex == 3 ? Colors.red : AppColor.primaryColor,
//         ),
//       ),
//     );
//   }
// }
