import 'package:albanoon/core/error/error_handler.dart';
import 'package:albanoon/features/school/domain/use_case/get_single_school_use_case.dart';
import 'package:albanoon/features/school/presentation/managers/single_school_cubit/school_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleSchoolCubit extends Cubit<SingleSchoolState> {
  final GetSinglePublicSchoolUseCase getSinglePublicSchoolUseCase;

  SingleSchoolCubit({required this.getSinglePublicSchoolUseCase}) : super(SingleSchoolInitial());

  Future<void> getPublicSchools({required String id}) async {
    try {
      emit(SingleSchoolLoading());
      final response = await getSinglePublicSchoolUseCase(id: id);
      emit(SingleSchoolLoaded(response));
    } catch (error,stacktrace) {
      final failure = ErrorHandler.handle(error,stacktrace);
      emit(SingleSchoolFailure(failure.message, failure.statusCode ?? 0));
    }
  }
}