import 'package:docuease_admin/custom_widgets/custom_header.dart';
import 'package:docuease_admin/screens/clients/controller/clients_controller.dart';
import 'package:docuease_admin/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../custom_widgets/application_container.dart';
import '../../custom_widgets/common_dialog.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class ClientsScreen extends GetView<ClientsController> {
  const ClientsScreen({super.key});

  viewProfile(){
    return CommonDialog(
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h,),
            Text("Contact Info",style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500),),
            SizedBox(height: 14.h,),
            Column(
              spacing: 16.h,
              children: [
                SizedBox(
                    height: 41.h,
                    child: CustomTextField(
                      hintText: "Jack Johan",
                      prefixIcon: kUser1Icon,
                      borderRadius: 10,
                    )),
                SizedBox(
                    height: 41.h,
                    child: CustomTextField(
                      hintText: "jack@gmail.com",
                      prefixIcon: kMailIcon,
                      borderRadius: 10,
                    )),
                SizedBox(
                    height: 41.h,
                    child: CustomTextField(
                      hintText: "123+123456789",
                      prefixIcon: kPhoneIcon,
                      borderRadius: 10,
                    )),
                SizedBox(
                    height: 41.h,
                    child: CustomTextField(
                      hintText: "hometown123",
                      prefixIcon: kGlobalIcon,
                      borderRadius: 10,
                    )),
              ],
            ),
            SizedBox(height: 33.h,),
            Text("Citizenship & Domicile",style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500),),
            SizedBox(height: 14.h,),
            Column(
              spacing: 16.h,
              children: [
                SizedBox(
                    height: 41.h,
                    child: CustomTextField(
                      hintText: "USA",
                      prefixIcon: kGlobalIcon,
                      borderRadius: 10,
                    )),
                SizedBox(
                    height: 41.h,
                    child: CustomTextField(
                      hintText: "Arizona",
                      prefixIcon: kGlobalIcon,
                      borderRadius: 10,
                    )),
              ],
            ),
            SizedBox(height: 32.h,),
            Text("Applications",style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500),),
            SizedBox(height: 6.h,),
            applicationContainer("Copyright", (){
              Get.dialog(applicationDetails(isApproved: true));
            }),
            SizedBox(height: 10.h,),
            applicationContainer("Business Registration", (){
              Get.dialog(applicationDetails(isApproved: false));
            }),
            SizedBox(height: 37.h,),
            CustomButton(title: "Upload", onTap: (){},height: 48,)
          ],
        ), title: "Clint Profile");
  }

  applicationDetails({bool isApproved = false}){
    return CommonDialog(
      width: 405.w,
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isApproved
                    ? CustomButton(title: "Approved", onTap: (){},fontWeight: FontWeight.w400,textSize: 14.sp,width: 106.w,height: 39.h,color: kGreenColor.withOpacity(0.1),borderColor: kWhiteColor,borderRadius: 7,textColor: kGreenColor,)
                    : CustomButton(title: "Pending", onTap: (){},fontWeight: FontWeight.w400,textSize: 14.sp,width: 106.w,height: 39.h,color: kPrimaryColor.withOpacity(0.1),borderColor: kWhiteColor,borderRadius: 7,textColor: kPrimaryColor,),
                Text("12/2/2025",style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w400),),
              ],
            ),
            SizedBox(height: 26.h,),
            Column(
              spacing: 18.h,
              children: [
                CustomTextField(
                  hintText: "M. Gonzalez",
                  prefixIcon: kUser2Icon,
                  borderRadius: 10,
                ),
                CustomTextField(
                  hintText: "mgonzalez@gmail.com",
                  prefixIcon: kMailIcon,
                  borderRadius: 10,
                ),
                CustomTextField(
                  hintText: "000_0000_000",
                  prefixIcon: kIdCardIcon,
                  borderRadius: 10,
                ),
                CustomTextField(
                  hintText: "+1234567890",
                  prefixIcon: kFlagImage,
                  borderRadius: 10,
                  isImagePng: true,
                ),
                CustomTextField(
                  hintText: "Correspondence Address",
                  prefixIcon: kGlobalIcon,
                  borderRadius: 10,
                ),

              ],
            ),
            SizedBox(height: 10.h,),
            applicationContainer("Copyright PDF Document", (){},isDownload: true),
            SizedBox(height: 18.h,),
            if(!isApproved)
              CustomButton(title: "Add Note", onTap: (){
                Get.dialog(addNotes());
              },height: 48.h,borderRadius: 16,textSize: 14,),
            if(isApproved) ...[
              Text("Notes",style: AppStyles.blackTextStyle().copyWith(fontSize: 18.sp,fontWeight: FontWeight.w500),),
              SizedBox(height: 7.h,),
              CustomTextField(
                hintText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip",
                borderRadius: 10,
                maxLines: 4,
              ),
            ]
          ],
        ), title: "Application details");
  }

  addNotes(){
    return CommonDialog(
      width: 352.w,
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 23.h,),
            CustomTextField(
              hintText: 'Add Title',
              borderRadius: 10,
            ),
            SizedBox(height: 11.h,),
            CustomTextField(
              hintText: "Ad note...",
              borderRadius: 10,
              maxLines: 7,
            ),
            SizedBox(height: 21.h,),
            CustomButton(title: "Add Note", onTap: (){
              Get.back();
            },height: 48.h,borderRadius: 16,textSize: 14,),
          ],
        ), title: "Add Notes");
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
                      customHeader("Clients"),
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
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 42.h,
                                    width: 300.w,
                                    child: CustomTextField(
                                      hintText: "Search here...",
                                      prefixIcon: kSearchIcon,
                                      fillColor: kWhiteColor,
                                      isFilled: true,
                                      borderRadius: 12,
                                    ),
                                  ),
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
                                        DataColumn(
                                          label: Flexible(
                                            child: Text(
                                              "Name",
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
                                          label: Flexible(
                                            child: Text(
                                              "Organization",
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
                                          label: Flexible(
                                            child: Text(
                                              "Email",
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
                                              "Claims",
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
                                              "Action",
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
                                          user['name']!,
                                          user['organization']!,
                                          user['email']!,
                                          user['claims'],
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
      String name,
      String org,
      String email,
      String claims ,
      String status, context) {
    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
            Text(
              name,
              textAlign: TextAlign.center,
              style: AppStyles.blackTextStyle()
                  .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
            )),

        DataCell(Text(
          org,
          textAlign: TextAlign.center,
          style: AppStyles.blackTextStyle()
              .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
        )),

        DataCell(Text(
          email,
          textAlign: TextAlign.center,
          style: AppStyles.blackTextStyle()
              .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
        )),

        DataCell(Center(
          child: Text(
            claims,
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
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: (){
                Get.dialog(viewProfile());
              },
              child: Center(
                child: Container(
                  height: 41,
                  width: 98.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kBlackColor,
                  ),
                  child: Center(
                    child: Text("View",style: AppStyles.blackTextStyle().copyWith(fontSize: 14,color: kWhiteColor),),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}
