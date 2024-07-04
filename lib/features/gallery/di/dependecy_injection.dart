import 'package:apod/features/gallery/data/repositories/apod_interface_impl.dart';
import 'package:apod/features/gallery/domain/interfaces/apod_interface.dart';
import 'package:apod/features/gallery/domain/usecases/get_gallery.dart';

import '../../../core/di/injection.dart';
import '../data/datasources/remote_datasources/gallery_datasource.dart';
import '../data/datasources/remote_datasources/gallery_datasource_impl.dart';
import '../presentation/viewmodel/gallery_bloc.dart';

Future<void> initGallery() async {
  getIt.registerLazySingleton(() => GalleryViewModel(getIt()));

  getIt.registerLazySingleton(() => GetGalleryUseCase(repository: getIt()));

  getIt.registerLazySingleton<GalleryClient>(
      () => GalleryClientImpl(apiClient: getIt()));

  getIt.registerLazySingleton<GalleryInterface>(
      () => GalleryInterfaceImpl(galleryClient: getIt()));
}
