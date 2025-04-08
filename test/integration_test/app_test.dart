import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_demo3x4/app/locator.dart';
import 'package:login_demo3x4/services/authentication_service.dart';
import 'package:login_demo3x4/ui/views/login/login_view.dart';
import 'package:login_demo3x4/ui/views/home/home_view.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';
import '../helpers/test_helpers.mocks.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Login Flow Widget Tests', () {
    late MockAuthenticationService mockAuthService;

    setUp(() async {
      // Register mocked services
      registerServices();
      mockAuthService = locator<AuthenticationService>() as MockAuthenticationService;
    });

    tearDown(() async {
      await locator.reset();
    });

    testWidgets('Successful login calls the correct authentication service', 
        (WidgetTester tester) async {

      when(mockAuthService.loginWithEmail(
        email: 'test@example.com',
        password: 'password123'
      )).thenAnswer((_) async => createMockUserModel());
      
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );
      
      // Find widgets
      final emailField = find.byType(TextField).at(0);
      final passwordField = find.byType(TextField).at(1);
      final loginButton = find.byType(ElevatedButton);

      // Enter login credentials
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.pump();

      // Tap the login button
      await tester.tap(loginButton);
      await tester.pump();

      // Wait for any async operations to complete
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Verify the authentication service was called correctly
      verify(mockAuthService.loginWithEmail(
        email: 'test@example.com',
        password: 'password123'
      )).called(1);
    });

    testWidgets('Failed login shows error message', (WidgetTester tester) async {
      when(mockAuthService.loginWithEmail(
        email: 'test@example.com',
        password: 'wrongpassword'
      )).thenThrow(AuthenticationException(message: 'Invalid credentials.'));

      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );

      // Find widgets
      final emailField = find.byType(TextField).at(0);
      final passwordField = find.byType(TextField).at(1);
      final loginButton = find.byType(ElevatedButton);

      // Enter login credentials
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'wrongpassword');
      await tester.pump();

      // Tap the login button
      await tester.tap(loginButton);
      await tester.pump();
      
      // Wait for error to appear
      await tester.pumpAndSettle(const Duration(seconds: 5));

      // Verify the error message is displayed
      expect(find.textContaining('Invalid credentials'), findsOneWidget);
    });
    
    testWidgets('Home view displays logout button that calls logout service', 
        (WidgetTester tester) async {
      when(mockAuthService.currentUser).thenReturn(createMockUserModel());
      when(mockAuthService.logout()).thenAnswer((_) async {});
      
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeView(),
        ),
      );
      
      // Find the logout button
      final logoutButton = find.byType(ElevatedButton);
      expect(logoutButton, findsOneWidget);
      
      // Tap logout
      await tester.tap(logoutButton);
      await tester.pump();
      await tester.pumpAndSettle(const Duration(seconds: 5));
      
      // Verify logout was called
      verify(mockAuthService.logout()).called(1);
    });
  });
}