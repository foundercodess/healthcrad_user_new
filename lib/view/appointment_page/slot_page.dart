import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/utils/routes/routes_name.dart';
import 'package:health_crad_user/view_model/doctor_view_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SlotPage extends StatefulWidget {
  const SlotPage({super.key});

  @override
  State<SlotPage> createState() => _SlotPageState();
}

class _SlotPageState extends State<SlotPage> {
  int selectedList = 0;
  String? selectedDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DoctorViewModel>(context, listen: false)
          .getDoctorApi(context, "");
    });
  }

  List<String> morning = [
    '08:00 AM',
    '09:00 AM',
    '11:00 AM',
    '12:00 AM',
    '01:00 AM'
  ];
  List<String> afterNon = ['02:00 AM', '04:00 AM', '05:00 AM'];
  @override
  Widget build(BuildContext context) {
    final doctorViewModel = Provider.of<DoctorViewModel>(context);
    List<String> dates = List.generate(15, (index) {
      DateTime date = DateTime.now().add(Duration(days: index));
      return DateFormat('EEEE, d MMM').format(date);
    });

    return Scaffold(
        backgroundColor: AppColor.scaffoldBgColor,
        appBar: AppBar(
          toolbarHeight: kToolbarHeight * 1.2,
          backgroundColor: AppColor.primaryColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Image.asset(
                  Assets.iconsArrowBack,
                  color: AppColor.whiteColor,
                  scale: 3,
                ),
              ),
              AppConstant.spaceWidth15,
              Container(
                height: kToolbarHeight / 1.2,
                width: kToolbarHeight / 1.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(doctorViewModel.getDoctorModelData!
                        .getDoctorModelData![selectedList].imgUrl
                        .toString()),
                    scale: 3,
                  ),
                ),
              ),
              AppConstant.spaceWidth10,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextConst(
                    title: doctorViewModel.getDoctorModelData!
                        .getDoctorModelData![selectedList].name,
                    fontSize: AppConstant.fontSizeTwo,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                  AppConstant.spaceHeight5,
                  TextConst(
                    title: doctorViewModel.getDoctorModelData!
                        .getDoctorModelData![selectedList].address,
                    fontSize: AppConstant.fontSizeOne,
                    color: AppColor.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Column(children: [
          Container(
            width: screenWidth,
            color: AppColor.whiteColor,
            child: Column(
              children: [
                AppConstant.spaceHeight20,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.iconsMedicalHome,
                        height: 25,
                        width: 25,
                        color: AppColor.blueColor,
                      ),
                      AppConstant.spaceWidth10,
                      TextConst(
                        title: 'Clinic Visit Slot',
                        fontSize: AppConstant.fontSizeTwo,
                        color: AppColor.blackColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                AppConstant.spaceHeight20,
                SizedBox(
                  height: screenWidth / 7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: dates.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedList = index;
                            selectedDate=dates[index];
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(
                              left: 15, right: index == 14 ? 15 : 0, bottom: 5),
                          decoration: BoxDecoration(
                            color: selectedList == index
                                ? AppColor.fadedPrimaryColor.withOpacity(0.05)
                                : AppColor.whiteColor,
                            border: Border.all(
                                width: 0.5,
                                color: selectedList == index
                                    ? AppColor.primaryColor
                                    : AppColor.textColor),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextConst(
                                title: dates[index],
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.blackColor,
                              ),
                              TextConst(
                                title: 'No slots available',
                                fontSize: AppConstant.fontSizeOne,
                                color: index == 0
                                    ? AppColor.textColor
                                    : AppColor.greenColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                AppConstant.spaceHeight10,
              ],
            ),
          ),
          AppConstant.spaceHeight10,
          selectedList == 0
              ? Container(
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  color: AppColor.whiteColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      children: [
                        AppConstant.spaceHeight10,
                        TextConst(
                          title: 'Today ${dates.first}',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                        ),
                        AppConstant.spaceHeight15,
                        SizedBox(
                          width: screenWidth,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              int.parse((screenWidth / 5).toStringAsFixed(0)),
                              (i) => TextConst(
                                title: '-',
                                fontSize: 5,
                                color: AppColor.textColor.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        AppConstant.spaceHeight10,
                        TextConst(
                          title: 'No slots available, choose next date',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                        ),
                        AppConstant.spaceHeight10,
                        TextConst(
                          title: 'OR',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                        AppConstant.spaceHeight20,
                        Container(
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.35,
                          decoration: BoxDecoration(
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                width: 1, color: AppColor.primaryColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                Assets.iconsGreenCallIcon,
                                height: 25,
                                width: 25,
                                color: AppColor.primaryColor,
                              ),
                              TextConst(
                                title: "Contact",
                                color: AppColor.primaryColor,
                                fontSize: AppConstant.fontSizeTwo,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  width: screenWidth,
                  height: screenHeight * 0.4,
                  color: AppColor.whiteColor,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      children: [
                        AppConstant.spaceHeight10,
                        TextConst(
                          title: '${dates.first}',
                          fontSize: AppConstant.fontSizeTwo,
                          color: AppColor.blackColor,
                        ),
                        AppConstant.spaceHeight15,
                        SizedBox(
                          width: screenWidth,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              int.parse((screenWidth / 5).toStringAsFixed(0)),
                              (i) => TextConst(
                                title: '-',
                                fontSize: 5,
                                color: AppColor.textColor.withOpacity(0.7),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        AppConstant.spaceHeight10,
                        Row(
                          children: [
                            Image.asset(
                              Assets.iconsMorningIcon,
                              height: 25,
                              width: 25,
                            ),
                            AppConstant.spaceWidth10,
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Morning ",
                                  textColor: AppColor.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppConstant.fontSizeTwo),
                              CustomTextSpan(
                                  text: '  5 slots',
                                  textColor: AppColor.textColor,
                                  fontSize: AppConstant.fontSizeOne)
                            ]),
                          ],
                        ),
                        AppConstant.spaceHeight10,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutesName.appointmentBooking);
                          },
                          child: GridSlotWidget(data: morning,selectedDate: selectedDate!),
                        ),
                        AppConstant.spaceHeight20,
                        Row(
                          children: [
                            Image.asset(
                              Assets.iconsMorningIcon,
                              height: 25,
                              width: 25,
                            ),
                            AppConstant.spaceWidth10,
                            CustomRichText(textSpans: [
                              CustomTextSpan(
                                  text: "Afternoon ",
                                  textColor: AppColor.blackColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: AppConstant.fontSizeTwo),
                              CustomTextSpan(
                                  text: '  5 slots',
                                  textColor: AppColor.textColor,
                                  fontSize: AppConstant.fontSizeOne)
                            ]),
                          ],
                        ),
                        AppConstant.spaceHeight10,
                        GridSlotWidget(
                          data: afterNon,
                          selectedDate: selectedDate!,
                        ),
                      ],
                    ),
                  ),
                ),
          AppConstant.spaceHeight10,
          selectedList == 0
              ? const SizedBox.shrink()
              : Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  width: screenWidth,
                  alignment: Alignment.center,
                  color: AppColor.whiteColor,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColor.primaryColor),
                            ),
                            child: TextConst(
                              title: "00:00 PM",
                              color: AppColor.primaryColor,
                              fontSize: AppConstant.fontSizeTwo,
                            ),
                          ),
                          AppConstant.spaceWidth15,
                          TextConst(
                            title: "This colour shows slot open for booking",
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.textColor,
                          )
                        ],
                      ),
                      AppConstant.spaceHeight15,
                      Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 7),
                            decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  width: 1, color: AppColor.greyColor),
                            ),
                            child: TextConst(
                              title: "00:00 PM",
                              color: AppColor.greyColor,
                              fontSize: AppConstant.fontSizeTwo,
                            ),
                          ),
                          AppConstant.spaceWidth15,
                          TextConst(
                            textAlign: TextAlign.start,
                            title:
                                "This colour shows slot already booked.\nChoose another slot.",
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.textColor,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
        ]));
  }
}

class GridSlotWidget extends StatelessWidget {
  const GridSlotWidget({
    super.key,
    required this.data, required this.selectedDate,
  });
  final List<String> data;
  final String selectedDate;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // Number of items per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: (screenWidth * 0.23) / (screenHeight * 0.05),
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RoutesName.appointmentBooking,
                  arguments: {"date": selectedDate, 'time': data[index]});
            },
            child: Container(
              alignment: Alignment.center,
              height: screenHeight * 0.05,
              width: screenWidth * 0.23,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(width: 1, color: AppColor.primaryColor),
              ),
              child: TextConst(
                title: data[index],
                color: AppColor.primaryColor,
                fontSize: AppConstant.fontSizeTwo,
              ),
            ),
          );
        });
  }
}
