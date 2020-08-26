import 'package:covid_19_tracker/models/countrystats.dart';
import 'package:covid_19_tracker/services/api_services.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:covid_19_tracker/ui/indicator.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final _api = new ApiService();
  var isCurrentExpanded = false;
  var isGenderExpanded = false;
  var isProvinceExpanded = false;
  var isPositiveExpanded = false;
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    List<String> _provinces = [
      "Byo",
      "Hre",
      "Man",
      "Msc",
      "Mse",
      "Msw",
      "Mas",
      "Mtn",
      "Mts",
      "Mid"
    ];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "CoVID-19 Statistics",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: darkColor,
      ),
      backgroundColor: darkColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    "Updated On ",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  FutureBuilder(
                    future: _api.getDateUpdated(),
                    builder: (context, snap) {
                      if (snap.hasData) {
                        DateUpdated date = snap.data;
                        return Text(
                          "${date.date}.",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
                      } else {
                        return SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator());
                      }
                    },
                  ),
                ],
              ),
              ExpansionTile(
                trailing: Icon(
                  isCurrentExpanded == false
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: textColor,
                ),
                title: Text(
                  "Current Statistics",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                onExpansionChanged: (value) {
                  setState(() {
                    isCurrentExpanded = value;
                  });
                },
                children: <Widget>[
                  FutureBuilder(
                    future: _api.getCurrentCases(),
                    // ignore: missing_return
                    builder: (context, snap) {
                      if (snap.hasData) {
                        CurrentCases cases = snap.data;
                        return Column(
                          children: <Widget>[
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "TOTAL\nTESTS",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.totalTests}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "POSITIVE\nCASES",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.positiveCases}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "NEGATIVE\nTESTS",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.negativeCases}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "DEATHS",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.deaths}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "IN\nICU",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.icu}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "AVERAGE\nAGE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.averageAge}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "MEDIAN\nAGE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.medianAge}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "MINIMUM\nAGE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.minimumAge}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 24.0,
                              child: Container(
                                width: 0.9 * _width,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(
                                        "MAXIMUM\nAGE",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${cases.maximumAge}",
                                        style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Center(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator()));
                      }
                    },
                  ),
                ],
              ),
              ExpansionTile(
                trailing: Icon(
                  isGenderExpanded == false
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: textColor,
                ),
                title: Text(
                  "Statistics By Gender",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                onExpansionChanged: (value) {
                  setState(() {
                    isGenderExpanded = value;
                  });
                },
                children: <Widget>[
                  FutureBuilder(
                    future: _api.getSexUpdate(),
                    // ignore: missing_return
                    builder: (context, snap) {
                      if (snap.hasData) {
                        CasesBySex cases = snap.data;
                        return Container(
                            width: 0.9 * _width,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: textColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Row(
                                      children: <Widget>[
                                        const SizedBox(
                                          height: 18,
                                        ),
                                        Expanded(
                                          child: AspectRatio(
                                            aspectRatio: 1,
                                            child: PieChart(
                                              PieChartData(
                                                  pieTouchData: PieTouchData(
                                                      touchCallback:
                                                          (pieTouchResponse) {
                                                    setState(() {
                                                      if (pieTouchResponse
                                                                  .touchInput
                                                              is FlLongPressEnd ||
                                                          pieTouchResponse
                                                                  .touchInput
                                                              is FlPanEnd) {
                                                        touchedIndex = -1;
                                                      } else {
                                                        touchedIndex =
                                                            pieTouchResponse
                                                                .touchedSectionIndex;
                                                      }
                                                    });
                                                  }),
                                                  borderData: FlBorderData(
                                                    show: false,
                                                  ),
                                                  sectionsSpace: 0,
                                                  centerSpaceRadius: 40,
                                                  sections:
                                                      showingSections(cases)),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const <Widget>[
                                            Indicator(
                                              color: Color(0xff0293ee),
                                              text: 'Male',
                                              isSquare: true,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Indicator(
                                              color: Color(0xfff8b250),
                                              text: 'Female',
                                              isSquare: true,
                                            ),
                                            SizedBox(
                                              height: 4,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 28,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      } else {
                        return Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              ExpansionTile(
                trailing: Icon(
                  isProvinceExpanded == false
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  color: textColor,
                ),
                title: Text(
                  "Statistics By Province",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                onExpansionChanged: (value) {
                  setState(() {
                    isProvinceExpanded = value;
                  });
                },
                children: <Widget>[
                  FutureBuilder(
                    future: _api.getProvincesData(),
                    // ignore: missing_return
                    builder: (context, snap) {
                      if (snap.hasData) {
                        ProvinceCases cases = snap.data;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 15.0,
                            ),
                            height: 200,
                            width: _width,
                            decoration: BoxDecoration(
                              color: Color(0xFFffffff),
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: LineChart(
                                    LineChartData(
                                        lineTouchData: LineTouchData(
                                          enabled: true,
                                        ),
                                        gridData: FlGridData(
                                          show: true,
                                          drawVerticalLine: true,
                                          getDrawingHorizontalLine: (value) {
                                            return FlLine(
                                              color: Color(0xFF37434D),
                                              strokeWidth: 1,
                                            );
                                          },
                                          getDrawingVerticalLine: (value) {
                                            return FlLine(
                                              color: Color(0xFF37434D),
                                              strokeWidth: 1,
                                            );
                                          },
                                        ),
                                        titlesData: FlTitlesData(
                                          show: true,
                                          bottomTitles: SideTitles(
                                            showTitles: true,
                                            reservedSize: 22,
                                            textStyle: TextStyle(
                                              color: Color(0xFF68737d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                            getTitles: (value) {
                                              return _provinces[value.toInt()];
                                            },
                                            margin: 8,
                                          ),
                                          leftTitles: SideTitles(
                                            showTitles: false,
                                            reservedSize: 28,
                                            textStyle: TextStyle(
                                              color: Color(0xFF68737d),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                            getTitles: (value) {
                                              return value.toString();
                                            },
                                            margin: 12,
                                          ),
                                        ),
                                        borderData: FlBorderData(
                                          show: true,
                                          border: Border.all(
                                            color: Color(
                                              0xFF37434D,
                                            ),
                                          ),
                                        ),
                                        lineBarsData: [
                                          LineChartBarData(
                                            spots: [
                                              FlSpot(
                                                0,
                                                double.parse(
                                                  cases.bulawayo,
                                                ),
                                              ),
                                              FlSpot(
                                                1,
                                                double.parse(
                                                  cases.harare,
                                                ),
                                              ),
                                              FlSpot(
                                                2,
                                                double.parse(
                                                  cases.manicaland,
                                                ),
                                              ),
                                              FlSpot(
                                                3,
                                                double.parse(
                                                  cases.mashonaland_central,
                                                ),
                                              ),
                                              FlSpot(
                                                4,
                                                double.parse(
                                                  cases.mashonaland_east,
                                                ),
                                              ),
                                              FlSpot(
                                                5,
                                                double.parse(
                                                  cases.mashonaland_west,
                                                ),
                                              ),
                                              FlSpot(
                                                6,
                                                double.parse(
                                                  cases.masvingo,
                                                ),
                                              ),
                                              FlSpot(
                                                7,
                                                double.parse(
                                                  cases.matabeleland_north,
                                                ),
                                              ),
                                              FlSpot(
                                                8,
                                                double.parse(
                                                  cases.matabeleland_south,
                                                ),
                                              ),
                                              FlSpot(
                                                9,
                                                double.parse(
                                                  cases.midlands,
                                                ),
                                              ),
                                            ],
                                            isCurved: true,
                                            barWidth: 5,
                                            isStrokeCapRound: true,
                                            dotData: FlDotData(
                                              show: false,
                                            ),
                                            colors: [
                                              Color(0xFF23B6E6),
                                              Color(0xFF02D39A),
                                            ],
                                            belowBarData: BarAreaData(
                                              show: true,
                                              colors: [
                                                Color(0xFF23B6E6),
                                                Color(0xFF02D39A)
                                              ]
                                                  .map((color) =>
                                                      color.withOpacity(0.3))
                                                  .toList(),
                                            ),
                                          ),
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                    },
                  ),
                  ExpansionTile(
                    trailing: Icon(
                      isPositiveExpanded == false
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: textColor,
                    ),
                    title: Text(
                      "Statistics By Positive Cases",
                      style: TextStyle(
                        color: textColor,
                      ),
                    ),
                    onExpansionChanged: (value) {
                      setState(() {
                        isPositiveExpanded = value;
                      });
                    },
                    children: <Widget>[
                      FutureBuilder(
                        future: _api.getPositiveCases(),
                        // ignore: missing_return
                        builder: (context, snap) {
                          if (snap.hasData) {
                            print(snap.data);
                            List<PositiveCases> cases = snap.data;
                            return Container(
                              height: _height / 2,
                              width: _width,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: cases.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      width: 0.9 * _width,
                                      decoration: BoxDecoration(
                                        color: textColor,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Positive Case No. ${cases[index].caseId}",
                                              style: TextStyle(
                                                color: darkColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Divider(
                                              color: darkColor,
                                            ),
                                            cases[index].date != "null"
                                                ? Text(
                                                    "Date: ${cases[index].date}",
                                                    style: TextStyle(
                                                      color: darkColor,
                                                    ),
                                                  )
                                                : Container(
                                                    height: 0, width: 0),
                                            Text(
                                              "Age: ${cases[index].age}",
                                            ),
                                            Text(
                                              "Gender: ${cases[index].gender}",
                                            ),
                                            Text(
                                              "City: ${cases[index].city}",
                                            ),
                                            Text(
                                              "Province: ${cases[index].province}",
                                            ),
                                            Text(
                                              "Country: ${cases[index].country}",
                                            ),
                                            Text(
                                              "Current Status: ${cases[index].currentStatus}",
                                            ),
                                            Text(
                                              "Source: ${cases[index].source}",
                                            ),
                                            cases[index].symptoms != "null"
                                                ? Text(
                                                    "Symptoms: ${cases[index].symptoms}",
                                                  )
                                                : Container(
                                                    height: 0, width: 0),
                                            cases[index].dateOfSymptomsOnset !=
                                                    "null"
                                                ? Text(
                                                    "Date of symptoms onset: ${cases[index].dateOfSymptomsOnset}",
                                                  )
                                                : Container(
                                                    height: 0, width: 0),
                                            cases[index].dateOfAdmission !=
                                                    "null"
                                                ? Text(
                                                    "Date of admission: ${cases[index].dateOfAdmission}",
                                                  )
                                                : Container(
                                                    height: 0, width: 0),
                                            Text(
                                              "Date of confirmation: ${cases[index].dateOfConfirmation}",
                                            ),
                                            cases[index].underlyingConditions !=
                                                    "null"
                                                ? Text(
                                                    "Underlying Conditions: ${cases[index].underlyingConditions}",
                                                  )
                                                : Container(
                                                    height: 0, width: 0),
                                            cases[index].travelHistoryDates !=
                                                    "null"
                                                ? Text(
                                                    "Travel History Dates: ${cases[index].travelHistoryDates}",
                                                  )
                                                : Container(
                                                    height: 0, width: 0),
                                            Text(
                                              "Travel History Location: ${cases[index].travelHistoryLocation}",
                                            ),
                                            cases[index].dateOfDeath != "null"
                                                ? Text(
                                                    "Date of death: ${cases[index].dateOfDeath}",
                                                  )
                                                : Container(
                                                    height: 0, width: 0),
                                            Text(
                                              "Relevant Notes: ${cases[index].notes}",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          } else {
                            return Center(
                                child: SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator()));
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(cases) {
    return List.generate(2, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: double.parse(cases.male),
            title: cases.male,
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: double.parse(cases.female),
            title: cases.female,
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}

class GenderStats {
  String gender;
  int number;
  GenderStats(this.gender, this.number);
}

class ProvinceStats {
  String province;
  int value;
  ProvinceStats(this.province, this.value);
}
