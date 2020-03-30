import 'package:covid_19_tracker/old%20app%20designs/widgets/sick_person.dart';
import 'package:covid_19_tracker/old%20app%20designs/widgets/symptoms_column.dart';
import 'package:covid_19_tracker/old%20app%20designs/widgets/transmission_tile.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: double.infinity,
              color: Color(0xFFFAF5E6),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_left,
                    size: 50.0,
                    color: Colors.grey,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: ListView(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      left: 10.0,
                      right: 10.0,
                    ),
                    children: <Widget>[
                      Text(
                        'Latest Epidemic is',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Text(
                        'Coronavirus',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Transmissions',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: Color(0xFFE1AB62),
                        endIndent: MediaQuery.of(context).size.width * 0.50,
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                transmissionTile(
                                  'Air',
                                  'assets/images/air.png',
                                  Colors.black87,
                                ),
                                Spacer(),
                                transmissionTile(
                                    'Objects',
                                    'assets/images/contaminated.png',
                                    Colors.deepOrange),
                              ],
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                transmissionTile(
                                    'Animal',
                                    'assets/images/animal.png',
                                    Colors.yellow[700]),
                                Spacer(),
                                transmissionTile(
                                    'Humans',
                                    'assets/images/human_contact.png',
                                    Colors.blueGrey),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'Symptoms',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Divider(
                        thickness: 2.0,
                        color: Color(0xFFE1AB62),
                        endIndent: MediaQuery.of(context).size.width * 0.50,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          sickPerson(),
                          symptomsColumn(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
