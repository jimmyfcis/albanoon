import 'package:albanoon/core/error/error_handler.dart';
import 'package:albanoon/features/school/data/models/schools_request_model.dart';
import 'package:albanoon/features/school/data/models/schools_response_model.dart';
import 'package:albanoon/features/school/domain/use_case/get_public_school_use_case.dart';
import 'package:albanoon/features/school/presentation/managers/school_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolsCubit extends Cubit<SchoolsState> {
  final GetPublicSchoolUseCase getPublicSchoolUseCase;

  SchoolsCubit({required this.getPublicSchoolUseCase}) : super(SchoolsInitial());

  Future<void> getPublicSchools({required GetPublicSchoolsRequestModel getPublicSchoolsRequestModel}) async {
    try {
      emit(SchoolsLoading());
      final response = await getPublicSchoolUseCase(getPublicSchoolsRequestModel: getPublicSchoolsRequestModel);
      emit(SchoolsLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(SchoolsFailure(failure.message, failure.statusCode ?? 0));
    }
  }
  bool schoolsHaveMore() {
    final SchoolsLoaded currState = state as SchoolsLoaded;
    return currState.schoolsResponseModel.result!.schools!.length < currState.schoolsResponseModel.result!.listMetadata!.totalCount!;
  }

  int getCurrentPageNumber() {
    final SchoolsLoaded currState = state as SchoolsLoaded;
    return currState.schoolsResponseModel.result!.listMetadata!.currentPage!;
  }
  Future<void> getSchoolsLoadMore(int pageNumber,String freeText) async {
    final SchoolsLoaded currState = state as SchoolsLoaded;
    emit(SchoolsLoaded( currState.schoolsResponseModel));

    PublicSchoolsResponseModel schoolsResponseModel = await getPublicSchoolUseCase(getPublicSchoolsRequestModel: GetPublicSchoolsRequestModel(pageNo: 1,pageSize: 6,filter: Filter(freeText:freeText )));

    if (schoolsResponseModel.result!.schools!=null &&schoolsResponseModel.result!.schools!.isNotEmpty)
    {
      schoolsResponseModel.result!.schools!.insertAll(0, currState.schoolsResponseModel.result!.schools??[]);
      emit(SchoolsLoaded( schoolsResponseModel));
    }
    else{
      emit(SchoolsFailure( "No Schools",404));
    }
  }
}