import 'package:albanoon/core/error/error_handler.dart';
import 'package:albanoon/features/school/domain/use_case/get_public_school_lookups.dart';
import 'package:albanoon/features/school/presentation/managers/schools_lookups/school_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchoolsLookupsCubit extends Cubit<SchoolsLookupsState> {
  final GetPublicSchoolsLookupsUseCase getPublicSchoolsLookupsUseCase;

  SchoolsLookupsCubit({required this.getPublicSchoolsLookupsUseCase}) : super(SchoolsLookupsInitial());

  Future<void> getSinglePublicSchools() async {
    try {
      emit(SchoolsLookupsLoading());
      final response = await getPublicSchoolsLookupsUseCase();
      emit(SchoolsLookupsLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(SchoolsLookupsFailure(failure.message, failure.statusCode ?? 0));
    }
  }
}