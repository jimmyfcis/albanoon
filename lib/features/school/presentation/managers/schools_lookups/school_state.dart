import 'package:albanoon/features/school/data/models/school_lookups.dart';

abstract class SchoolsLookupsState {}

class SchoolsLookupsInitial extends SchoolsLookupsState {}

class SchoolsLookupsLoading extends SchoolsLookupsState {}

class SchoolsLookupsLoaded extends SchoolsLookupsState {
  final SchoolLookupsResponseModel schoolLookupsResponseModel;

  SchoolsLookupsLoaded(this.schoolLookupsResponseModel);
}

class SchoolsLookupsFailure extends SchoolsLookupsState {
  final String message;
  final int statusCode;

  SchoolsLookupsFailure(this.message, this.statusCode);
}