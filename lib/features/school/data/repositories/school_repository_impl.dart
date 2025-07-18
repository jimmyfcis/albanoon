import 'package:albanoon/features/school/data/data_source/school_data_source.dart';
import 'package:albanoon/features/school/data/models/schools_request_model.dart';
import 'package:albanoon/features/school/data/models/schools_response_model.dart';
import 'package:albanoon/features/school/data/models/single_public_school_response.dart';
import 'package:albanoon/features/school/domain/repositories/school_repository.dart';


class SchoolRepositoryImpl implements SchoolRepository {
  final SchoolRemoteDataSource remoteDataSource;

  SchoolRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PublicSchoolsResponseModel> getPublicSchools({required GetPublicSchoolsRequestModel getPublicSchoolsRequestModel}) async {
    final response = await remoteDataSource.getPublicSchools(getPublicSchoolsRequestModel: getPublicSchoolsRequestModel);
    return response;
  }

  @override
  Future<SinglePublicSchoolResponse> getSinglePublicSchool({required String id})async {
    final response = await remoteDataSource.getSinglePublicSchool(id: id);
    return response;
  }
}