import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/assets/images/image_assets.dart';

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
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  SVGAssets.back,
                  width: 40.w,
                  height: 40.h,
                )),
          ),
        ],
        leadingWidth: 100.w,
        leading: Row(
          children: [
            SizedBox(width: 8.w),
            SvgPicture.asset(
              SVGAssets.share,
              width: 40.w,
              height: 40.h,
            ),
            SizedBox(width: 16.w),
            SvgPicture.asset(
              SVGAssets.favorites,
              width: 20.w,
              height: 20.h,
            ),
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
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(PNGAssets.school),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 180.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppTheme.blackColor.withOpacity(0.25),
                      AppTheme.blackColor.withOpacity(0.35),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width/1.5,
                  child: Text(
                    "مدرسة الملك فهد الجديدة مشتركة King Fahd New School",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppTheme.whiteColor,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 16.h,
                left: 16.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.whiteColor,
                    borderRadius: BorderRadius.all( Radius.circular(16.r)),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 4.0.h,horizontal: 11.w),
                    child: Row(
                      children: [
                        Text(
                          "1/20",
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            color: AppTheme.blackColor,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset(SVGAssets.schoolImages),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 16.w,
            top: 140.h,
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.blackColor,
                border: Border.all(color: AppTheme.formBordersColor),
                borderRadius: BorderRadius.all( Radius.circular(8.r)),
              ),
              child:Image.asset(PNGAssets.schoolLogo),
            ),
          ),
          Positioned(
            top: 220.h,
            right: 12.w,
            left: 16.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width:MediaQuery.of(context).size.width/2,
                  child: Text(
                    "9300 شارع الحمرا جدة , جدة , المملكة العربية السعودية",
                    maxLines: 3,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppTheme.blackColor,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "admission@kingfahd.com",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                    color: AppTheme.blackColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "+965 551231254",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 16.sp,
                    color: AppTheme.blackColor,
                  ),
                ),
                SizedBox(height: 20.h),
                Divider(color: AppTheme.formBordersColor),
                SizedBox(height: 20.h),
                Text(
                  context.tr.translate("about_school"),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppTheme.blackColor,
                  ),
                ),
                SizedBox(height: 12.h),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "مدرسة الأفق الثانوية هي واحدة من المدارس الرائدة في المملكة العربية السعودية، تقع في مدينة الرياض. تأسست المدرسة في عام 1995 بهدف توفير بيئة تعليمية متميزة للطلاب، حيث تقدم برامج تعليمية شاملة تغطي جميع المراحل الدراسية من المرحلة الابتدائية إلى الثانوية. تهتم المدرسة بتطوير مهارات الطلاب العلمية والفكرية والاجتماعية،   مع التركيز على تحقيق التفوق الأكاديمي وتعزيز القيم الإنسانية.",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppTheme.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "مدرسة الأفق الثانوية هي واحدة من المدارس الرائدة في المملكة العربية السعودية، تقع في مدينة الرياض. تأسست المدرسة في عام 1995 بهدف توفير بيئة تعليمية متميزة للطلاب، حيث تقدم برامج تعليمية شاملة تغطي جميع المراحل الدراسية من المرحلة الابتدائية إلى الثانوية. تهتم المدرسة بتطوير مهارات الطلاب العلمية والفكرية والاجتماعية،   مع التركيز على تحقيق التفوق الأكاديمي وتعزيز القيم الإنسانية.",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppTheme.blackColor,
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    "مدرسة الأفق الثانوية هي واحدة من المدارس الرائدة في المملكة العربية السعودية، تقع في مدينة الرياض. تأسست المدرسة في عام 1995 بهدف توفير بيئة تعليمية متميزة للطلاب، حيث تقدم برامج تعليمية شاملة تغطي جميع المراحل الدراسية من المرحلة الابتدائية إلى الثانوية. تهتم المدرسة بتطوير مهارات الطلاب العلمية والفكرية والاجتماعية،   مع التركيز على تحقيق التفوق الأكاديمي وتعزيز القيم الإنسانية.",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16.sp,
                      color: AppTheme.blackColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
