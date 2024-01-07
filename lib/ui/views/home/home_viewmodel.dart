import 'package:infaq/app/app.dialogs.dart';
import 'package:infaq/app/app.locator.dart';
import 'package:infaq/app/app.router.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/services/http_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _routerService = locator<RouterService>();
  final _httpService = locator<HttpService>();

  void showDonateDialog(
      {required String causeTitle, required String description}) {
    _dialogService.showCustomDialog(
        variant: DialogType.donate,
        title: causeTitle,
        description: 'Donate now to $causeTitle with id $description');
  }

  Future<void> toCauseDetailsView() async {
    await _routerService.navigateToCauseDetailsView(causeId: "test-id");
  }

  Future<FundraisesListModel?> getFundraisesData() async {
    return await _httpService.getFundraisesData();
  }
}
