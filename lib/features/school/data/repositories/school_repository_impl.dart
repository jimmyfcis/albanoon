import 'package:albanoon/features/school/data/data_source/school_data_source.dart';
import 'package:albanoon/features/school/data/models/schools_response_model.dart';
import 'package:albanoon/features/school/domain/repositories/school_repository.dart';


class SchoolRepositoryImpl implements SchoolRepository {
  final SchoolRemoteDataSource remoteDataSource;

  SchoolRepositoryImpl({required this.remoteDataSource});

  @override
  Future<PublicSchoolsResponseModel> getPublicSchools() async {
    final response = await remoteDataSource.getPublicSchools();
    return response;
  }
}