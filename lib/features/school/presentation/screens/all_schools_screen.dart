import 'package:albanoon/core/assets/svg/svg_assets.dart';
import 'package:albanoon/core/localization/app_extensions.dart';
import 'package:albanoon/core/network/injection_container.dart';
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
import 'dart:async' as dart_async;

import 'package:go_router/go_router.dart';

class AllSchoolsScreen extends StatefulWidget {
  const AllSchoolsScreen({super.key});

  @override
  State<AllSchoolsScreen> createState() => _AllSchoolsScreenState();
}

class _AllSchoolsScreenState extends State<AllSchoolsScreen> {
  final SchoolsCubit _schoolsCubit = sl<SchoolsCubit>();
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _searchController = TextEditingController();
  dart_async.Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _schoolsCubit.getPublicSchools(getPublicSchoolsRequestModel: GetPublicSchoolsRequestModel(pageSize: 10,pageNo: 1));
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
          SvgPicture.asset(SVGAssets.coloredLogo),
          Spacer(),
          SvgPicture.asset(SVGAssets.notificationDisabled,width: 20.w,height: 20.h,),
          SizedBox(width: 24.w),
          InkWell(
              onTap: (){
                context.pop();
              },
              child: SvgPicture.asset(SVGAssets.back,width: 50.w,height: 50.h,)),
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
                    _schoolsCubit.getPublicSchools(getPublicSchoolsRequestModel: GetPublicSchoolsRequestModel(pageSize: 10,pageNo: 1,filter: Filter(freeText: value??"")));
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
                        : state is SchoolsLoaded && state.schoolsResponseModel.result?.schools !=null
                        ?
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                state.schoolsResponseModel.result?.schools?.length??0,
                                    (index){
                                  School? school =state.schoolsResponseModel.result?.schools![index];
                                  return InkWell(
                                    onTap: (){

                                    },
                                    child: SchoolHomeItem(
                                      city: school?.city??"",
                                      disclaimer: 'مدرسه حديثه',
                                      name: school?.name??"",
                                      image: "assets/png/school_bg.jpg",
                                    ),
                                  );
                                }
                            ),
                          ],
                        ),
                      ),
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

_loadMore() {
  _scrollController.addListener(() {
    if (_scrollController.position.atEdge) {
      bool isTop = _scrollController.position.pixels == 0;
      if (!isTop) {
        if (_schoolsCubit.schoolsHaveMore()) {
          _schoolsCubit.getSchoolsLoadMore(_schoolsCubit.getCurrentPageNumber() + 1,_searchController.text);
        }
      }
    }
  });
}
}
