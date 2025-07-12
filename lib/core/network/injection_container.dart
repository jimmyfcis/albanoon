import 'package:albanoon/core/storage/token_storage.dart';
import 'package:albanoon/features/school/data/data_source/school_data_source.dart';
import 'package:albanoon/features/school/data/repositories/school_repository_impl.dart';
import 'package:albanoon/features/school/domain/repositories/school_repository.dart';
import 'package:albanoon/features/school/domain/use_case/get_public_school_use_case.dart';
import 'package:albanoon/features/school/presentation/managers/school_cubit.dart';
import 'package:get_it/get_it.dart';


final sl = GetIt.instance;

Future<void> init() async {
  // Core
  sl.registerLazySingleton<TokenStorage>(() => TokenStorage());

  // Data sources

  sl.registerLazySingleton<SchoolRemoteDataSource>(
        () => SchoolRemoteDataSourceImpl(),
  );

  // Repositories
  sl.registerLazySingleton<SchoolRepository>(
    () => SchoolRepositoryImpl(
      remoteDataSource: sl<SchoolRemoteDataSource>(),
    ),
  );


  sl.registerLazySingleton<GetPublicSchoolUseCase>(
        () => GetPublicSchoolUseCase(sl<SchoolRepository>()),
  );

  // Presentation (Cubit)
  sl.registerFactory<SchoolsCubit>(
    () => SchoolsCubit(getPublicSchoolUseCase: sl<GetPublicSchoolUseCase>()),
  );
}
