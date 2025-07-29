import 'package:docuease_admin/custom_widgets/custom_header.dart';
import 'package:docuease_admin/screens/meetings_screen/controller/meetings_controller.dart';
import 'package:docuease_admin/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../utils/app_images.dart';
import '../../utils/app_styles.dart';
import '../sidemenu/sidemenu.dart';

class MeetingScreen extends GetView<MeetingsController> {
  const MeetingScreen({super.key});

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
                      customHeader("Meetings"),
                      SizedBox(height: 17.h),
                      SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(33),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  _arrowButton(Icons.arrow_back_ios),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 31.w),
                                    child: Text(
                                      "May 21 – 26, 2045",
                                      style: AppStyles.blackTextStyle().copyWith(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  _arrowButton(Icons.arrow_forward_ios_outlined),
                                ],
                              ),
                              SizedBox(height: 54.h),
                              Obx(() {
                                final items = controller.meetings;
                                final rows = (items.length / 3).ceil();

                                return Column(
                                  children: List.generate(rows, (rowIndex) {
                                    final start = rowIndex * 3;
                                    final end = (start + 3) > items.length ? items.length : (start + 3);
                                    final rowItems = items.sublist(start, end);

                                    while (rowItems.length < 3) {
                                      rowItems.add({"name": "", "time": "", "date": "", "desc": "", "empty": "true"});
                                    }

                                    return Padding(
                                      padding: EdgeInsets.only(bottom: 24.h),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: rowItems.map((meeting) {
                                          return Expanded(
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                right: 23.w,
                                              ),
                                              child: meeting.containsKey("empty") && meeting["empty"] == "true"
                                                  ? const SizedBox() // Empty space for equal width
                                                  : _meetingCard(meeting),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    );
                                  }),
                                );
                              })
                            ],
                          ),
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

  Widget _meetingCard(Map<String, String> data) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 55,
                  width: 55,
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(kPersonImage, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    data["name"]!,
                    style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SvgPicture.asset(kChatIcon1, height: 38, width: 38),
              ],
            ),
            SizedBox(height: 11.h),
            Row(
              children: [
                SvgPicture.asset(kClockIcon, height: 24, width: 24),
                SizedBox(width: 4.w),
                Text(
                  data["time"]!,
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 29.w),
                SvgPicture.asset(kCalenderIcon1, height: 24, width: 24),
                SizedBox(width: 4.w),
                Text(
                  data["date"]!,
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 11.h),
            SizedBox(
              height: 4 * 16,
              child: Text(
                data["desc"] ?? "",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.blackTextStyle().copyWith(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _arrowButton(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: kBlackColor),
      ),
      child: Center(child: Icon(icon, size: 10)),
    );
  }
}
