import 'package:albanoon/core/error/error_handler.dart';
import 'package:albanoon/features/school/data/models/schools_request_model.dart';
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
}