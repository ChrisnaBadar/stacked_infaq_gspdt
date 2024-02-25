import 'package:infaq/app/app.dialogs.dart';
import 'package:infaq/app/app.locator.dart';
import 'package:infaq/models/fundraise_model.dart';
import 'package:infaq/models/articles_model.dart';
import 'package:infaq/services/http_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:share_plus/share_plus.dart';

class CauseDetailsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _httpService = locator<HttpService>();

  void showDonateDialog(
      {required String causeTitle, required String description}) {
    _dialogService.showCustomDialog(
        variant: DialogType.donate,
        title: causeTitle,
        description: description);
  }

  Future<FundraiseModel?> getFundraiseData({required String id}) async {
    return await _httpService.getSingleFundraiseData(id: id);
  }

  Future<ArticlesModel?> getArticlesData() async {
    return await _httpService.getArticlesData();
  }

  Future shareLink({required String id}) async {
    return await Share.share("https://infaq.gspdt.co.id/cause-details/$id");
  }
}
