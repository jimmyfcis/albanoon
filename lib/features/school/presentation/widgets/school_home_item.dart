import 'package:albanoon/features/school/presentation/widgets/school_disclaimer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/assets/svg/svg_assets.dart';
import '../../../../core/theme/theme.dart';

class SchoolHomeItem extends StatefulWidget {

  final String city;
  final String disclaimer;
  final String name;
  final String image;
  const SchoolHomeItem({
    super.key, required this.city, required this.disclaimer, required this.name, required this.image,
  });

  @override
  State<SchoolHomeItem> createState() => _SchoolHomeItemState();
}

class _SchoolHomeItemState extends State<SchoolHomeItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272.h,
      width: 272.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Stack(
        children: [
          Image.asset(
            widget.image,
            height: 272.h,
            width: 272.w,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppTheme.gradientColor.withOpacity(0.15),
                  AppTheme.gradientColor.withOpacity(0.25),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SchoolDisclaimer(text: widget.city),
                        SizedBox(width: 12.w),
                        SchoolDisclaimer(text:widget.disclaimer),
                      ],
                    ),
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
                Text(
                  widget.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
