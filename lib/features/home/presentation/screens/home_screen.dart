import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:albanoon/core/widgets/form_fields/custom_text_field.dart';
import 'package:albanoon/features/home/presentation/widgets/school_home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        actions: [
          SizedBox(width: 16.w),
          SvgPicture.asset(SVGAssets.coloredLogo),
          Spacer(),
          SvgPicture.asset(SVGAssets.notificationDisabled),
          SizedBox(width: 16.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              CustomTextField(
                name: "Search",
                labelText: context.tr.translate("search_school"),
                hasName: false,
                hintText: context.tr.translate("search_school"),
                fillColor: AppTheme.whiteColor,
                hintTextColor: AppTheme.hintColor,
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SvgPicture.asset(
                    SVGAssets.search,
                  ),
                ),
                onTap: () {},
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr.translate('join_schools'),
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: AppTheme.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    context.tr.translate("view_more"),
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppTheme.primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SchoolHomeItem(
                city: "جده",
                disclaimer: 'مدرسه حديثه',
                name: 'مدرسة الملك فيصل',
                image: "assets/png/school_bg.jpg",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
