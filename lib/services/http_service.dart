import 'package:http/http.dart';
import 'package:infaq/models/fundraise_model.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/models/muslim_articles_model.dart';

class HttpService {
  Future<FundraisesListModel?> getFundraisesData() async {
    final result = await get(
        Uri.parse("https://api.amala-api.online/api/fundraises?populate=*"),
        headers: {'Content-Type': 'application/json', 'Referer': '*'});

    if (result.statusCode == 200) {
      return FundraisesListModel.fromRawJson(result.body);
    } else {
      print(result.reasonPhrase);
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

  Future<MuslimArticlesModel?> getArticlesData() async {
    final result = await get(
        Uri.parse("https://api.amala-api.online/api/articles?populate=*"));

    if (result.statusCode == 200) {
      return MuslimArticlesModel.fromRawJson(result.body);
    } else {
      print(result.reasonPhrase);
      return null;
    }
  }
}
