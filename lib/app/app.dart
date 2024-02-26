import 'package:infaq/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:infaq/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:infaq/ui/views/home/home_view.dart';
import 'package:infaq/ui/views/unknown/unknown_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:infaq/ui/views/main_layout/main_layout_view.dart';
import 'package:infaq/ui/views/cause_details/cause_details_view.dart';
import 'package:infaq/ui/views/donate_page/donate_page_view.dart';
import 'package:infaq/ui/dialogs/donate/donate_dialog.dart';
import 'package:infaq/services/http_service.dart';
import 'package:infaq/ui/views/routing_test/routing_test_view.dart';
import 'package:infaq/ui/views/privacy_policy/privacy_policy_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    CustomRoute(page: MainLayoutView, initial: true, children: [
      CustomRoute(page: HomeView, path: ''),
      CustomRoute(page: RoutingTestView, path: 'routing-test'),
      CustomRoute(page: PrivacyPolicyView, path: 'kebijakan-privasi'),
      CustomRoute(page: CauseDetailsView, path: 'cause-details/:causeId'),
      CustomRoute(page: DonatePageView, path: 'donate-page/:causeId'),
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
    LazySingleton(classType: HttpService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    StackedDialog(classType: DonateDialog),
// @stacked-dialog
  ],
)
class App {}
