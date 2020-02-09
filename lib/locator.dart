import 'package:get_it/get_it.dart';
import 'package:muticam_dashboard/core/services/FirestoreApiService.dart';
import 'package:muticam_dashboard/core/viewmodels/CameraStreamsViewModel.dart';

GetIt locator = GetIt.instance;
void setupLocator() {
  locator.registerLazySingleton<FireStoreApiService>(
      () => FireStoreApiService('camerastreams'));
  locator.registerLazySingleton<CameraStreamsViewModel>(
      () => CameraStreamsViewModel());
}
