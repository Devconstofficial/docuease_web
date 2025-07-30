import 'package:docuease_admin/custom_widgets/custom_header.dart';
import 'package:docuease_admin/screens/application_screen/controller/application_controller.dart';
import 'package:docuease_admin/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../custom_widgets/application_container.dart';
import '../../custom_widgets/common_dialog.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_pagination.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class ApplicationScreen extends GetView<ApplicationController> {
  const ApplicationScreen({super.key});

  viewDetails({bool isEdit = false}){

    return CommonDialog(
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.h,),
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
                  isImagePng: true,
                  borderRadius: 10,
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
            SizedBox(height: 33.h,),
            if(isEdit)
              CustomButton(title: "Edit", onTap: (){
              },height: 48.h,borderRadius: 16,textSize: 14,),
          ],
        ), title: isEdit ? "Edit" : "View details");
  }

  rejectionDialog(){
    return CommonDialog(
        width: 360.w,
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 29.h,),
            applicationContainer("Copyright PDF Document", (){},isDownload: true),

            SizedBox(height: 16.h,),
            CustomTextField(
              hintText: "Type reason here...",
              borderRadius: 10,
              maxLines: 7,
            ),
            SizedBox(height: 21.h,),
            CustomButton(title: "Reject", onTap: (){
              Get.back();
            },height: 48.h,borderRadius: 16,textSize: 14,),
          ],
        ), title: "Rejection");
  }

  Widget customCheckbox(bool isSelected) {
    return Container(
      height: 14,
      width: 14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: isSelected ? kPrimaryColor : kBlackColor.withOpacity(0.5),
          width: 1,
        ),
        color: isSelected ? kPrimaryColor : Colors.transparent,
      ),
      child: isSelected
          ? Icon(Icons.check, size: 10, color: kWhiteColor)
          : null,
    );
  }

  byDate() {

    Future<void> _pickDate(TextEditingController controller) async {
      DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
      );
      if (picked != null) {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      }
    }

    return CommonDialog(
      width: 360,
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 22.h),
          CustomTextField(
            controller: controller.startDateController,
            hintText: "Start Date",
            prefixIcon: kCalenderIcon1,
            readOnly: true,
            onTap: () => _pickDate(controller.startDateController),
          ),
          SizedBox(height: 19.h),
          CustomTextField(
            controller: controller.endDateController,
            hintText: "End Date",
            prefixIcon: kCalenderIcon1,
            readOnly: true,
            onTap: () => _pickDate(controller.endDateController),
          ),
          SizedBox(height: 36.h),
          CustomButton(
            title: "Apply Filter",
            onTap: () {
              Get.back();
            },
            height: 48.h,
            borderRadius: 12,
            textSize: 14,
          ),
        ],
      ),
      title: "By Date",
    );
  }

  approvedDialog(){
    return CommonDialog(
        width: 360.w,
        widget: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 179,
              width: 207.w,
              child: Image.asset(kSuccessImage,fit: BoxFit.contain,),
            ),
            SizedBox(height: 24.h,),
            Text("Application Approved!",style: AppStyles.blackTextStyle().copyWith(fontSize: 20,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            SizedBox(height: 12.h,),
            Text("The application has been successfully reviewed and approved.",style: AppStyles.blackTextStyle().copyWith(fontSize: 16,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
            SizedBox(height: 51.h,),
          ],
        ), title: "",showTitle: true,);
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
                      customHeader("Applications"),
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
                                spacing: 7,
                                children: [
                                  SizedBox(
                                    height: 42,
                                    width: 181.w,
                                    child: CustomTextField(
                                      hintText: "Search here...",
                                      prefixIcon: kSearchIcon,
                                      fillColor: kWhiteColor,
                                      isFilled: true,
                                      borderRadius: 12,
                                    ),
                                  ),
                                  CustomButton(
                                    title: "By date",
                                    onTap: (){
                                    Get.dialog(byDate());
                                  },
                                    height: 42,
                                    width: 116.w,
                                    icon: kFilterIcon,
                                    textSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                    textColor: kBlackColor,),
                                  CustomButton(
                                    title: "By Status",
                                    key: controller.menuKey1,
                                    onTap: () async {
                                      final RenderBox button = controller.menuKey1.currentContext!.findRenderObject() as RenderBox;
                                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

                                      final Offset buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);

                                      final RelativeRect position = RelativeRect.fromLTRB(
                                        buttonPosition.dx,
                                        buttonPosition.dy + button.size.height + 6,
                                        buttonPosition.dx + button.size.width,
                                        buttonPosition.dy + button.size.height + 6,
                                      );

                                      final selected = await showMenu<String>(
                                        color: kWhiteColor,
                                        context: context,
                                        position: position,
                                        shape: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        items: [
                                          PopupMenuItem<String>(
                                            enabled: false,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('By Status',style: AppStyles.blackTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                                MouseRegion(
                                                  cursor: SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(3),
                                                          color: kGreyShade8Color,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: kWhiteShade2Color.withOpacity(0.25),
                                                              offset: Offset(0, 4),
                                                              blurRadius: 22,
                                                              spreadRadius: 0,
                                                            )
                                                          ]
                                                      ),
                                                      child: Center(child: Icon(Icons.close,color: kBlackColor,size: 12,)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          ...["Submitted", "Rejected", "In review", "Complected"].map((type) {
                                            return PopupMenuItem<String>(
                                              value: type,
                                              child: Container(
                                                width: 160.w,
                                                decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Obx(() {
                                                      bool isSelected = controller.selectedWorkTypes.contains(type);
                                                      return GestureDetector(
                                                        onTap: () {
                                                          controller.toggleSelection(type);
                                                        },
                                                        child: customCheckbox(isSelected),
                                                      );
                                                    }),
                                                    SizedBox(width: 4,),
                                                    Text(type,style: AppStyles.blackTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w300),),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ],
                                      );

                                      if (selected != null) {
                                        controller.toggleSelection(selected);
                                      }
                                    },
                                    width: 142.w,
                                    height: 42,
                                    icon: kFilterIcon,
                                    textSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                    textColor: kBlackColor,
                                  ),
                                  CustomButton(
                                    key: controller.applicantMenuKey,
                                      title: "By applicant",
                                      onTap: () async {
                                        final RenderBox button = controller.applicantMenuKey.currentContext!.findRenderObject() as RenderBox;
                                        final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

                                        final Offset buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);

                                        final RelativeRect position = RelativeRect.fromLTRB(
                                          buttonPosition.dx,
                                          buttonPosition.dy + button.size.height + 6,
                                          buttonPosition.dx + button.size.width,
                                          buttonPosition.dy + button.size.height + 6,
                                        );

                                        await showMenu<String>(
                                          context: context,
                                          position: position,
                                          color: kWhiteColor,
                                          items: [
                                            PopupMenuItem<String>(
                                              enabled: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  CustomTextField(
                                                    hintText: "Search Applicant...",
                                                    controller: controller.searchController,
                                                    onChanged: (value) {
                                                      controller.updateSearch(value);
                                                    },
                                                  ),
                                                  SizedBox(height: 10.h),
                                                  SizedBox(
                                                    height: 200.h,
                                                    width: Get.width,
                                                    child: Obx(() {
                                                      final results = controller.filteredApplicants;

                                                      if (results.isEmpty && controller.searchController.text.isNotEmpty) {
                                                        return Center(child: Text("No results found",style: AppStyles.blackTextStyle(),));
                                                      }

                                                      if (controller.searchController.text.isEmpty) {
                                                        return Center(child: Text("Start typing to search",style: AppStyles.blackTextStyle(),));
                                                      }

                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: results.map((name) {
                                                            bool isSelected = controller.selectedApplicants.contains(name);
                                                            return GestureDetector(
                                                              onTap: () {
                                                                controller.selectApplicant(name);
                                                                Navigator.pop(context);
                                                              },
                                                              child: Container(
                                                                width: Get.width,
                                                                color: Colors.transparent,
                                                                child: Padding(
                                                                  padding: EdgeInsets.symmetric(vertical: 6.h),
                                                                  child: Text(
                                                                    name,
                                                                    style: AppStyles.blackTextStyle().copyWith(
                                                                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                                                                      color: isSelected ? kPrimaryColor : kBlackColor,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }).toList(),
                                                        ),
                                                      );
                                                    }),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                      height: 42,width: 142.w,icon: kFilterIcon,textSize: 12.sp,fontWeight: FontWeight.w500,color: kWhiteColor,textColor: kBlackColor),
                                  CustomButton(
                                    title: "By work type",
                                    key: controller.menuKey,
                                    onTap: () async {
                                      final RenderBox button = controller.menuKey.currentContext!.findRenderObject() as RenderBox;
                                      final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;

                                      final Offset buttonPosition = button.localToGlobal(Offset.zero, ancestor: overlay);

                                      final RelativeRect position = RelativeRect.fromLTRB(
                                        buttonPosition.dx,
                                        buttonPosition.dy + button.size.height + 6,
                                        buttonPosition.dx + button.size.width,
                                        buttonPosition.dy + button.size.height + 6,
                                      );

                                      final selected = await showMenu<String>(
                                        color: kWhiteColor,
                                        context: context,
                                        position: position,
                                        shape: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                        items: [
                                          PopupMenuItem<String>(
                                            enabled: false,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('By Work Type',style: AppStyles.blackTextStyle().copyWith(fontSize: 12.sp,fontWeight: FontWeight.w500),),
                                                MouseRegion(
                                                  cursor: SystemMouseCursors.click,
                                                  child: GestureDetector(
                                                    onTap: (){
                                                      Get.back();
                                                    },
                                                    child: Container(
                                                      height: 20,
                                                      width: 20,
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(3),
                                                          color: kGreyShade8Color,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: kWhiteShade2Color.withOpacity(0.25),
                                                              offset: Offset(0, 4),
                                                              blurRadius: 22,
                                                              spreadRadius: 0,
                                                            )
                                                          ]
                                                      ),
                                                      child: Center(child: Icon(Icons.close,color: kBlackColor,size: 12,)),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          ...["Copyright", "Design", "Business", "Other"].map((type) {
                                            return PopupMenuItem<String>(
                                              value: type,
                                              child: Container(
                                                width: 160.w,
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: Row(
                                                  children: [
                                                    Obx(() {
                                                      bool isSelected = controller.selectedWorkTypes.contains(type);
                                                      return GestureDetector(
                                                        onTap: () {
                                                          controller.toggleSelection(type);
                                                        },
                                                        child: customCheckbox(isSelected),
                                                      );
                                                    }),
                                                    SizedBox(width: 4,),
                                                    Text(type,style: AppStyles.blackTextStyle().copyWith(fontSize: 12,fontWeight: FontWeight.w300),),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }),
                                        ],
                                      );

                                      if (selected != null) {
                                        controller.toggleSelection(selected);
                                      }
                                    },
                                    width: 142.w,
                                    height: 42,
                                    icon: kFilterIcon,
                                    textSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: kWhiteColor,
                                    textColor: kBlackColor,
                                  ),
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
                                              "App ID",
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
                                              "Title",
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
                                              "Submitted",
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
                                          user['id']!,
                                          user['title']!,
                                          user['applicant']!,
                                          user['status'],
                                          user['submitted'],
                                          user,
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
      String title,
      String applicant,
      String status ,
      String submitted,
      Map<String, dynamic> user, context) {
    return DataRow(
      color: WidgetStateProperty.all(Colors.transparent),
      cells: [
        DataCell(
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                user['isChecked'] = !user['isChecked'];
                controller.applicants.refresh();
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

        DataCell(Text(
          title,
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

        DataCell(
          Center(
            child: Container(
              height: 41,
              width: 98.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kBlueColorDark.withOpacity(0.05),
              ),
              child: Center(
                child: Text(status,style: AppStyles.blackTextStyle().copyWith(fontSize: 14,color: kBlueColorDark),),
              ),
            ),
          ),
        ),
        DataCell(Center(
          child: Text(
            submitted,
            textAlign: TextAlign.center,
            style: AppStyles.blackTextStyle()
                .copyWith(fontSize: 13.sp, fontWeight: FontWeight.w400),
          ),
        )),
        DataCell(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 42,
                width: 120.w,
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
                              Get.dialog(viewDetails());
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
                              Get.dialog(approvedDialog());
                              controller.applicants.remove(user);
                              controller.applicants.refresh();
                            },
                            child: Image.asset(kCheck1Icon,height: 16,width: 16,))),
                    Container(
                        height: 42,
                        width: 1,
                        color: kBlackColor.withOpacity(0.1)
                    ),
                    MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                            onTap: (){
                              Get.dialog(rejectionDialog());
                            },
                            child: Image.asset(kCancelIcon,height: 16,width: 16,))),
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
