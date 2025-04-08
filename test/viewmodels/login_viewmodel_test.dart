import 'package:flutter_test/flutter_test.dart';
import 'package:login_demo3x4/app/app.locator.dart';
import 'package:login_demo3x4/app/app.router.dart';
import 'package:login_demo3x4/models/user_model.dart';
import 'package:login_demo3x4/services/authentication_service.dart';
import 'package:login_demo3x4/ui/views/login/login_viewmodel.dart';
import 'package:mockito/mockito.dart';
import '../helpers/test_helpers.dart';

void main() {
  LoginViewModel getModel() => LoginViewModel();

  group('LoginViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('login -', () {
      const testEmail = 'test@example.com';
      const testPassword = 'password123';
      const authErrorMessage = 'Invalid credentials.';

      test('When login is successful, navigates to HomeView', () async {
        final mockAuthService = getAndRegisterAuthenticationService();
        final mockRouterService = getAndRegisterRouterService();
        final model = getModel();

        when(mockAuthService.loginWithEmail(email: testEmail, password: testPassword))
            .thenAnswer((_) async => UserModel(id: 'testUid', email: testEmail));

        await model.login(email: testEmail, password: testPassword);

        verify(mockAuthService.loginWithEmail(email: testEmail, password: testPassword)).called(1);
        verify(mockRouterService.replaceWith(const HomeViewRoute())).called(1);
        expect(model.isBusy, false);
        expect(model.errorMessage, null);
      });

      test('When login fails due to incorrect credentials, sets error message', () async {
        final mockAuthService = getAndRegisterAuthenticationService();
        final mockRouterService = getAndRegisterRouterService();
        final model = getModel();

        when(mockAuthService.loginWithEmail(email: testEmail, password: testPassword))
            .thenThrow(AuthenticationException(message: authErrorMessage));

        await model.login(email: testEmail, password: testPassword);

        verify(mockAuthService.loginWithEmail(email: testEmail, password: testPassword)).called(1);
        verifyNever(mockRouterService.replaceWith(any));
        expect(model.isBusy, false);
        expect(model.errorMessage, authErrorMessage);
      });

      test('When login fails due to an unexpected error, sets generic error message', () async {
        final mockAuthService = getAndRegisterAuthenticationService();
        final mockRouterService = getAndRegisterRouterService();
        final model = getModel();
        const genericErrorMessage = 'An unexpected error occurred';

        when(mockAuthService.loginWithEmail(email: testEmail, password: testPassword))
            .thenThrow(Exception('Something went wrong'));

        await model.login(email: testEmail, password: testPassword);

        verify(mockAuthService.loginWithEmail(email: testEmail, password: testPassword)).called(1);
        verifyNever(mockRouterService.replaceWith(any)); // Ensure navigation doesn't happen
        expect(model.isBusy, false);
        expect(model.errorMessage, genericErrorMessage);
      });

      test('When email or password is empty, sets error message and does not call AuthService', () async {
        final mockAuthService = getAndRegisterAuthenticationService();
        final mockRouterService = getAndRegisterRouterService();
        final model = getModel();
        const emptyFieldError = 'Please enter both email and password';

        await model.login(email: '', password: testPassword);

        verifyNever(mockAuthService.loginWithEmail(email: anyNamed('email'), password: anyNamed('password')));
        verifyNever(mockRouterService.replaceWith(any));
        expect(model.errorMessage, emptyFieldError);

        await model.login(email: testEmail, password: '');

        verifyNever(mockAuthService.loginWithEmail(email: anyNamed('email'), password: anyNamed('password')));
        verifyNever(mockRouterService.replaceWith(any));
        expect(model.errorMessage, emptyFieldError);
      });
    });
  });
}