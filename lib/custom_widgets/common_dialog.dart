import 'package:docuease_admin/custom_widgets/custom_dialog.dart';
import 'package:docuease_admin/utils/app_colors.dart';
import 'package:docuease_admin/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CommonDialog extends StatelessWidget {
  double? width;
  Widget widget;
  String title;
  bool showTitle;
  CommonDialog({super.key,this.width = 425,required this.widget,required this.title, this.showTitle = false});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
        widget: SizedBox(
          width: width,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 34.h,horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: showTitle ? MainAxisAlignment.end :MainAxisAlignment.spaceBetween,
                  children: [
                    if(!showTitle)
                    Text(title,style: AppStyles.blackTextStyle().copyWith(fontSize: 16.sp,fontWeight: FontWeight.w700),),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: (){
                          Get.back();
                        },
                        child: Container(
                          height: 39,
                          width: 39,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: kWhiteColor,
                            boxShadow: [
                              BoxShadow(
                                color: kWhiteShade2Color.withOpacity(0.25),
                                offset: Offset(0, 4),
                                blurRadius: 22,
                                spreadRadius: 0,
                              )
                            ]
                          ),
                          child: Center(child: Icon(Icons.close,color: kBlackColor,size: 24,)),
                        ),
                      ),
                    )
                  ],
                ),
                widget
              ],
            ),
          ),
        )
    );
  }
}
