import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/app_images.dart';
import '../utils/app_styles.dart';
import 'custom_button.dart';

Widget applicationContainer(title,VoidCallback onTap,{bool isDownload = false}){
  return Container(
    height: 80.h,
    width: Get.width,
    decoration: BoxDecoration(
        color: kGreyShade3Color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: kGreyShade4Color
        )
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(kPdfImage,height: 32,width: 32,),
          SizedBox(width: 10.w,),
          Text(title,style: AppStyles.blackTextStyle().copyWith(fontSize: 14.sp,fontWeight: FontWeight.w300,color: kGreyShade5Color),),
          isDownload == true ? SizedBox(width: 24.w,) : Spacer(),
          isDownload == true ? Image.asset(kDownloadIcon,height: 32.h,width: 32.w,) :
          CustomButton(title: "View", onTap: onTap,fontWeight: FontWeight.w400,textSize: 14.sp,width: 70.w,height: 32.h,color: kBlackColor.withOpacity(0.1),borderColor: kWhiteColor,borderRadius: 7,textColor: kBlackColor,)
        ],
      ),
    ),
  );
}