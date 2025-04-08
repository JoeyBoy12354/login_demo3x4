import 'package:login_demo3x4/app/app.router.dart';
import 'package:login_demo3x4/app/locator.dart';
import 'package:login_demo3x4/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final _routerService = locator<RouterService>();
  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void setErrorMessage(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    if (email.isEmpty || password.isEmpty) {
      setErrorMessage('Please enter both email and password');
      return;
    }

    try {
      setBusy(true);
      await _authenticationService.loginWithEmail(
        email: email,
        password: password,
      );
      setBusy(false);
      await _routerService.replaceWith(const HomeViewRoute());
    } on AuthenticationException catch (e) {
      setBusy(false);
      setErrorMessage(e.message);
    } catch (e) {
      setBusy(false);
      setErrorMessage('An unexpected error occurred');
    }
  }
}