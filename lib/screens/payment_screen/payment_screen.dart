import 'package:docuease_admin/custom_widgets/custom_button.dart';
import 'package:docuease_admin/custom_widgets/custom_header.dart';
import 'package:docuease_admin/custom_widgets/revenue_chart.dart';
import 'package:docuease_admin/screens/payment_screen/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_text.dart';
import '../sidemenu/sidemenu.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({super.key});

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
                      customHeader("Payments"),
                      Container(
                        height: 375.h,
                        width: Get.width,
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
                                    SvgPicture.asset(
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
                                height: 240.h,
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
                      SizedBox(height: 19.h,),
                      Obx(() => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: kBlackColor.withOpacity(0.1)
                            )
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 35.h,horizontal: 24.w),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Transactions",
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style:
                                    AppStyles.blackTextStyle()
                                        .copyWith(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Spacer(),
                                  CustomButton(title: "Generate Invoices", onTap: (){},height: 42,width: 142.w,color: kWhiteColor,textColor: kBlackColor,fontWeight: FontWeight.w400,textSize: 12.sp,borderRadius: 10,borderColor: kBlackColor.withOpacity(0.1),),
                                  SizedBox(width: 14.w,),
                                  CustomButton(title: "Export CSV", onTap: (){},height: 42,width: 121.w,icon: kDownload2Icon,textSize: 12.sp,fontWeight: FontWeight.w500,)
                                ],
                              ),
                              SizedBox(height: 34.h,),
                              Stack(
                                children: [
                                  Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: kPrimaryColor.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Get.width,
                                    child: DataTable(
                                      columnSpacing: 0,
                                      headingRowHeight: 60,
                                      dividerThickness: 0,
                                      columns: [
                                        DataColumn(label: Container(),columnWidth: FixedColumnWidth(50)),

                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Invoice ID",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.blackTextStyle()
                                                  .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          headingRowAlignment:
                                          MainAxisAlignment.center,
                                          label: Flexible(
                                            child: Text(
                                              "Applicant",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.blackTextStyle()
                                                  .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          headingRowAlignment:
                                          MainAxisAlignment.center,
                                          label: Flexible(
                                            child: Text(
                                              "Fee Type",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.blackTextStyle()
                                                  .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          headingRowAlignment:
                                          MainAxisAlignment.center,
                                          label: Flexible(
                                            child: Text(
                                              "Amount",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.blackTextStyle()
                                                  .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          headingRowAlignment:
                                          MainAxisAlignment.center,
                                          label: Flexible(
                                            child: Text(
                                              "Paid?",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.blackTextStyle()
                                                  .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DataColumn(
                                          headingRowAlignment:
                                          MainAxisAlignment.center,
                                          label: Flexible(
                                            child: Text(
                                              "Method",
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style:
                                              AppStyles.blackTextStyle()
                                                  .copyWith(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                      rows: controller.pagedUsers2
                                          .map((user) => _buildDataRow(
                                          user['id']!,
                                          user['applicant']!,
                                          user['feeType']!,
                                          user['amount'],
                                          user['paid'],
                                          user,
                                          context))
                                          .toList(),
                                      dataRowMaxHeight: 70,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.h,),
                              Obx(() => CustomPagination(
                                currentPage: controller.currentPage2.value,
                                visiblePages: controller.visiblePageNumbers2,
                                onPrevious: controller.goToPreviousPage2,
                                onNext: controller.goToNextPage2,
                                onPageSelected: controller.goToPage2,
                              )),
                              SizedBox(height: 17.h,),
                            ],
                          ),
                        ),
                      ),)
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

  DataRow _buildDataRow(
      String id,
      String applicant,
      String type,
      String amount ,
      String paid,
  Map<String, dynamic> user,context) {
    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                user['isChecked'] = !user['isChecked'];
                controller.transactions.refresh();
              },
              child: Container(
                width: 22,
                height: 22,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: kBlackColor.withOpacity(0.3),
                  ),
                ),
                child: user['isChecked']
                    ? Icon(Icons.check, size: 16, color: kBlackColor)
                    : null,
              ),
            ),
          ),
        ),
        DataCell(
            Text(
              id,
              textAlign: TextAlign.center,
              style: AppStyles.blackTextStyle()
                  .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
            )),

        DataCell(Center(
          child: Text(
            applicant,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle()
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
        )),

        DataCell(Center(
          child: Text(
            type,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle()
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
        )),

        DataCell(Center(
          child: Text(
            "\$$amount",
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle()
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
        )),
        DataCell(
          Center(
            child: Container(
              height: 41,
              width: 67.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: paid == "No" ? kRedColor.withOpacity(0.1) : kGreenColor.withOpacity(0.1),
              ),
              child: Center(
                child: Text(paid,style: AppStyles.blackTextStyle().copyWith(fontSize: 14,color: paid == "No" ? kRedColor : kGreenColor),),
              ),
            ),
          ),
        ),

        DataCell(
          Center(
            child: Image.asset(kCardImage,height: 36,width: 36,),
          ),
        ),
      ],
    );
  }
}
