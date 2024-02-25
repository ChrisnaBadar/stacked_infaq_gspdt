import 'package:infaq/app/app.dialogs.dart';
import 'package:infaq/app/app.locator.dart';
import 'package:infaq/app/app.router.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/models/articles_model.dart';
import 'package:infaq/services/http_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _routerService = locator<RouterService>();
  final _httpService = locator<HttpService>();

  void showDonateDialog(
      {required int id,
      required String causeTitle,
      required String description}) {
    _dialogService.showCustomDialog(
        variant: DialogType.donate,
        title: causeTitle,
        data: id,
        description: 'Donate now to $causeTitle with id $description');
  }

  Future<void> toCauseDetailsView({required String causeId}) async {
    await _routerService.navigateToCauseDetailsView(causeId: causeId);
  }

  Future<FundraisesListModel?> getFundraisesData() async {
    return await _httpService.getFundraisesData();
  }

  Future<ArticlesModel?> getArticlesData() async {
    return await _httpService.getArticlesData();
  }
}
