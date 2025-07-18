import 'package:albanoon/features/school/data/models/single_public_school_response.dart';

abstract class SingleSchoolState {}

class SingleSchoolInitial extends SingleSchoolState {}

class SingleSchoolLoading extends SingleSchoolState {}

class SingleSchoolLoaded extends SingleSchoolState {
  final SinglePublicSchoolResponse singlePublicSchoolResponse;

  SingleSchoolLoaded(this.singlePublicSchoolResponse);
}

class SingleSchoolFailure extends SingleSchoolState {
  final String message;
  final int statusCode;

  SingleSchoolFailure(this.message, this.statusCode);
}