import 'package:apod/features/gallery/data/repositories/apod_interface_impl.dart';
import 'package:apod/features/gallery/domain/interfaces/apod_interface.dart';
import 'package:apod/features/gallery/domain/usecases/get_gallery.dart';

import '../../../core/di/injection.dart';
import '../data/datasources/apod_datasource.dart';
import '../data/datasources/apod_datasource_impl.dart';
import '../presentation/viewmodel/apod_bloc.dart';

Future<void> initGallery() async {
  getIt.registerLazySingleton(() => ApodViewModel(getIt()));

  getIt.registerLazySingleton(() => GetGalleryUseCase(repository: getIt()));

  getIt.registerLazySingleton<ApodClient>(
      () => ApodClientImpl(apiClient: getIt()));

  getIt.registerLazySingleton<ApodInterface>(
      () => ApodInterfaceImpl(apodClient: getIt()));
}
