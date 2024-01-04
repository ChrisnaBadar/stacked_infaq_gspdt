import 'package:infaq/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:infaq/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:infaq/ui/views/home/home_view.dart';
import 'package:infaq/ui/views/startup/startup_view.dart';
import 'package:infaq/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:infaq/ui/views/main_layout/main_layout_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: MainLayoutView, initial: true, children: [
      CustomRoute(page: StartupView, path: ''),
      CustomRoute(page: HomeView),
    ]),
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
