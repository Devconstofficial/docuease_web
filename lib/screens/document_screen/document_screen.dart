import 'package:docuease_admin/custom_widgets/common_dialog.dart';
import 'package:docuease_admin/custom_widgets/custom_button.dart';
import 'package:docuease_admin/custom_widgets/custom_header.dart';
import 'package:docuease_admin/screens/document_screen/controller/document_controller.dart';
import 'package:docuease_admin/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class DocumentScreen extends GetView<DocumentController> {
  const DocumentScreen({super.key});

  documentDialog(){
    return CommonDialog(
        widget: Column(
          mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 22.h,),
        SizedBox(
          height: 392.h,
          width: Get.width,
          child: Image.asset(kPadImage,fit: BoxFit.cover,),
        )
      ],
    ), title: "Preview");
  }

  uploadDialog(){
    return CommonDialog(
        widget: Column(
          mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 37.h,),
        Container(
          height: 180.h,
          width: Get.width,
          decoration: BoxDecoration(
            color: kWhiteShade2Color.withOpacity(0.07),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: kBlackColor.withOpacity(0.1)
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 9,
            children: [
              SvgPicture.asset(kUploadIcon,height: 32,width: 32,),
              Text("Upload PDF, DOCX, or TXT only",style: AppStyles.blackTextStyle().copyWith(fontSize: 10,fontWeight: FontWeight.w400),)
            ],
          ),
        ),
        SizedBox(height: 37.h,),
        CustomButton(title: "Upload", onTap: (){},height: 48,)
      ],
    ), title: "Replace File");
  }

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
                      customHeader("Documents"),
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
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Documents",
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
                                              "Application ID",
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
                                              "Uploaded",
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
                                              "Type",
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
                                              "Status",
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
                                              "Actions",
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
                                          user['documents']!,
                                          user['id']!,
                                          user['upload']!,
                                          user['type'],
                                          user['status'],
                                          context))
                                          .toList(),
                                      dataRowMaxHeight: 70,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 112.h,),
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
      String doc,
      String apId,
      String uploaded,
      String type ,
      String status, context) {
    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
            Text(
              doc,
              textAlign: TextAlign.center,
              style: AppStyles.blackTextStyle()
                  .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
            )),

        DataCell(Center(
          child: Text(
            apId,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle()
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
        )),

        DataCell(Center(
          child: Text(
            uploaded,
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
        DataCell(
          Center(
            child: Container(
              height: 41,
              width: 98.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kGreenColor.withOpacity(0.1),
              ),
              child: Center(
                child: Text(status,style: AppStyles.blackTextStyle().copyWith(fontSize: 14,color: kGreenColor),),
              ),
            ),
          ),
        ),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 42,
                width: 80.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      color: kBlackColor.withOpacity(0.1)
                  ),
                  color: kWhiteColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Get.dialog(documentDialog());
                            },
                            child: Image.asset(kViewIcon,height: 16,width: 16,))),
                    Container(
                        height: 42,
                        width: 1,
                        color: kBlackColor.withOpacity(0.1)
                    ),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Get.dialog(uploadDialog());
                            },
                            child: Image.asset(kDownloadIcon,height: 16,width: 16,))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
