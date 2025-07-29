import 'package:docuease_admin/custom_widgets/custom_header.dart';
import 'package:docuease_admin/custom_widgets/revenue_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_text.dart';
import '../sidemenu/sidemenu.dart';
import 'controller/dashboard_controller.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SideMenu(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 53.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customHeader("Dashboard"),
                      SizedBox(
                        height: 347.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 16.h),
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.black.withOpacity(0.1)),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.all(14.r),
                                      child: Obx(() => Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Total Applications",
                                                  style: AppStyles.blackTextStyle().copyWith(
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.w600,
                                                  )),
                                              Container(
                                                height: 24.h,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(6),
                                                  border: Border.all(
                                                    color: kBlackColor.withOpacity(0.05),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 4.0,
                                                    horizontal: 11.w,
                                                  ),
                                                  child: Obx(() => PopupMenuButton<String>(
                                                    color: kWhiteColor,
                                                    position: PopupMenuPosition.under,
                                                    padding: EdgeInsets.zero,
                                                    onSelected: (val) {
                                                      controller.selectedFrequency.value = val;
                                                      controller.updateDataMap();
                                                    },
                                                    itemBuilder: (context) => ['Weekly', 'Monthly', 'Yearly']
                                                        .map((value) => PopupMenuItem<String>(
                                                      value: value,
                                                      child: Text(
                                                        value,
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                    ))
                                                        .toList(),
                                                    child: Row(
                                                      mainAxisSize: MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          controller.selectedFrequency.value,
                                                          style: TextStyle(
                                                            fontSize: 8,
                                                            fontWeight: FontWeight.w500,
                                                            color: kBlackColor,
                                                          ),
                                                        ),
                                                        SizedBox(width: 4),
                                                        Icon(
                                                          Icons.keyboard_arrow_down_rounded,
                                                          size: 12,
                                                          color: kBlackColor,
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                height: 112,
                                                width: 112,
                                                decoration: BoxDecoration(
                                                    color: kWhiteColor,
                                                    borderRadius: BorderRadius.circular(200),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: kBlackColor.withOpacity(0.08),
                                                          spreadRadius: 0,
                                                          offset: Offset(0, 1.8),
                                                          blurRadius: 23
                                                      )
                                                    ]
                                                ),
                                                child: Center(
                                                  child: Padding(
                                                      padding: const EdgeInsets.all(6.0),
                                                      child: Obx(() {
                                                        final dataMap = controller.dataMap;
                                                        final colorList = dataMap.keys.map((key) => controller.colorMap[key]!).toList();

                                                        return PieChart(
                                                          dataMap: dataMap,
                                                          animationDuration: Duration(milliseconds: 800),
                                                          chartRadius: MediaQuery.of(context).size.width / 2.6,
                                                          colorList: colorList,
                                                          chartType: ChartType.ring,
                                                          ringStrokeWidth: 20,
                                                          legendOptions: LegendOptions(showLegends: false),
                                                          chartValuesOptions: ChartValuesOptions(showChartValues: false),
                                                        );
                                                      })
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: 60.w,),
                                              Expanded(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: controller.dataMap.keys.map((label) {
                                                    final color = controller.colorMap[label]!;
                                                    return Row(
                                                      children: [
                                                        Container(
                                                          height: 12,
                                                          width: 12,
                                                          decoration: BoxDecoration(
                                                            color: color,
                                                            borderRadius: BorderRadius.circular(2),
                                                          ),
                                                        ),
                                                        SizedBox(width: 6),
                                                        CustomText(
                                                          text: label,
                                                          color: kGreyShade2Color,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w400,
                                                        ),
                                                        SizedBox(width: 30.w),
                                                        CustomText(
                                                          text: "140",
                                                          color: kBlackColor,
                                                          fontSize: 11,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ],
                                                    );
                                                  }).toList(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      width: Get.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.black.withOpacity(0.1)),
                                        color: Colors.white,
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 39.w),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 55.h,
                                              width: 55.w,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(9),
                                                color: kPrimaryColor.withOpacity(0.05)
                                              ),
                                              child: Center(child: SvgPicture.asset(kPdfIcon,height: 24,width: 24,))),
                                          SizedBox(width: 7.w,),

                                          Text("500",
                                              style: AppStyles.blackTextStyle().copyWith(
                                                fontSize: 24.sp,
                                                fontWeight: FontWeight.w700,
                                              )),
                                          SizedBox(width: 14.w,),
                                          Text("New Submissions",
                                              style: AppStyles.blackTextStyle().copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 27.w),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 29.h,horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Alerts",
                                        style: AppStyles.blackTextStyle().copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(height: 22.h),
                                    Obx(() {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: controller.alerts.length,
                                        itemBuilder: (context, index) {
                                          
                                          String alertText = controller.alerts[index];

                                          return MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.markAsRead(index);
                                              },
                                              child: Obx(() => Padding(
                                                padding: EdgeInsets.only(bottom: 16.h),
                                                child: Container(
                                                  height: 59.h,
                                                  decoration: BoxDecoration(
                                                    color: controller.readStatus[index]
                                                        ? kWhiteShade4Color.withOpacity(0.09)
                                                        : kPrimaryLightColor.withOpacity(0.09),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            alertText,
                                                            style: AppStyles.blackTextStyle().copyWith(
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )

                      ),
                      SizedBox(height: 22.h),
                      SizedBox(
                        height: 441.h,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 29.h,horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Obx(() => Row(
                                          children: [
                                            Text(
                                              "Total Revenue",
                                              style: AppStyles.blackTextStyle().copyWith(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(width: 13.w),
                                            Image.asset(
                                              kUpArrowIcon,
                                              height: 12.h,
                                              width: 12.w,
                                              color: controller.isPositive.value ? kGreenColor2 : Colors.red,
                                            ),
                                            SizedBox(width: 3.w),
                                            Text(
                                              "${controller.percentageChange.value.toStringAsFixed(1)}%",
                                              style: AppStyles.blackTextStyle().copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w700,
                                                color: controller.isPositive.value ? kGreenColor2 : Colors.red,
                                              ),
                                            ),
                                            SizedBox(width: 6.w),
                                            Text(
                                              "VS LAST YEAR",
                                              style: AppStyles.blackTextStyle().copyWith(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: kBlackColor.withOpacity(0.70),
                                              ),
                                            ),
                                          ],
                                        )),
                                        Container(
                                          height: 40.h,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(6),
                                            border: Border.all(
                                              color: kBlackColor.withOpacity(0.05),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 4.0,
                                              horizontal: 11.w,
                                            ),
                                            child: Obx(() => PopupMenuButton<String>(
                                              color: kWhiteColor,
                                              position: PopupMenuPosition.under,
                                              padding: EdgeInsets.zero,
                                              onSelected: (val) {
                                                controller.updateData(val);
                                              },
                                              itemBuilder: (context) => ['Weekly', 'Monthly', 'Yearly']
                                                  .map((value) => PopupMenuItem<String>(
                                                value: value,
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ))
                                                  .toList(),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    controller.selectedFrequency1.value,
                                                    style: TextStyle(
                                                      fontSize: 8,
                                                      fontWeight: FontWeight.w500,
                                                      color: kBlackColor,
                                                    ),
                                                  ),
                                                  SizedBox(width: 4),
                                                  Icon(
                                                    Icons.keyboard_arrow_down_rounded,
                                                    size: 12,
                                                    color: kBlackColor,
                                                  ),
                                                ],
                                              ),
                                            )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 14.h),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      spacing: 9.w,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                color: kPrimaryColor,
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            SizedBox(width: 6.w),
                                            CustomText(
                                              text: "Filing fee",
                                              color: kBlackColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: 12,
                                              width: 12,
                                              decoration: BoxDecoration(
                                                color: kBlackColor.withOpacity(0.7),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                            ),
                                            SizedBox(width: 6.w),
                                            CustomText(
                                              text: "Service Fee",
                                              color: kBlackColor,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Obx(() {
                                      return RevenueChart(
                                        height: 260.h,
                                        filingFee: controller.filingFee,
                                        serviceFee: controller.serviceFee,
                                        labels: controller.months,
                                        maxY: controller.maxChartY,
                                        filingColor: Colors.amber,
                                        serviceColor: Colors.black.withOpacity(0.7),
                                        tooltipBorderColor: kPrimaryColor,
                                        tooltipBgColor: kPrimaryLightColor.withOpacity(0.1),
                                      );
                                    })
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 27.w),
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black.withOpacity(0.1)),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.symmetric(vertical: 29.h,horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Recent Activity",
                                        style: AppStyles.blackTextStyle().copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                        )),
                                    SizedBox(height: 22.h),
                                    Obx(() {
                                      return ListView.builder(
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: controller.recentActivities.length,
                                        itemBuilder: (context, index) {

                                          String alertText = controller.recentActivities[index];

                                          return MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: GestureDetector(
                                              onTap: () {
                                                controller.markAsRead1(index);
                                              },
                                              child: Obx(() => Padding(
                                                padding: EdgeInsets.only(bottom: 16.h),
                                                child: Container(
                                                  height: 59.h,
                                                  decoration: BoxDecoration(
                                                    color: controller.readStatus1[index]
                                                        ? kWhiteShade4Color.withOpacity(0.09)
                                                        : kPrimaryLightColor.withOpacity(0.09),
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(horizontal: 23.w),
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            alertText,
                                                            style: AppStyles.blackTextStyle().copyWith(
                                                              fontSize: 12.sp,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),),
                                            ),
                                          );
                                        },
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
