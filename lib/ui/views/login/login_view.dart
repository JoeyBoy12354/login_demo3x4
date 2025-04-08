import 'package:flutter/material.dart';
import 'package:login_demo3x4/ui/common/app_colors.dart';
import 'package:login_demo3x4/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 100,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: kcPrimaryColor,
                ),
              ),
              verticalSpaceMedium,
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              verticalSpaceSmall,
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                ),
                obscureText: true,
              ),
              verticalSpaceMedium,
              if (model.errorMessage != null)
                Text(
                  model.errorMessage!,
                  style: const TextStyle(color: kcError),
                ),
              verticalSpaceSmall,
              ElevatedButton(
                onPressed: model.isBusy
                    ? null
                    : () => model.login(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: model.isBusy
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(kcWhite),
                      ),
                    )
                  : const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}