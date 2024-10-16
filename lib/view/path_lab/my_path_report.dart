import 'package:flutter/material.dart';
import 'package:health_crad_user/generated/assets.dart';
import 'package:health_crad_user/main.dart';
import 'package:health_crad_user/res/app_color.dart';
import 'package:health_crad_user/res/app_constant.dart';
import 'package:health_crad_user/res/custom_rich_text.dart';
import 'package:health_crad_user/res/text_const.dart';
import 'package:health_crad_user/view_model/lab_report_download_view_model.dart';
import 'package:health_crad_user/view_model/path_view_model.dart';
import 'package:provider/provider.dart';



import 'widgets/filter_popup.dart';

class MyPathReport extends StatefulWidget {
  const MyPathReport({super.key});

  @override
  State<MyPathReport> createState() => _MyPathReportState();
}

class _MyPathReportState extends State<MyPathReport> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<PathViewModel>(context,listen: false).myPathApi(context);
  }

  @override
  Widget build(BuildContext context) {
    final pathViewModel = Provider.of<PathViewModel>(context);
    final lrdViewModel = Provider.of<LabReportDownloadViewModel>(context);

    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          leadingWidth: screenWidth,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
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
                AppConstant.spaceWidth10,
                TextConst(
                  title: 'My Report',
                  fontSize: AppConstant.fontSizeThree,
                  color: AppColor.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    barrierColor: Colors.transparent,
                    builder: (BuildContext context) {
                      return const FilterPopup();
                    },
                  );
                },
                child: Row(
                  children: [
                    Image.asset(
                      Assets.iconsFiltterIcon,
                      scale: 3,
                    ),
                    AppConstant.spaceWidth5,
                    TextConst(
                      title: 'Filter',
                      fontSize: AppConstant.fontSizeTwo,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        body:  pathViewModel.pathViewModelData ==null?Center(child: CircularProgressIndicator()):    ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: pathViewModel.pathViewModelData!.myPathViewData!.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 10),
              width: screenWidth,
              height: screenHeight * 0.4,
              color: AppColor.whiteColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Request Id : ",
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: pathViewModel.pathViewModelData!.myPathViewData![index].id.toString(),
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                      CustomRichText(textSpans: [
                        CustomTextSpan(
                            text: "Date : ",
                            textColor: AppColor.blackColor,
                            fontSize: AppConstant.fontSizeOne),
                        CustomTextSpan(
                            text: pathViewModel.pathViewModelData!.myPathViewData![index].testDate.toString(),
                            textColor: AppColor.textColor,
                            fontSize: AppConstant.fontSizeOne)
                      ]),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        int.parse((screenWidth / 8).toStringAsFixed(0)),
                            (i) => TextConst(
                          title: '-',
                          fontSize: AppConstant.fontSizeZero,
                          color: AppColor.textColor.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConst(
                            textAlign: TextAlign.start,
                            title: pathViewModel.pathViewModelData!.myPathViewData![index].labName,
                            fontSize: AppConstant.fontSizeTwo,
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                          TextConst(
                            title:
                            pathViewModel.pathViewModelData!.myPathViewData![index].labAddress.toString(),
                            fontSize: AppConstant.fontSizeOne,
                            color: AppColor.textColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      index == 0
                          ?  Icon(
                            Icons.check_circle,
                            color:AppColor.primaryColor,
                            size: 25.0,
                          )
                          : Container()
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: screenHeight * 0.12,
                        width: screenWidth * 0.2,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage(Assets.imageMyReportListBg),
                                fit: BoxFit.contain)),
                      ),
                      AppConstant.spaceWidth20,
                      SizedBox(
                        height: screenHeight * 0.17,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextConst(
                              title: 'Name',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: 'Phone',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: 'Referred by',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: 'Patient Age',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: 'Payment',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      AppConstant.spaceWidth10,
                      SizedBox(
                        height: screenHeight * 0.17,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: ':',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                      AppConstant.spaceWidth15,
                      SizedBox(
                        height: screenHeight * 0.17,
                        width: screenWidth*0.37,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextConst(
                              title: pathViewModel.pathViewModelData!.myPathViewData![index].patientName.toString(),
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: pathViewModel.pathViewModelData!.myPathViewData![index].patientPhone.toString(),
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: pathViewModel.pathViewModelData!.myPathViewData![index].referredBy.toString(),
                              maxLines: 1,
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: '${pathViewModel.pathViewModelData!.myPathViewData![index].age.toString()} years',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                            TextConst(
                              title: pathViewModel.pathViewModelData!.myPathViewData![index].paymentStatus.toString(),
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.textColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: screenWidth,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        int.parse((screenWidth / 8).toStringAsFixed(0)),
                            (i) => TextConst(
                          title: '-',
                          fontSize: AppConstant.fontSizeZero,
                          color: AppColor.textColor.withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  index == 0
                      ? Row(
                          children: [
                            TextConst(
                              title: 'Report Status :',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            AppConstant.spaceWidth15,
                            GestureDetector(
                              onTap: ()  {
              String fileUrl = pathViewModel.pathViewModelData!.myPathViewData![index].images.toString();
              print("object---> ${fileUrl}");

              lrdViewModel.downloadFile(fileUrl, "lab_report${pathViewModel.pathViewModelData!.myPathViewData![index].id.toString()}.png");
            }, child: Container(
                                alignment: Alignment.center,
                                height: screenHeight * 0.04,
                                width: screenWidth * 0.4,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: AppColor.greenColor),
                                child: TextConst(
                                  title: 'Download Report',
                                  fontSize: AppConstant.fontSizeTwo,
                                  color: AppColor.whiteColor,
                                ),
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            TextConst(
                              title: 'Report Status :',
                              fontSize: AppConstant.fontSizeTwo,
                              color: AppColor.blackColor,
                              fontWeight: FontWeight.w600,
                            ),
                            AppConstant.spaceWidth15,
                            Container(
                              alignment: Alignment.center,
                              height: screenHeight * 0.04,
                              width: screenWidth * 0.3,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.orangeColor),
                              child: TextConst(
                                title: 'Waiting...',
                                fontSize: AppConstant.fontSizeTwo,
                                color: AppColor.whiteColor,
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            );
          },
        ));
  }
}
