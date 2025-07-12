import 'package:albanoon/features/school/data/models/schools_request_model.dart';
import 'package:albanoon/features/school/data/models/schools_response_model.dart';

abstract class SchoolRepository {
  Future<PublicSchoolsResponseModel> getPublicSchools({required GetPublicSchoolsRequestModel getPublicSchoolsRequestModel});
}