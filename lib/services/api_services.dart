import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:covid_19_tracker/models/countrystats.dart';

class ApiService {
  final String _baseNewsUrl     = 'https://cvtrackerzw.herokuapp.com/news';
  final String _baseStatsUrl    = 'https://crnzwhack.herokuapp.com';

  Future<List> loadNews() async {
    // get data
    final response = await http.get(_baseNewsUrl);
    final data = jsonDecode(response.body);
    return data['articles'];
  }

  Future<CurrentCases> getCurrentCases() async{
    var url = "$_baseStatsUrl/UpdateSummary";
    var response;
    CurrentCases data;
    try{
      response = await http.get(url);
      data = CurrentCases.fromJson(json.decode(response.body)[0]);
    }catch(e){
      print(e);
    }
    return data;
  }

  Future<DateUpdated> getDateUpdated() async{
    var url = "$_baseStatsUrl/dateUpdate";
    var response;
    DateUpdated date;
    try{
      response = await http.get(url);
      date = DateUpdated.fromJson(json.decode(response.body)[0]);
    }catch(e){
      print(e);
    }
    return date;
  }

  Future<CasesBySex> getSexUpdate() async{
    var url = "$_baseStatsUrl/sexUpdate";
    var response;
    CasesBySex data;
    try{
      response = await http.get(url);
      data = CasesBySex.fromJson(json.decode(response.body)[0]);
    }catch(e){
      print(e);
    }
    return data;
  }

  Future<List<PositiveCases>> getPositiveCases() async{
    var url = "$_baseStatsUrl/apicase";
    var response;
    var data;
    var dataList = List<PositiveCases>();
    try{
      response = await http.get(url);
      data = json.decode(response.body);
      for(var dt in data){
        dataList.add(PositiveCases.fromJson(dt));
      }
    }catch(e){
      throw(e);
    }
    return dataList;
  }
}
