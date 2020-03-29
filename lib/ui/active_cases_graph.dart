import 'package:covid_19_tracker/ui/line_chart_sample2.dart';
import 'package:flutter/material.dart';

class ActiveCasesGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xff262545),
        child: ListView(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 36.0,
                  top: 24,
                ),
                child: Text(
                  'Line Chart',
                  style: TextStyle(
                      color: const Color(
                        0xff6f6f97,
                      ),
                      fontSize: 32,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 28.0, right: 28),
              child: LineChartSample2(),
            ),
          ],
        ),
      ),
    );
  }
}
