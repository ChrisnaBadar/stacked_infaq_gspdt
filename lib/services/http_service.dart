import 'dart:convert';
import 'package:http/http.dart';
import 'package:infaq/models/fundraise_model.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/models/muslim_articles_model.dart';
import 'package:infaq/ui/common/app_values.dart';

bool testMode = true;

class HttpService {
  String apiLink = testMode ? test_api : production_api;
  Future<FundraisesListModel?> getFundraisesData() async {
    final result = await get(
        Uri.parse("https://api.amala-api.online/api/fundraises?populate=*"),
        headers: {'Content-Type': 'application/json', 'Referer': '*'});

    if (result.statusCode == 200) {
      return FundraisesListModel.fromRawJson(result.body);
    } else {
      print("result: ${result.reasonPhrase}");
      return null;
    }
  }

  Future<FundraiseModel?> getSingleFundraiseData({required String id}) async {
    final result = await get(
        Uri.parse("https://api.amala-api.online/api/fundraises/$id?populate=*"),
        headers: {'Content-Type': 'application/json', 'Referer': '*'});

    if (result.statusCode == 200) {
      return FundraiseModel.fromRawJson(result.body);
    } else {
      print('myresult: ${result.reasonPhrase}');
      return null;
    }
  }

  //POST DONATION
  Future postSingleDonationData(
      {required String nama,
      required String nominal,
      required String kontak,
      required String pesan,
      required int id}) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        Request('POST', Uri.parse('http://localhost:1337/api/donations'));
    request.body = json.encode({
      "data": {
        "nama": nama,
        "nominal": nominal,
        "kontak": kontak,
        "pesan": pesan,
        "donationStatus": "Diproses",
        "fundraise": 12
      }
    });
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<MuslimArticlesModel?> getArticlesData() async {
    final result = await get(Uri.parse("$apiLink/api/articles?populate=*"));

    if (result.statusCode == 200) {
      return MuslimArticlesModel.fromRawJson(result.body);
    } else {
      print(result.reasonPhrase);
      return null;
    }
  }
}
