import 'package:albanoon/core/assets/images/image_assets.dart';
import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/models/lookup.dart';
import 'package:albanoon/core/models/school_model.dart';
import 'package:albanoon/core/network/injection_container.dart';
import 'package:albanoon/core/theme/theme.dart';
import 'package:albanoon/core/widgets/form_fields/custom_text_field.dart';
import 'package:albanoon/features/school/data/models/schools_request_model.dart';
import 'package:albanoon/features/school/presentation/managers/school_cubit.dart';
import 'package:albanoon/features/school/presentation/managers/school_state.dart';
import 'package:albanoon/features/school/presentation/managers/schools_lookups/school_cubit.dart';
import 'package:albanoon/features/school/presentation/managers/schools_lookups/school_state.dart';
import 'package:albanoon/features/school/presentation/widgets/school_search_item.dart';
import 'package:albanoon/features/school/presentation/widgets/schools_filter_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async' as dart_async;

import 'package:go_router/go_router.dart';

class AllSchoolsScreen extends StatefulWidget {
  const AllSchoolsScreen({super.key});

  @override
  State<AllSchoolsScreen> createState() => _AllSchoolsScreenState();
}

class _AllSchoolsScreenState extends State<AllSchoolsScreen> {
  final SchoolsCubit _schoolsCubit = sl<SchoolsCubit>();
  final SchoolsLookupsCubit _schoolsLookupsCubit = sl<SchoolsLookupsCubit>();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  dart_async.Timer? _debounce;
  Lookup? provinceValue;

  @override
  void initState() {
    super.initState();
    _schoolsLookupsCubit.getPublicSchoolsLookups();
    _schoolsCubit.getPublicSchools(getPublicSchoolsRequestModel: GetPublicSchoolsRequestModel(pageSize: 10, pageNo: 1));
    _loadMore();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        leading: SizedBox.shrink(),
        actions: [
          SizedBox(width: 16.w),
          SvgPicture.asset(SVGAssets.primaryLogo),
          Spacer(),
          SvgPicture.asset(
            SVGAssets.notificationDisabled,
            width: 20.w,
            height: 20.h,
          ),
          SizedBox(width: 24.w),
          InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                SVGAssets.back,
                width: 50.w,
                height: 50.h,
              )),
          SizedBox(width: 16.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      name: "Search",
                      radius: 100.r,
                      controller: _searchController,
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
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = dart_async.Timer(const Duration(seconds: 1), () {
                          _schoolsCubit.getPublicSchools(
                              getPublicSchoolsRequestModel: GetPublicSchoolsRequestModel(
                                  pageSize: 10,
                                  pageNo: 1,
                                  filter: Filter(freeText: value ?? "", provinceId: provinceValue?.id ?? "")));
                          _loadMore();
                        });
                      },
                      prefixIcon: IconButton(
                        icon: Icon(Icons.clear, size: 20.w, color: AppTheme.hintColor),
                        onPressed: () {
                          _searchController.clear();
                          // _searchDoctorCubit?.searchDoctors('');
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  BlocProvider.value(
                    value: _schoolsLookupsCubit,
                    child: BlocBuilder<SchoolsLookupsCubit, SchoolsLookupsState>(
                      builder: (context, state) {
                        return state is SchoolsLookupsLoaded
                            ? InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    backgroundColor: AppTheme.whiteColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
                                    ),
                                    builder: (context) {
                                      return SchoolsFilterBottomSheet(
                                        provinces: state.schoolLookupsResponseModel.result?.provinces ?? [],
                                        // make sure this is fetched in Cubit
                                        onSelected: (province) {
                                          setState(() {
                                            provinceValue = province;
                                          });
                                          _schoolsCubit.getPublicSchools(
                                            getPublicSchoolsRequestModel: GetPublicSchoolsRequestModel(
                                              pageSize: 10,
                                              pageNo: 1,
                                              filter: Filter(
                                                freeText: _searchController.text,
                                                provinceId: province.id ?? "",
                                              ),
                                            ),
                                          );
                                          _loadMore();
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 40.w,
                                  decoration: BoxDecoration(
                                    color: AppTheme.filterColor,
                                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SvgPicture.asset(SVGAssets.filter),
                                  ),
                                ),
                              )
                            : SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              BlocProvider.value(
                value: _schoolsCubit,
                child: BlocBuilder<SchoolsCubit, SchoolsState>(
                  builder: (context, state) {
                    return state is SchoolsLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: AppTheme.primaryColor,
                          ))
                        : state is SchoolsLoaded && state.schoolsResponseModel.result?.schools != null
                            ? Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      ...List.generate(state.schoolsResponseModel.result?.schools?.length ?? 0,
                                          (index) {
                                        School? school = state.schoolsResponseModel.result?.schools![index];
                                        return SchoolSearchItem(
                                          id: school?.id ?? "",
                                          city: school?.city ?? "",
                                          disclaimer: 'مدرسه حديثه',
                                          name: school?.name ?? "",
                                          image: PNGAssets.school,
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                              )
                            : Expanded(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        SVGAssets.noSchool,
                                        height: 88.h,
                                        width: 88.w,
                                      ),
                                      SizedBox(height: 20.h),
                                      Text(
                                        context.tr.translate("no_school"),
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: AppTheme.primaryTextColor,
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      SizedBox(height: 16.h),
                                      Text(
                                        context.tr.translate("no_school_desc"),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: AppTheme.blackColor,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _loadMore() {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (!isTop) {
          if (_schoolsCubit.schoolsHaveMore()) {
            _schoolsCubit.getSchoolsLoadMore(_schoolsCubit.getCurrentPageNumber() + 1, _searchController.text);
          }
        }
      }
    });
  }
}
