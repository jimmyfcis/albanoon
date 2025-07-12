import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/network/injection_container.dart';
import 'package:albanoon/core/routes/app_routes.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:albanoon/core/widgets/form_fields/custom_text_field.dart';
import 'package:albanoon/features/home/presentation/widgets/school_home_item.dart';
import 'package:albanoon/features/school/data/models/schools_request_model.dart';
import 'package:albanoon/features/school/data/models/schools_response_model.dart';
import 'package:albanoon/features/school/presentation/managers/school_cubit.dart';
import 'package:albanoon/features/school/presentation/managers/school_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
                onTap: () {
                  context.pushNamed(AppRoutes.schoolDetails);
                },
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
              BlocProvider(
                create: (context) {
                  final cubit = sl<SchoolsCubit>();
                  cubit.getPublicSchools(getPublicSchoolsRequestModel: GetPublicSchoolsRequestModel()); // Call the method immediately after creating the cubit
                  return cubit;
                },
                child: BlocBuilder<SchoolsCubit, SchoolsState>(
                  builder: (context, state) {
                    return state is SchoolsLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          ))
                        : state is SchoolsLoaded && state.schoolsResponseModel.result?.schools !=null
                            ?
                        ListView.builder(
                            itemCount: state.schoolsResponseModel.result?.schools?.length??0,
                            itemBuilder:   (context,index){
                              School? school =state.schoolsResponseModel.result?.schools![index];
                             return SchoolHomeItem(
                                city: school?.city??"",
                                disclaimer: 'مدرسه حديثه',
                                name: school?.name??"",
                                image: "assets/png/school_bg.jpg",
                              );
                            }
                            )
                            : const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
