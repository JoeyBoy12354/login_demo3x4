import 'package:login_demo3x4/app/app.router.dart';
import 'package:login_demo3x4/services/authentication_service.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => AuthenticationService());

  // Register and set up the router service
  locator.registerLazySingleton(() => RouterService());
  locator<RouterService>().setRouter(stackedRouter);  
}