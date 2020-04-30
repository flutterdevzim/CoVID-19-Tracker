import 'dart:convert';

//STATS MODELS

//date updated model
class DateUpdated{
  String date;
  DateUpdated({this.date});
  factory DateUpdated.fromJson(Map<String, dynamic> json) => DateUpdated(date: json["date"]);
}

//cases by province model
class ProvinceCases{
  String bulawayo;
  String harare;
  String manicaland;
  String mashonaland_central;
  String mashonaland_east;
  String mashonaland_west;
  String masvingo;
  String matabeleland_north;
  String matabeleland_south;
  String midlands;
  ProvinceCases({this.bulawayo, this.harare, this.manicaland, this.mashonaland_central, this.mashonaland_east, this.mashonaland_west, this.masvingo, this.matabeleland_north, this.matabeleland_south, this.midlands});
  factory ProvinceCases.fromJson(Map<String, dynamic> json) => ProvinceCases(bulawayo: json["Bulawayo"], harare: json["Harare"], manicaland: json["Manicaland"], mashonaland_central: json["Mashonaland_Central"], mashonaland_east: json["Mashonaland_East"], mashonaland_west: json["Mashonaland_West"], masvingo: json["Masvingo"], matabeleland_north: json["Matabeleland_North"], matabeleland_south: json["Matabeleland_South"], midlands: json["Midlands"]);
}

//current cases model
class CurrentCases{
  String totalTests;
  String positiveCases;
  String negativeCases;
  String deaths;
  String icu;
  String averageAge;
  String medianAge;
  String minimumAge;
  String maximumAge;
  CurrentCases({this.totalTests, this.positiveCases, this.negativeCases, this.deaths, this.icu, this.averageAge, this.medianAge, this.minimumAge, this.maximumAge});
  factory CurrentCases.fromJson(Map<String, dynamic> json) => CurrentCases(totalTests: json["TotalTests"], positiveCases: json["PositiveCases"], negativeCases: json["NegativeTests"], deaths: json["Deaths"], icu: json["ICU"], averageAge: json["AverageAge"], medianAge: json["MedianAge"], minimumAge: json["MinimumAge"], maximumAge: json["MaximumAge"]);
}


//cases by sex model
class CasesBySex{
  String male;
  String female;
  CasesBySex({this.male, this.female});
  factory CasesBySex.fromJson(Map<String, dynamic> json) => CasesBySex(male: json["male"], female: json["female"]);
}

class PositiveCases{
  int caseId;
  String date;
  String age;
  String gender;
  String city;
  String province;
  String country;
  String currentStatus;
  String source;
  String symptoms;
  String dateOfSymptomsOnset;
  String dateOfAdmission;
  String dateOfConfirmation;
  String underlyingConditions;
  String travelHistoryDates;
  String travelHistoryLocation;
  String dateOfDeath;
  String notes;
  PositiveCases({this.caseId, this.date, this.age, this.gender, this.city, this.province, this.country, this.currentStatus, this.source, this.symptoms, this.dateOfSymptomsOnset, this.dateOfAdmission, this.dateOfConfirmation, this.underlyingConditions, this.travelHistoryDates, this.travelHistoryLocation, this.dateOfDeath, this.notes});
  factory PositiveCases.fromJson(Map<String, dynamic> json) => PositiveCases(
    caseId: json["caseId"],
    date: json["date"].toString(),
    age: json["age"],
    gender: json["gender"],
    city: json["city"],
    province: json["province"],
    country: json["country"],
    currentStatus: json["currentStatus"],
    source: json["source"],
    symptoms: json["symptoms"],
    dateOfSymptomsOnset: json["dateOnsetSymptoms"].toString(),
    dateOfAdmission: json["dateAdmission_hospital"].toString(),
    dateOfConfirmation: json["dateConfirmation"].toString(),
    travelHistoryDates: json["travelHistoryDates"].toString(),
    travelHistoryLocation: json["travelHistoryLocation"],
    notes: json["notes"],
    underlyingConditions: json["underlyingConditions"]
  );
}

class GraphStats{
  int confirmed;
  int deaths;
  int recovered;
  int active;
  String date;
  GraphStats({this.confirmed, this.deaths, this.recovered, this.active, this.date});
  factory GraphStats.fromJson(Map<String, dynamic> json) => GraphStats(confirmed: json["Confirmed"], deaths: json["Deaths"], recovered: json["Recovered"], active: json["Active"], date: json["Date"]);
}