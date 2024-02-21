import 'package:infaq/app/app.dialogs.dart';
import 'package:infaq/app/app.locator.dart';
import 'package:infaq/app/app.router.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/services/http_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> toCauseDetailsView({required String causeId}) async {
    await _routerService.navigateToCauseDetailsView(causeId: causeId);
  }

  Future<FundraisesListModel?> getFundraisesData() async {
    return await _httpService.getFundraisesData();
  }

  Future<void> launchArtcile(String id) async {
    String finalUrl = "https://blog.gspdt.co.id/article-details/$id";
    String maintenanceUrl = "https:/blog.gspdt.co.id/under-maintenance";

    if (await canLaunchUrl(Uri.parse(maintenanceUrl))) {
      await launchUrl(Uri.parse(maintenanceUrl));
    } else {
      throw 'Could not launch $maintenanceUrl';
    }
  }
}
