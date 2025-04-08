import 'package:login_demo3x4/app/app.router.dart';
import 'package:login_demo3x4/app/locator.dart';
import 'package:login_demo3x4/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final RouterService _routerService = locator<RouterService>();
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();

  String get userEmail =>
      _authenticationService.currentUser?.email ?? 'Unknown User';

  Future<void> logout() async {
    setBusy(true);
    await _authenticationService.logout();
    setBusy(false);
    _routerService.replaceWithLoginView();
  }
}