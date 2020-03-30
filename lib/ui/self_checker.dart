import 'package:covid_19_tracker/models/self_checker_brain.dart';
import 'package:flutter/material.dart';

class SelfCheckerScreen extends StatefulWidget {
  @override
  _SelfCheckerState createState() => _SelfCheckerState();
}

SelfCheckerBrain selfCheckerBrain = SelfCheckerBrain();

class _SelfCheckerState extends State<SelfCheckerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        centerTitle: true,
        leading: _goBackButton(context),
        title: Text(
          'Self Check Up',
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        backgroundColor: Color(0xFF212b46),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFF212b46),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      selfCheckerBrain.getSelfChecker(),
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: FlatButton(
                          onPressed: () {
                            setState(() {
                              //Choice 1 made by user.
                              selfCheckerBrain.nextSelfChecker(1);
                            });
                          },
                          color: Color(0xFF212b46),
                          child: Text(
                            selfCheckerBrain.getAnswer1(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 150,
                        height: 50,
                        child: FlatButton(
                          onPressed: () {
                            //Choice 2 made by user.
                            setState(() {
                              selfCheckerBrain.nextSelfChecker(2);
                            });
                          },
                          color: Color(0xFF212b46),
                          child: Text(
                            selfCheckerBrain.getAnswer2(),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
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
    );
  }
}

Widget _goBackButton(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
      onPressed: () {
        Navigator.of(context).pop(true);
      });
}
