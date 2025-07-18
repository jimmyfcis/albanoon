import 'package:albanoon/features/school/data/models/single_public_school_response.dart';
import 'package:albanoon/features/school/domain/repositories/school_repository.dart';

class GetSinglePublicSchoolUseCase {
  final SchoolRepository repository;

  GetSinglePublicSchoolUseCase(this.repository);

  Future<SinglePublicSchoolResponse> call({required String id}) {
    return repository.getSinglePublicSchool(id: id);
  }
}