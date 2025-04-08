
import 'package:login_demo3x4/app/app.router.dart';
import 'package:login_demo3x4/app/locator.dart';
import 'package:login_demo3x4/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 1));
    bool isLoggedIn = await _authenticationService.isUserLoggedIn();

    if (isLoggedIn) {
      await _routerService.replaceWith(const HomeViewRoute());
    } else {
      await _routerService.replaceWith(LoginViewRoute());
    }

  }
}