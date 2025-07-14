import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/svg/svg_assets.dart';
import '../../../../core/theme/theme.dart';

class SchoolSearchItem extends StatefulWidget {

  final String city;
  final String disclaimer;
  final String name;
  final String image;
  const SchoolSearchItem({
    super.key, required this.city, required this.disclaimer, required this.name, required this.image,
  });

  @override
  State<SchoolSearchItem> createState() => _SchoolSearchItemState();
}

class _SchoolSearchItemState extends State<SchoolSearchItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: AppTheme.dividerColor),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120.h,
              width: 108.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    widget.image,
                    height: 120.h,
                    width: 108.w,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppTheme.whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(16.r)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SvgPicture.asset(
                              SVGAssets.favorites,
                              height: 15.h,
                              width: 15.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width:8.w),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppTheme.blackColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height:4.h),
                Text(
                  widget.city,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppTheme.gradientColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
