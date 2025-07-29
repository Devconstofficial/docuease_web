import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';

class AuthScreen extends GetView<AuthController> {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: AuthComponent(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Login to your account",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 37.h),
            CustomTextField(
              hintText: "Enter your email",
              prefixIcon: kMailIcon,
              fillColor: kWhiteColor,
              isFilled: true,
            ),
            SizedBox(height: 14),
            Obx(
                  () => CustomTextField(
                hintText: "Enter your password",
                isObscure: controller.isPasswordHidden.value,
                prefixIcon: kLockIcon,
                suffix: IconButton(
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    controller.togglePasswordVisibility();
                  },
                ),
                fillColor: kWhiteColor,
                isFilled: true,
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Obx(() => MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      controller.isCheck.value = !controller.isCheck.value;
                    },
                    child: Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                            width: 1.5
                        ),
                      ),
                      child: Center(child: controller.isCheck.value ? Image.asset(kCheckIcon,height: 10,width: 10,) : SizedBox.shrink()),
                    ),
                  ),
                ),),
                SizedBox(width: 6.w,),
                Text(
                  "Remember me",
                  style: AppStyles.blackTextStyle().copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      Get.toNamed(kSendOtpScreenRoute);
                    },
                    child: Text(
                      "Forgot Password?",
                      style: AppStyles.blackTextStyle().copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: kPrimaryColor
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 71.h),
            CustomButton(
              title: "Login",
              onTap: () {
                Get.toNamed(kDashboardScreenRoute);
              },
              height: 62,
            ),
          ],
        ),
      ),
    );
  }
}
