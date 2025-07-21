import 'package:albanoon/core/network/api_endpoints.dart';
import 'package:albanoon/core/network/dio_client.dart';
import 'package:albanoon/features/school/data/models/school_lookups.dart';
import 'package:albanoon/features/school/data/models/schools_request_model.dart';
import 'package:albanoon/features/school/data/models/schools_response_model.dart';
import 'package:albanoon/features/school/data/models/single_public_school_response.dart';
import 'package:dio/dio.dart';

abstract class SchoolRemoteDataSource {
  Future<PublicSchoolsResponseModel> getPublicSchools(
      {required GetPublicSchoolsRequestModel getPublicSchoolsRequestModel});

  Future<SchoolLookupsResponseModel> getPublicSchoolsLookUps();

  Future<SinglePublicSchoolResponse> getSinglePublicSchool({required String id});
}

class SchoolRemoteDataSourceImpl implements SchoolRemoteDataSource {
  final Dio dio = DioClient().dio;

  @override
  Future<PublicSchoolsResponseModel> getPublicSchools(
      {required GetPublicSchoolsRequestModel getPublicSchoolsRequestModel}) async {
    final response = await dio.post(
      ApiEndpoints.getPublicSchools,
      data: getPublicSchoolsRequestModel.toJson(),
    );
    return PublicSchoolsResponseModel.fromJson(response.data);
  }

  @override
  Future<SinglePublicSchoolResponse> getSinglePublicSchool({required String id}) async {
    final response = await dio.get(
      "${ApiEndpoints.getSinglePublicSchool}/$id",
    );
    return SinglePublicSchoolResponse.fromJson(response.data);
  }

  @override
  Future<SchoolLookupsResponseModel> getPublicSchoolsLookUps() async {
    final response = await dio.get(ApiEndpoints.getPublicSchools);
    return SchoolLookupsResponseModel.fromJson(response.data);
  }
}
