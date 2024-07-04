import '../../../core/di/injection.dart';
import '../data/datasources/local_datasources/favourite_datasource.dart';
import '../data/datasources/local_datasources/favourite_datasource_impl.dart';
import '../data/repositories/favourite_interface_impl.dart';
import '../domain/interfaces/favourite_interface.dart';
import '../../apod/domain/usecases/add_favourite.dart';
import '../domain/usecases/get_favourite.dart';
import '../../apod/domain/usecases/is_favourite.dart';
import '../../apod/domain/usecases/remove_favourite.dart';
import '../presentation/viewModel/favourite_bloc.dart';

Future<void> initFavourite() async {
  getIt.registerFactory(
      () => FavouriteViewModel(getIt()));
  getIt.registerLazySingleton(() => GetFavouriteUseCase(repository: getIt()));

  getIt.registerLazySingleton<FavouriteClient>(() => FavouriteClientImpl());

  getIt.registerLazySingleton<FavouriteInterface>(
      () => FavouriteInterfaceImpl(favouriteClient: getIt()));
}
