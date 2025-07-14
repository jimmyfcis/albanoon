import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SchoolDetailsScreen extends StatefulWidget {
  const SchoolDetailsScreen({super.key});

  @override
  State<SchoolDetailsScreen> createState() => _SchoolDetailsScreenState();
}

class _SchoolDetailsScreenState extends State<SchoolDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w),
            child: InkWell(
                onTap: (){
                  context.pop();
                },
                child: SvgPicture.asset(SVGAssets.back,width: 40.w,height: 40.h,)),
          ),
        ],
        leadingWidth: 100.w,
        leading:  Row(
          children: [
            SizedBox(width: 8.w),
            SvgPicture.asset(SVGAssets.share,width: 40.w,height: 40.h,),
            SizedBox(width: 16.w),
            SvgPicture.asset(SVGAssets.favorites,width: 20.w,height: 20.h,),
          ],
        ),
        title: Text(
          context.tr.translate("school_details"),
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppTheme.primaryTextColor,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}
