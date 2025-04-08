import 'package:login_demo3x4/services/guard_service.dart';
import 'package:login_demo3x4/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:login_demo3x4/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:login_demo3x4/ui/views/home/home_view.dart';
import 'package:login_demo3x4/ui/views/login/login_view.dart';
import 'package:login_demo3x4/ui/views/startup/startup_view.dart';
import 'package:login_demo3x4/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: StartupView, initial: true),
    CustomRoute(page: LoginView),
    CustomRoute(page: HomeView, guards: [AuthGuard]),
    // @stacked-route

    CustomRoute(page: UnknownView, path: '/404'),

    /// When none of the above routes match, redirect to UnknownView
    RedirectRoute(path: '*', redirectTo: '/404'),
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: RouterService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
