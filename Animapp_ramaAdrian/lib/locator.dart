import 'package:animapp/router.dart/navigation_service.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
