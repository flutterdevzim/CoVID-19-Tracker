import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';

class PreventativeMeasuresScreen extends StatefulWidget {
  @override
  _PreventativeMeasuresScreenState createState() =>
      _PreventativeMeasuresScreenState();
}

class _PreventativeMeasuresScreenState
    extends State<PreventativeMeasuresScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.width * 0.65,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                        color: preventivePageBGColor,
                      ),
                    ),
                    clipper: CustomClipPath(),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        top: 10.0,
                        bottom: 10.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.30,
                          ),
                          Text(
                            'Prevention',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 20.0,
                    bottom: 25.0,
                    child: Image.asset(
                      'assets/images/doctor.png',
                      height: 100.0,
                    ),
                  ),
                  Positioned(
                    left: 85.0,
                    bottom: 70.0,
                    child: Image.asset(
                      'assets/images/stop_covid.png',
                      height: 50.0,
                      width: 50.0,
                    ),
                  ),
                  Positioned(
                    bottom: 90.0,
                    right: 35.0,
                    child: Text(
                      'All you need\nis stay at home.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Take steps to protect yourself',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    child: Container(
                      height: 300.0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadiusDirectional.circular(15.0),
                      ),
                      child: Center(
                        child: Text(
                          'TODO',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        bottom: 10.0,
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.all(15.0),
                        onPressed: () => {},
                        color: preventivePageBGColor,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 30.0,
                              right: 30.0,
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Steps to protect others',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 12.0,
                                ),
                              ],
                            ),
                          ),
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
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 80, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
