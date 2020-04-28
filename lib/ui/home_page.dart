import 'dart:convert';

import 'package:covid_19_tracker/models/country_stats.dart';
import 'package:covid_19_tracker/models/countrystats.dart';
import 'package:covid_19_tracker/services/api_services.dart';
import 'package:covid_19_tracker/ui/news.dart';
import 'package:covid_19_tracker/ui/preventative_measures_screen.dart';
import 'package:covid_19_tracker/ui/self_checker.dart';
import 'package:covid_19_tracker/ui/stats_page.dart';
import 'package:covid_19_tracker/utils/date_retriever.dart';
import 'package:covid_19_tracker/widgets/stats_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:covid_19_tracker/models/countries.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _date = new DateHelper();
  final _api = new ApiService();
  Stats _stats;
  List<Countries> _countries = Countries.getCountries();
  List<DropdownMenuItem<Countries>> _dropDownMenuItems;
  Countries _country;
  CurrentCases cases;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width;
    var _height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 25.0,
                right: 10.0,
                left: 10.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Current Outbreak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: questionsPageBGColor,
                      fontSize: 18,
                    ),
                  ),
                  GestureDetector(child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),

                    child: Icon(
                      Icons.info,
                      color: Colors.grey,
                      size: 38.5,
                    ),

                  ), onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AboutPage()));
                  },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              child: Text(
                '${_date.getDay()}, ${_date.getDate()} ${_date.getMonth()} ${_date.getYear()}',
                style: TextStyle(
                  color: Color(0xFFA4ACC3),
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Card(
                elevation: 24.0,
                child: Container(
                  height: 135.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: questionsPageBGColor.withOpacity(0.9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        offset: Offset(0.0, 1.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/corona1.png',
                        color: Colors.red,
                      ),
                      Positioned(
                        top: 30.0,
                        left: 60.0,
                        child: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Safe Check Up Covid-19',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  'Contain several list of questions to check\nyour physical condition.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 0.125 * _width,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => SelfCheckerScreen()));
                              },
                              icon: Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                                size: 50.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Latest Covid-19 Statistics',
                    style: TextStyle(
                      color: questionsPageBGColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => StatisticsPage())),
                    child: Text(
                      'More Stats',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                  child: Text("Date Updated:"),
                ),
                FutureBuilder(
                  future: _api.getDateUpdated(),
                  builder: (context, snap){
                    if(snap.hasData){
                      DateUpdated date = snap.data;
                      return Text(
                          "${date.date}"
                      );
                    }else{
                      return SizedBox(height: 10, width: 10, child: CircularProgressIndicator());
                    }
                  },
                ),
              ],
            ),
            FutureBuilder(
                future: _api.getCurrentCases(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    print(snap.data);
                    cases = snap.data;
                    return Container(
                      height: 140.0,
                      //width: _width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      child: ListView(
                      scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Container(
                              width: 0.270270 * _width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Colors.blue.withOpacity(0.2),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.blue,
                                          )),
                                      child: Icon(
                                        Icons.text_fields,
                                        color: Colors.blue,
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${cases.totalTests}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          Text(
                                            "TOTAL TESTS",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 9,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.270270 * _width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 25,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFF4E6F5),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color(0xFFF94340))),
                                    child: Icon(
                                      Icons.close,
                                      color: Color(0xFFF94340),
                                      size: 15,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "${cases.deaths}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 30,
                                            color: Color(0xFFF94340),
                                          ),
                                        ),
                                        Text(
                                          "DEATHS",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 9,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0),
                            child: Container(
                              width: 0.270270 * _width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFEEEE1),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFFFC9246),
                                          )),
                                      child: Icon(
                                        Icons.add,
                                        color: Color(0xFFFC9246),
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${cases.positiveCases}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Color(0xFFFC9246),
                                            ),
                                          ),
                                          Text(
                                            "POSITIVE",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 9,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Container(
                              width: 0.270270 * _width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                          color: Color(0xFFE2FFEF),
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Color(0xFF44B876),
                                          )),
                                      child: Icon(
                                        Icons.favorite,
                                        color: Color(0xFF44B876),
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${cases.negativeCases}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Color(0xFF44B876),
                                            ),
                                          ),
                                          Text(
                                            "NEGATIVE",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 9,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Container(
                              width: 0.270270 * _width,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 25,
                                      width: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.yellow.withOpacity(0.2),
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.error,
                                        color: Colors.yellow,
                                        size: 15,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 18,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text(
                                            "${cases.icu}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30,
                                              color: Colors.yellow,
                                            ),
                                          ),
                                          Text(
                                            "IN ICU",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 9,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return StatsLoading(context, _width);
                  }
                }),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Card(
                elevation: 24.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: questionsPageBGColor.withOpacity(0.9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        offset: Offset(0.0, 1.0),
                      ),
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 2.0,
                        offset: Offset(0.0, 2.0),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/corona1.png',
                        color: Colors.red,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text(
                                "Interested in CoVID-19 News?",
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios, color: Colors.white,),
                              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => NewsList())),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Active Cases',
                    style: TextStyle(
                      color: questionsPageBGColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  Spacer(),
                  // FIXME: this text below must be a drop drown button
                  Text(
                    '18 - 22 Mar',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 11.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // TODO: add graph
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PreventativeMeasuresScreen(),
              ),
            );
          },
          tooltip: "Prevent Covid-19",
          backgroundColor: Colors.blueAccent,
          child: Center(
            child: Image.asset(
              'assets/images/prevent_corona_small.png',
              height: 40.0,
              width: 40.0,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}
