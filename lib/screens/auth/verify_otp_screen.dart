import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/style.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_styles.dart';
import '../../custom_widgets/auth_component.dart';
import '../../custom_widgets/custom_button.dart';
import '../../custom_widgets/custom_textfield.dart';
import '../../utils/app_strings.dart';
import 'controller/auth_controller.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';

class VerifyOtpScreen extends GetView<AuthController> {
  const VerifyOtpScreen({super.key});

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
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(
              "Enter the verification code we just sent on \nyour email address.",
              style: AppStyles.blackTextStyle().copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50.h),
            OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width,
              textFieldAlignment: MainAxisAlignment.center,
              fieldWidth: 66,
              margin: EdgeInsets.only(left: 16),
              otpFieldStyle: OtpFieldStyle(
                backgroundColor: kWhiteShade2Color.withOpacity(0.07),
                  enabledBorderColor: kBlackShade7Color.withOpacity(0.1),
                  borderColor: kBlackShade7Color.withOpacity(0.1),
                  focusBorderColor: kBlackShade7Color.withOpacity(0.1),
                  disabledBorderColor: kBlackShade7Color.withOpacity(0.1),
              ),
              fieldStyle: FieldStyle.box,
              contentPadding: EdgeInsets.symmetric(vertical: 25),
              outlineBorderRadius: 8.r,
              style: const TextStyle(fontSize: 17),
              onChanged: (pin) {

              },
              onCompleted: (pin) async {},
            ),
            SizedBox(height: 102.h),
            CustomButton(
              title: "Verify",
              onTap: () {
                Get.toNamed(kSetNewPassScreenRoute);
              },
            ),
            SizedBox(height: 46.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t  Receive Code? ",
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Resend",
                  style: AppStyles.blackTextStyle().copyWith(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: kPrimaryColor
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
