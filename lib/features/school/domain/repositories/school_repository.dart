import 'package:albanoon/features/school/data/models/schools_request_model.dart';
import 'package:albanoon/features/school/data/models/schools_response_model.dart';
import 'package:albanoon/features/school/data/models/single_public_school_response.dart';

abstract class SchoolRepository {
  Future<PublicSchoolsResponseModel> getPublicSchools({required GetPublicSchoolsRequestModel getPublicSchoolsRequestModel});
  Future<SinglePublicSchoolResponse> getSinglePublicSchool({required String id });
}