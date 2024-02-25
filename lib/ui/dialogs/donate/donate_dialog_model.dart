import 'package:infaq/app/app.locator.dart';
import 'package:infaq/services/http_service.dart';
import 'package:stacked/stacked.dart';

class DonateDialogModel extends FormViewModel {
  final _httpService = locator<HttpService>();
  bool isLoading = false;

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
