import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_strings.dart';
import '../../utils/app_styles.dart';
import 'controller/sidemenu_controller.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}


class _SideMenuState extends State<SideMenu> {
  final menuController = Get.put(SideMenuController());

  @override
  Widget build(BuildContext context) {
    // bool isTablet = ResponsiveBreakpoints.of(context).largerThan(TABLET);
    double width = MediaQuery.of(context).size.width;

    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0)
      ),
      backgroundColor: kBlackColor,
      width: 260.w,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 178,
              child: DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.only(left: 7.0),
                  child: Center(
                    child: SizedBox(
                        height: 97.h,
                        width: 120.w,
                        child: Center(
                          child: Image.asset(
                            kLogoImage,
                            fit: BoxFit.fitWidth,
                          ),)
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            menuController.onItemTapped(0);
                            Get.toNamed(kDashboardScreenRoute);
                          },
                          child: Container(
                              height: 49,
                              width: 165,
                              decoration: BoxDecoration(
                                color: menuController.selectedIndex.value == 0 ? kPrimaryColor : kBlackColor,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      kDashboardIcon,
                                      height: 20,
                                      width: 20,
                                        color: menuController.selectedIndex.value == 0 ? kBlackColor : kWhiteColor,
                                      ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Dashboard",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: menuController.selectedIndex.value == 0
                                              ? kBlackColor : kWhiteColor,
                                          fontSize: 16,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                    Obx(() {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            menuController.onItemTapped(1);
                            Get.toNamed(kApplicationScreenRoute);
                          },
                          child: Container(
                              height: 49,
                              width: 165,
                              decoration: BoxDecoration(
                                  color: menuController.selectedIndex.value == 1 ? kPrimaryColor : kBlackColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      kApplicationIcon,
                                      height: 20,
                                      width: 20,
                                      color: menuController.selectedIndex.value == 1 ? kBlackColor : kWhiteColor,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Applications",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: menuController.selectedIndex.value == 1
                                              ? kBlackColor : kWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                    Obx(() {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            menuController.onItemTapped(2);
                            Get.toNamed(kClientsScreenRoute);
                          },
                          child: Container(
                              height: 49,
                              width: 165,
                              decoration: BoxDecoration(
                                  color: menuController.selectedIndex.value == 2 ? kPrimaryColor : kBlackColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      kDoubleUserIcon,
                                      height: 20,
                                      width: 20,
                                      color: menuController.selectedIndex.value == 2 ? kBlackColor : kWhiteColor,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Clients",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: menuController.selectedIndex.value == 2
                                              ? kBlackColor : kWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                    Obx(() {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            menuController.onItemTapped(3);
                            Get.toNamed(kDocumentScreenRoute);
                          },
                          child: Container(
                              height: 49,
                              width: 165,
                              decoration: BoxDecoration(
                                  color: menuController.selectedIndex.value == 3 ? kPrimaryColor : kBlackColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      kDocIcon,
                                      height: 20,
                                      width: 20,
                                      color: menuController.selectedIndex.value == 3 ? kBlackColor : kWhiteColor,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Documents",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: menuController.selectedIndex.value == 3
                                              ? kBlackColor : kWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                    Obx(() {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            menuController.onItemTapped(4);
                            Get.toNamed(kPaymentScreenRoute);
                          },
                          child: Container(
                              height: 49,
                              width: 165,
                              decoration: BoxDecoration(
                                  color: menuController.selectedIndex.value == 4 ? kPrimaryColor : kBlackColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      kPaymentIcon,
                                      height: 20,
                                      width: 20,
                                      color: menuController.selectedIndex.value == 4 ? kBlackColor : kWhiteColor,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Payments",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: menuController.selectedIndex.value == 4
                                              ? kBlackColor : kWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                    Obx(() {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            menuController.onItemTapped(5);
                            Get.toNamed(kChatScreenRoute);
                          },
                          child: Container(
                              height: 49,
                              width: 165,
                              decoration: BoxDecoration(
                                  color: menuController.selectedIndex.value == 5 ? kPrimaryColor : kBlackColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      kChatIcon,
                                      height: 20,
                                      width: 20,
                                      color: menuController.selectedIndex.value == 5 ? kBlackColor : kWhiteColor,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Chat",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: menuController.selectedIndex.value == 5
                                              ? kBlackColor : kWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }),
                    const SizedBox(height: 16,),
                    Obx(() {
                      return MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            menuController.onItemTapped(6);
                            Get.toNamed(kMeetingScreenRoute);
                          },
                          child: Container(
                              height: 49,
                              width: 165,
                              decoration: BoxDecoration(
                                  color: menuController.selectedIndex.value == 6 ? kPrimaryColor : kBlackColor,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      kChatIcon,
                                      height: 20,
                                      width: 20,
                                      color: menuController.selectedIndex.value == 6 ? kBlackColor : kWhiteColor,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                                    Text(
                                      "Meetings",
                                      style: AppStyles.blackTextStyle().copyWith(
                                          color: menuController.selectedIndex.value == 6
                                              ? kBlackColor : kWhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ],
                                ),
                              )
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0,right: 15),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(kAuthScreenRoute);
                  },
                  child: Container(
                      height: 49,
                      width: 165,
                      decoration: BoxDecoration(
                          color: kBlackColor,
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only( left: 24),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.logout_outlined,size: 20,color: kWhiteColor,),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                            Text(
                              "Logout",
                              style: AppStyles.blackTextStyle().copyWith(
                                  color: kWhiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              )
            ),

          ],
        ),
      ),
    );
  }
}