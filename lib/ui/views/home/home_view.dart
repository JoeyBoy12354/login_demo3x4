import 'package:flutter/material.dart';
import 'package:login_demo3x4/ui/common/app_colors.dart';
import 'package:login_demo3x4/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: model.logout,
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: kcPrimaryColor,
                  size: 80,
                ),
                verticalSpaceMedium,
                const Text(
                  'Welcome!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                verticalSpaceSmall,
                const Text(
                  'You are logged in as:',
                  style: TextStyle(fontSize: 16),
                ),
                verticalSpaceSmall,
                Text(
                  model.userEmail,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                verticalSpaceLarge,
                ElevatedButton(
                  onPressed: model.isBusy ? null : model.logout,
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: model.isBusy
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(kcWhite),
                          ),
                        )
                      : const Text('Logout'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
