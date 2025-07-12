import 'package:albanoon/features/school/data/models/schools_response_model.dart';

abstract class SchoolsState {}

class SchoolsInitial extends SchoolsState {}

class SchoolsLoading extends SchoolsState {}

class SchoolsLoaded extends SchoolsState {
  final PublicSchoolsResponseModel schoolsResponseModel;

  SchoolsLoaded(this.schoolsResponseModel);
}

class SchoolsFailure extends SchoolsState {
  final String message;
  final int statusCode;

  SchoolsFailure(this.message, this.statusCode);
}