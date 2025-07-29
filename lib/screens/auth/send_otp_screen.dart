import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class SendOtpScreen extends GetView<AuthController> {
  const SendOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                    child: Container(
                      height: 35.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: kWhiteColor,
                        border: Border.all(
                          color: kBlackColor.withOpacity(0.10),
                        )
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0.w),
                        child: Center(child: Icon(Icons.arrow_back_ios,size: 20.h,)),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Text(
                  "Forgot password",
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 17.h),
            Text(
              "Enter your email address, and we’ll send you a \none-time OTP code.",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 33.h),
            CustomTextField(
              hintText: "Enter your email",
              prefixIcon: kMailIcon,
              fillColor: kWhiteColor,
              isFilled: true,
            ),
            SizedBox(height: 186.h),
            CustomButton(
              title: "Send Code",
              onTap: () {
                Get.toNamed(kVerifyOtpScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
