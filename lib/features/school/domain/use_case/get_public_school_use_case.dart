import 'package:albanoon/features/school/data/models/schools_response_model.dart';
import 'package:albanoon/features/school/domain/repositories/school_repository.dart';

class GetPublicSchoolUseCase {
  final SchoolRepository repository;

  GetPublicSchoolUseCase(this.repository);

  Future<PublicSchoolsResponseModel> call() {
    return repository.getPublicSchools();
  }
}