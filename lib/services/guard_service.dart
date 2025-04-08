import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../services/authentication_service.dart';

// This guard checks if the user is logged in before allowing access to certain routes
class AuthGuard extends StackedRouteGuard {
  final _navigationService = locator<RouterService>();
  final _authenticationService = locator<AuthenticationService>();

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (await _authenticationService.isUserLoggedIn()) {
      resolver.next(true);
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}