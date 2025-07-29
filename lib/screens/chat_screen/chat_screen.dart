import 'package:docuease_admin/custom_widgets/custom_header.dart';
import 'package:docuease_admin/custom_widgets/revenue_chart.dart';
import 'package:docuease_admin/screens/chat_screen/controller/chat_controller.dart';
import 'package:docuease_admin/screens/payment_screen/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../sidemenu/sidemenu.dart';

class ChatScreen extends GetView<ChatController> {
  const ChatScreen({super.key});

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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w,vertical: 53.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeader("Chat"),
                    Expanded(
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double availableHeight = constraints.maxHeight;

                          return Padding(
                            padding: EdgeInsets.only(bottom: 100.h),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: availableHeight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: kBlackColor.withOpacity(0.1)),
                                      color: kWhiteColor,
                                    ),
                                    child: SingleChildScrollView(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(vertical: 34.h,horizontal: 26.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 42.h,
                                              child: CustomTextField(
                                                hintText: "Search here...",
                                                prefixIcon: kSearchIcon,
                                                fillColor: kWhiteColor,
                                                isFilled: true,
                                                borderRadius: 12,
                                              ),
                                            ),
                                            SizedBox(height: 18.h,),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: 5,
                                              physics: NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                              return Padding(
                                                padding: EdgeInsets.only(bottom: 23.h),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      bottom: BorderSide(
                                                        color: kBlackColor.withOpacity(0.12)
                                                      )
                                                    )
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.only(bottom: 8.0.h),
                                                    child: Row(
                                                      children: [
                                                        Container(
                                                          height: 33,
                                                          width: 33,
                                                          decoration: const BoxDecoration(shape: BoxShape.circle),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(100),
                                                            child: Image.asset(kPersonImage, fit: BoxFit.cover),
                                                          ),
                                                        ),
                                                        SizedBox(width: 6.w,),
                                                        Expanded(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(
                                                                "Jack.Johan",
                                                                style: AppStyles.blackTextStyle().copyWith(
                                                                  fontSize: 14,
                                                                  fontWeight: FontWeight.w500,
                                                                ),
                                                              ),
                                                              Text(
                                                                "I want to say something...",
                                                                style: AppStyles.blackTextStyle().copyWith(
                                                                  fontSize: 8,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: kBlackColor.withOpacity(0.5)
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 29.w),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: availableHeight,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: kBlackColor.withOpacity(0.1)),
                                      color: kWhiteColor,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius: BorderRadius.circular(50),
                                                child: Image.asset(kPersonImage, height: 40, width: 40, fit: BoxFit.cover),
                                              ),
                                              SizedBox(width: 12.w),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Jane Doe",
                                                      style: AppStyles.blackTextStyle()
                                                          .copyWith(fontSize: 16, fontWeight: FontWeight.w600,color: kGreyColor4)),
                                                  Text("Online",
                                                      style: AppStyles.blackTextStyle()
                                                          .copyWith(fontSize: 14.sp, color: kGreyShade6Color)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Obx(() {
                                            return ListView.builder(
                                              padding: EdgeInsets.all(20.w),
                                              itemCount: controller.messages.length,
                                              itemBuilder: (context, index) {
                                                final msg = controller.messages[index];
                                                bool isSender = msg.isSender;

                                                return Align(
                                                  alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                    isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize: MainAxisSize.min,
                                                        crossAxisAlignment: isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                                        children: [
                                                          if (!isSender) ...[
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(50),
                                                              child: Image.asset(kPersonImage,
                                                                  height: 22, width: 22, fit: BoxFit.cover),
                                                            ),
                                                            SizedBox(width: 8.w),
                                                          ],
                                                          Column(
                                                            crossAxisAlignment: isSender ?CrossAxisAlignment.end : CrossAxisAlignment.start,

                                                            children: [
                                                              Container(
                                                                margin: EdgeInsets.symmetric(vertical: 6.h),
                                                                padding: EdgeInsets.symmetric(
                                                                    vertical: 10.h, horizontal: 14.w),
                                                                constraints: BoxConstraints(maxWidth: 300.w),
                                                                decoration: BoxDecoration(
                                                                  color: isSender
                                                                      ? kBlackColor
                                                                      : kPrimaryColor.withOpacity(0.1),
                                                                  borderRadius: BorderRadius.only(
                                                                    topRight: Radius.circular(7),
                                                                    bottomRight: Radius.circular(isSender ? 0 : 7),
                                                                    topLeft: Radius.circular(isSender ? 7 : 0),
                                                                    bottomLeft: Radius.circular(7),
                                                                  ),
                                                                ),
                                                                child: Text(
                                                                  msg.message,
                                                                  style: AppStyles.blackTextStyle().copyWith(
                                                                    color: isSender ? Colors.white : Colors.black,
                                                                    fontSize: 12,
                                                                  ),
                                                                ),
                                                              ),
                                                              Text(
                                                                msg.time,
                                                                style: AppStyles.blackTextStyle().copyWith(
                                                                    fontSize: 10,
                                                                    color: kGreyShade7Color),
                                                              ),
                                                            ],
                                                          ),
                                                          if (isSender) ...[
                                                            SizedBox(width: 8.w),
                                                            ClipRRect(
                                                              borderRadius: BorderRadius.circular(50),
                                                              child: Image.asset(kPersonImage,
                                                                  height: 22, width: 22, fit: BoxFit.cover),
                                                            ),
                                                          ],
                                                        ],
                                                      ),
                                                      // Padding(
                                                      //   padding: EdgeInsets.only(
                                                      //       left: isSender ? 0 : 36.w, right: isSender ? 4.w : 0),
                                                      //   child:
                                                      // ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            );
                                          }),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 8),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
                                            decoration: BoxDecoration(
                                              color: kGreyShade3Color,
                                              borderRadius: BorderRadius.circular(8),
                                              border: Border.all(
                                                color: kGreyShade4Color
                                              )
                                            ),
                                            child: Row(
                                              children: [
                                                SvgPicture.asset(kLinkIcon,height: 24,width: 24,),
                                                SizedBox(width: 10.w),
                                                Expanded(
                                                  child: TextField(
                                                    onChanged: (val) => controller.messageController.value = val,
                                                    onSubmitted: (val) => controller.sendMessage(val),
                                                    decoration: InputDecoration(
                                                      hintText: "Write here",
                                                      hintStyle: GoogleFonts.inter(fontSize: 12.sp,fontWeight: FontWeight.w400,color: kGreyColor2),
                                                      border: InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                                IconButton(
                                                  icon: const Icon(Icons.send),
                                                  color: kBlackColor,
                                                  onPressed: () =>
                                                      controller.sendMessage(controller.messageController.value),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
