import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/network/injection_container.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:albanoon/features/school/presentation/managers/single_school_cubit/school_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/assets/images/image_assets.dart';
import '../managers/single_school_cubit/school_state.dart';

class SchoolDetailsScreen extends StatefulWidget {
  final String schoolId;

  const SchoolDetailsScreen({super.key, required this.schoolId});

  @override
  State<SchoolDetailsScreen> createState() => _SchoolDetailsScreenState();
}

class _SchoolDetailsScreenState extends State<SchoolDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
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
      body: BlocProvider(
        create: (context) => sl<SingleSchoolCubit>()..getSinglePublicSchools(id: widget.schoolId),
        child: BlocConsumer<SingleSchoolCubit, SingleSchoolState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return state is SingleSchoolLoading
                ? Center(
                    child: CircularProgressIndicator(color: AppTheme.primaryColor),
                  )
                : state is SingleSchoolLoaded
                    ? Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
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
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width / 1.5,
                                    child: Text(
                                      isArabic?state.singlePublicSchoolResponse.result?.nameAr??"":state.singlePublicSchoolResponse.result?.name??"",
                                      maxLines: 2,
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppTheme.whiteColor,
                                      ),
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
                                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 4.0.h, horizontal: 11.w),
                                    child: Row(
                                      children: [
                                        Text(
                                          "1/${state.singlePublicSchoolResponse.result?.images?.length??0}",
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
                              Positioned(
                                left: 16.w,
                                top: 140.h,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppTheme.blackColor,
                                    border: Border.all(color: AppTheme.formBordersColor),
                                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                  ),
                                  child: Image.asset(PNGAssets.schoolLogo),
                                ),
                              ),
                            ],
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Text(
                                      state.singlePublicSchoolResponse.result?.address??"",
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
                                    state.singlePublicSchoolResponse.result?.city??"",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16.sp,
                                      color: AppTheme.blackColor,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Text(
                                    state.singlePublicSchoolResponse.result?.street??"",
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
                                  Text(
                                    isArabic?state.singlePublicSchoolResponse.result?.descriptionAr??"":state.singlePublicSchoolResponse.result?.description??"",
                                   style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16.sp,
                                      color: AppTheme.blackColor,
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Text(
                                    context.tr.translate("vision"),
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                      color: AppTheme.blackColor,
                                    ),
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    isArabic?state.singlePublicSchoolResponse.result?.descriptionAr??"":state.singlePublicSchoolResponse.result?.description??"",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 16.sp,
                                      color: AppTheme.blackColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
