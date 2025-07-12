
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/theme.dart';
class SchoolDisclaimer extends StatelessWidget {
  final String text;
  const SchoolDisclaimer({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w,vertical: 5.h),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            color: AppTheme.textColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}