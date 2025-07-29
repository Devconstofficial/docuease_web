import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomDialog extends StatefulWidget {
  Widget widget;
  double intentPadding;
  CustomDialog({super.key,
    required this.widget,
    this.intentPadding = 29,
  });

  @override
  CustomDialogState createState() => CustomDialogState();
}

class CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: widget.intentPadding),
      backgroundColor: kWhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: widget.widget,
    );
  }
}
