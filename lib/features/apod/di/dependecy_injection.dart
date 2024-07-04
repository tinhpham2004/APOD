import '../../../core/di/injection.dart';
import '../data/datasources/local_datasources/apod_datasource.dart';
import '../data/datasources/local_datasources/apod_datasource_impl.dart';
import '../data/repositories/apod_interface_impl.dart';
import '../domain/interfaces/apod_interface.dart';
import '../domain/usecases/add_favourite.dart';
import '../domain/usecases/is_favourite.dart';
import '../domain/usecases/remove_favourite.dart';
import '../presentation/viewModel/apod_bloc.dart';

Future<void> initApod() async {
  getIt.registerFactory(() => ApodViewModel(getIt(), getIt(), getIt()));
  getIt.registerLazySingleton(() => AddFavouriteUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => RemoveFavouriteUseCase(repository: getIt()));
  getIt.registerLazySingleton(() => IsFavouriteUseCase(repository: getIt()));

  getIt.registerLazySingleton<ApodClient>(() => ApodClientImpl());
  getIt.registerLazySingleton<ApodInterface>(
      () => ApodInterfaceImpl(apodClient: getIt()));
}
