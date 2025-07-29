import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppStyles {
  static TextStyle blackTextStyle() => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kBlackColor,
  );

  static TextStyle primaryTextStyle() => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kPrimaryColor,
  );

  static TextStyle whiteTextStyle() => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: kWhiteColor,
  );

  static TextStyle greyTextStyle() => GoogleFonts.inter(
    fontSize: 15.sp,
    fontWeight: FontWeight.w400,
    color: kGreyColor,
  );

  static BorderRadius get customBorder16=> BorderRadius.all(
    Radius.circular(16.r),
  );

}


