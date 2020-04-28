import 'package:bezier_chart/bezier_chart.dart';
import 'package:covid_19_tracker/models/countrystats.dart';
import 'package:covid_19_tracker/services/api_services.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  final _api = new ApiService();

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
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
              Row(children: <Widget>[
                Text(
                  "Updated On ",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                FutureBuilder(
                  future: _api.getDateUpdated(),
                  builder: (context, snap){
                    if(snap.hasData){
                      DateUpdated date = snap.data;
                      return Text(
                        "${date.date}.",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      );
                    }else{
                      return SizedBox(height: 10, width: 10, child: CircularProgressIndicator());
                    }
                  },
                ),
              ],),
              ExpansionTile(
                title: Text(
                  "Statistics By Gender",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                children: <Widget>[
                  FutureBuilder(
                    future: _api.getSexUpdate(),
                    // ignore: missing_return
                    builder: (context, snap){
                      if(snap.hasData){
                        CasesBySex cases = snap.data;
                        return Container(
                          width: 0.9 * _width,
                          decoration: BoxDecoration(
                            color: textColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Male: ${cases.male}",
                                  style: TextStyle(
                                    color: darkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Female: ${cases.female}",
                                  style: TextStyle(
                                    color: darkColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  tooltipBehavior: TooltipBehavior(enable: true),
                                  series: <ChartSeries<GenderStats, String>>[
                                    BarSeries<GenderStats, String>(
                                      dataSource: <GenderStats>[
                                        GenderStats("Male", int.parse(cases.male)),
                                        GenderStats("Female", int.parse(cases.female)),
                                      ],
                                      xValueMapper: (GenderStats stats, _) => stats.gender,
                                      yValueMapper: (GenderStats stats, _) => stats.number,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        );
                      }else{
                        return CircularProgressIndicator();
                      }
                    }
                  )
                ],
              ),
              ExpansionTile(
                title: Text(
                  "Statistics By Province",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
              ),
              ExpansionTile(
                title: Text(
                  "Statistics By Positive Cases",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                children: <Widget>[
//                  FutureBuilder(
//                    future: _api.getPositiveCases(),
//                    // ignore: missing_return
//                    builder: (context, snap){
//                      if(snap.hasData){
//                        print(snap.data);
//                        var cases = snap.data;
//                        return ListView.builder(
//                          itemCount: cases.length,
//                          itemBuilder: (context, index){
//                            return Container(
//                              child: Column(
//                                children: <Widget>[
//                                  Text(
//                                    "${cases[index]["city"]}"
//                                  )
//                                ],
//                              ),
//                            );
//                          },
//                        );
//                      }else{
//                        return CircularProgressIndicator();
//                      }
//                    },
//                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderStats{
  String gender;
  int number;
  GenderStats(this.gender, this.number);
}
