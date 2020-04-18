import 'dart:convert';
import 'package:covid_19_tracker/models/country_stats.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String _baseNewsUrl     = 'https://cvtrackerzw.herokuapp.com/news';
  final String _baseStatsUrl    = 'https://corona.lmao.ninja/v2/countries';

  Future<List> loadNews() async {
    // get data
    final response = await http.get(_baseNewsUrl);
    final data = jsonDecode(response.body);
    return data['articles'];
  }

  Future<Stats> loadCountryStats(String countryName) async {
    // get stats
    final response = await http.get('$_baseStatsUrl/$countryName');
    final stats = statsFromJson(response.body);
    return stats;
  }

}
