
import 'dart:convert';
import 'package:covid_19_tracker/models/corona_news.dart';
import 'package:http/http.dart';

class CoronaNewsDataService {
  final String coronaNewsUrl = "https://cvtrackerzw.herokuapp.com/news";

  Future<List<CoronaNews>> getCoronaNews() async {
    Response res =  await get(coronaNewsUrl);

    if(res.statusCode == 200)
    {
      List<CoronaNews> coronaNewsData = jsonDecode(res.body)
      .map(
        (dynamic item) => coronaNewsFromJson(item),
      )
      .toList();

      return coronaNewsData;
    }

    else
    {
      throw "Failed to get news from API";
    }
  }

}

