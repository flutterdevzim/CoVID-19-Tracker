import 'dart:convert';
import 'dart:io';
import 'package:covid_19_tracker/models/donation_summary.dart';
import 'package:covid_19_tracker/models/donors.dart';
import 'package:covid_19_tracker/models/faq.dart';
import 'package:covid_19_tracker/models/hackathon_news.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:covid_19_tracker/models/countrystats.dart';

class ApiService {
  final String _baseNewsUrl =
      'https://flutterdevzw.herokuapp.com//v1/hackathon/news';
  final String _baseStatsUrl = 'https://crnzwhack.herokuapp.com';

  Future loadNews() async {
    // get data
    try {
      final response = await http.get(_baseNewsUrl);
      final news = newsFromJson(response.body);
      return news;
    } catch (e) {
      // error
      Fluttertoast.showToast(
          msg: "Check your internet connection\nor try again",
          textColor: darkColor,
          backgroundColor: textColor);
    }
  }

  Future<CurrentCases> getCurrentCases() async {
    var url = "$_baseStatsUrl/UpdateSummary";
    var response;
    CurrentCases data;
    try {
      response = await http.get(url);
      data = CurrentCases.fromJson(json.decode(response.body)[0]);
    } on SocketException catch (e) {
      Fluttertoast.showToast(
          msg: "Check your internet connection",
          textColor: darkColor,
          backgroundColor: textColor);
    }
    return data;
  }

  Future<List<DonationSummary>> getDonationSummary() async {
    await Future.delayed(Duration(milliseconds: 500));
    List<DonationSummary> donationSummary = [
      DonationSummary(
        0,
        "dollar_sign.png",
        "Total funds",
        "USD\$ 76,032,990",
      ),
      DonationSummary(
        1,
        "face_mask.png",
        "Face Mask",
        "100 000",
      ),
      DonationSummary(
        2,
        "lab_kits.png",
        "Lab test kits",
        "20 000",
      ),
      DonationSummary(
        3,
        "hamzat_suit.png",
        "Hamzat suits",
        "1 000",
      ),
      DonationSummary(
        4,
        "upgrade.png",
        "Upgrade",
        "USD\$ 500 000",
      ),
      DonationSummary(
        5,
        "hamper.png",
        "Hampers",
        "200",
      ),
      DonationSummary(
        6,
        "fuel.png",
        "Fuel",
        "40 000L",
      ),
    ];

    return donationSummary;
  }

  Future<List<FAQ>> getFAQs() async {
    // get all FAQs
    await Future.delayed(Duration(milliseconds: 500));

    List<FAQ> faqs = [
      FAQ(
        "How do i make a donation?",
        "Click on 'Donate Now to Covid-19' button, a pop up will appear on the bottom of your screen where you enter your details and the amount you want to donate",
      ),
      FAQ(
        "Can i donate using ecocash/bank/zipit/one money?",
        "Yes, after clicking on the donate button, you have a drop down menu for you to select your payment method of your choice",
      ),
      FAQ(
        "How do i know im sending to the right organisation?",
        "All payments goes under one account for each payment method. For example for ecocash, merchant name is COVID-19-ZW",
      ),
      FAQ(
        "Is there any accountability for my donations?",
        "Yes ofcourse. Because you provide your details when making a donation. Your details and donation is saved to the national database and accountability can be traced at https://openparly.co.zw/donations",
      ),
      FAQ(
        "I have goods and other material goods to donate. How do i go about it?",
        "Thank you for asking. Material donations are welcome and can be donated to our physical official centers regionally. Chat with us on whatsapp on 077xxxxxxx for further assistance on the center near you",
      ),
      FAQ(
        "What is the minimum/maximum amount that i can donate?",
        "We accept as little as \$1.00 and as much as you are willing to donate to the Covid-19 cause. There is no limit to what you can offer to help in this cause",
      ),
      FAQ(
        "I need more information. How do i reach out to you?",
        "We are available 24/7 on our customer care number. Get in touch with us on +263778xxxxxx or email hackathon@gmail.com. You can also visit our website on https://www.openparly.com",
      ),
      FAQ(
        "I also need help and looking for donors. How do i go about it?",
        "Donations goes to one account and the dedicated task force that handles Covid-19 donations. Contact us to register your organisation to be added on the list of beneficiaries.",
      ),
      FAQ(
        "I have forex. Is it legal? How do i donate in forex?",
        "You can donate in forex to our Nostro FCA Accounts. Please get in touch with us on +263778xxxxxx for more on forex donations",
      ),
    ];

    return faqs;
  }

  Future<List<Donor>> getDonors() async {
    // get all main donors
    await Future.delayed(Duration(milliseconds: 500));

    List<Donor> donors = [
      Donor(
        0,
        Donor.formatDate("2020-03-04"),
        "Ecobank",
        "Money",
        "USD 30000",
      ),
      Donor(
        1,
        Donor.formatDate("2020-03-04"),
        "EcoSure",
        "Months",
        "",
      ),
      Donor(
        2,
        Donor.formatDate("2020-03-04"),
        "Bitumen World",
        "40000 litres of diesel",
        "USD 34400",
      ),
      Donor(
        3,
        Donor.formatDate("2020-03-06"),
        "International Development",
        "Protective Equipment",
        "USD 129390",
      ),
      Donor(
        4,
        Donor.formatDate("2020-03-06"),
        "China",
        "Wilkins Hospital upgrade",
        "USD 500000",
      ),
      Donor(
        5,
        Donor.formatDate("2020-03-16"),
        "Global Fund",
        "Money",
        "USD 25000000",
      ),
      Donor(
        6,
        Donor.formatDate("2020-03-25"),
        "Jack Ma & Alibaba Group",
        "20 000 laboratory diagonistic test kits",
        "",
      ),
      Donor(
        7,
        Donor.formatDate("2020-03-25"),
        "Jack Ma & Alibaba Group",
        "100 000 medical face masks",
        "USD 58000",
      ),
      Donor(
        8,
        Donor.formatDate("2020-03-25"),
        "Jack Ma & Alibaba Group",
        "1000 Hamzat protective suits and face shields",
        "USD 18000",
      ),
      Donor(
        9,
        Donor.formatDate("2020-03-26"),
        "Zimbabwe (GMAZ)",
        "200 Monthly Food hampers",
        "",
      ),
      Donor(
        10,
        Donor.formatDate("2020-03-27"),
        "US Embassy Harare",
        "Money",
        "USD 470000",
      ),
      Donor(
        11,
        Donor.formatDate("2020-03-27"),
        "African Sun Limited",
        "ZWL 200000",
        "USD 8000",
      ),
      Donor(
        12,
        Donor.formatDate("2020-03-30"),
        "African Medallion Group (AMG)",
        "Money",
        "USD 5000000",
      ),
      Donor(
        13,
        Donor.formatDate("2020-04-01"),
        "Rainbow Hotel Bulawayo",
        "Linen, Towels, Face masks",
        "",
      ),
      Donor(
        14,
        Donor.formatDate("2020-04-01"),
        "Qoki Zindlovukazi",
        "Groceries",
        "",
      ),
      Donor(
        15,
        Donor.formatDate("2020-04-01"),
        "Bulawayo Babies",
        "Face masks",
        "",
      ),
      Donor(
        16,
        Donor.formatDate("2020-04-01"),
        "Chloride Zimbabwe",
        "solar backup power battries",
        "",
      ),
      Donor(
        17,
        Donor.formatDate("2020-04-07"),
        "US Embassy Harare",
        "Money",
        "USD 150000",
      ),
      Donor(
        18,
        Donor.formatDate("2020-04-08"),
        "Petrotrade, Energy Park Fuels",
        "Cash, fuel, sanitisers, gloves, masks",
        "USD 35200",
      ),
      Donor(
        19,
        Donor.formatDate("2020-04-08"),
        "Chamber of Mines",
        "Money",
        "USD 1000000",
      ),
      Donor(
        20,
        Donor.formatDate("2020-04-08"),
        "UK Government",
        "Money",
        "USD 43.6 000000",
      ),
      Donor(
        21,
        Donor.formatDate("2020-04-09"),
        "Delta Beverages",
        "Money",
        "RTGS 5000000",
      ),
      Donor(
        22,
        Donor.formatDate("2020-04-11"),
        "Unki Mine",
        "Money",
        "ZAR 10000000",
      ),
    ];

    return donors;
  }

  Future<DateUpdated> getDateUpdated() async {
    var url = "$_baseStatsUrl/dateUpdate";
    var response;
    DateUpdated date;
    try {
      response = await http.get(url);
      date = DateUpdated.fromJson(json.decode(response.body)[0]);
    } on SocketException catch (e) {
      Fluttertoast.showToast(
          msg: "Check your internet connection",
          textColor: darkColor,
          backgroundColor: textColor);
    }
    return date;
  }

  Future<CasesBySex> getSexUpdate() async {
    var url = "$_baseStatsUrl/sexUpdate";
    var response;
    CasesBySex data;
    try {
      response = await http.get(url);
      data = CasesBySex.fromJson(json.decode(response.body)[0]);
    } on SocketException catch (e) {
      Fluttertoast.showToast(
          msg: "Check your internet connection",
          textColor: darkColor,
          backgroundColor: textColor);
    }
    return data;
  }

  Future<List<PositiveCases>> getPositiveCases() async {
    var url = "$_baseStatsUrl/apicase";
    var response;
    var data;
    var dataList = List<PositiveCases>();
    try {
      response = await http.get(url);
      data = json.decode(response.body);
      for (var dt in data) {
        dataList.add(PositiveCases.fromJson(dt));
      }
    } on SocketException catch (e) {
      Fluttertoast.showToast(
          msg: "Check your internet connection",
          textColor: darkColor,
          backgroundColor: textColor);
    }
    return dataList;
  }

  Future<ProvinceCases> getProvincesData() async {
    var url = "$_baseStatsUrl/CasesProvince";
    var response;
    ProvinceCases data;
    try {
      response = await http.get(url);
      data = ProvinceCases.fromJson(json.decode(response.body)[0]);
    } on SocketException catch (e) {
      Fluttertoast.showToast(
          msg: "Check your internet connection",
          textColor: darkColor,
          backgroundColor: textColor);
    }
    return data;
  }

  Future<List<CntryStats>> getStatsForGraph() async{
    var url = "https://api.covid19api.com/live/country/zimbabwe/status/confirmed";
    var response;
    var data;
    var dataList = List<CntryStats>();
    try{
      response = await http.get(url);
      data = json.decode(response.body);
      for(var dt in data){
        dataList.add(CntryStats.fromJson(dt));
      }
    }on SocketException catch(e){
      Fluttertoast.showToast(msg: "Check your internet connection", textColor: darkColor, backgroundColor: textColor);
    }
    return dataList;
  }
}
