import 'package:infaq/app/app.locator.dart';
import 'package:infaq/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MenuOverlayViewModel extends BaseViewModel {
  // final log = getLogger('MenuButtonViewModel');
  // final _userService = locator<UserService>();
  final _routerService = locator<RouterService>();

  Future<void> toHome() async {
    await _routerService.navigateToHomeView();
  }

  Future<void> toProfile() async {
    // await _routerService.navigateToProfileView();
  }

  Future<void> toPortofolio() async {
    // await _routerService.navigateToPortfolioView();
  }
}
