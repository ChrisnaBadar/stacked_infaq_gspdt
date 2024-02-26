import 'package:infaq/app/app.locator.dart';
import 'package:infaq/app/app.router.dart';
import 'package:infaq/services/http_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class DonateDialogModel extends FormViewModel {
  final _httpService = locator<HttpService>();
  final _routerService = locator<RouterService>();

  Future<void> toPrivacyPolicyView() async {
    await _routerService.navigateToPrivacyPolicyView();
  }

  Future postDonationData(
      {required String nama,
      required String nominal,
      required String kontak,
      required String pesan,
      required int id}) async {
    return await _httpService.postSingleDonationData(
        nama: nama, nominal: nominal, kontak: kontak, pesan: pesan, id: id);
  }
}
