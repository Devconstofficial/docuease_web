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

class SetNewPassScreen extends GetView<AuthController> {
  const SetNewPassScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  "OTP Verification",
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 28.h),
            Text(
              "Create New Password",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 26.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              "Your new password must be unique from \nthose previously used.",
              style: AppStyles.blackTextStyle().copyWith(fontSize: 18.sp,color: kBlackShade3Color,fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 33.h),
            Obx(
                  () => CustomTextField(
                hintText: "Password",
                isObscure: controller.isPasswordHidden1.value,
                prefixIcon: kLockIcon,
                suffix: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden1.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    controller.togglePasswordVisibility1();
                  },
                ),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
            ),
            SizedBox(height: 16.h),
            Obx(
                  () => CustomTextField(
                hintText: "Confirm Password",
                isObscure: controller.isPasswordHidden2.value,
                prefixIcon: kLockIcon,
                suffix: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden2.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    controller.togglePasswordVisibility2();
                  },
                ),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
            ),
            SizedBox(height: 112.h),
            CustomButton(
              title: "Reset Password",
              onTap: () {
                Get.toNamed(kAuthScreenRoute);
              },
            ),
          ],
        ),
      ),

    );
  }
}
