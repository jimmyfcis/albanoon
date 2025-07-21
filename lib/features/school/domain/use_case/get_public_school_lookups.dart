import 'package:albanoon/features/school/data/models/school_lookups.dart';
import 'package:albanoon/features/school/domain/repositories/school_repository.dart';

class GetPublicSchoolsLookupsUseCase {
  final SchoolRepository repository;

  GetPublicSchoolsLookupsUseCase(this.repository);

  Future<SchoolLookupsResponseModel> call() {
    return repository.getPublicSchoolsLookUps();
  }
}