import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            onPressed: () {},
          ),
        ],
        title: Text('ABOUT US'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.only(top: 0),
          children: <Widget>[
            Card(
              elevation: 0.0,
              margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
                  leading: Container(
                    child: Image(
                      fit: BoxFit.contain,
                      height: 70,
                      width: 70,
                      image: AssetImage(
                        'assets/images/flutter.png',
                      ),
                    ),
                  ),
                  title: Text(
                    "FLUTTER DEVS ZIMBABWE",
                    style: TextStyle(
                        color: Colors.black54, fontWeight: FontWeight.bold),
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Row(
                    children: <Widget>[
                      Text(" IN DART WE TRUST",
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              child: Card(
                elevation: 10.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      child: Container(
                        child: Image(
                          fit: BoxFit.contain,
                          height: 50,
                          width: 60,
                          image: AssetImage(
                            'assets/images/globe.png',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "WEBSITE",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text("www.fluttedevszim.co.zw",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch('http://flutter.dev/'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      child: Container(
                        child: Image(
                          fit: BoxFit.contain,
                          height: 50,
                          width: 60,
                          image: AssetImage(
                            'assets/images/github.png',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Star on Github",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text("give us a star on github ",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch(
                  'https://github.com/flutterdevzim/CoVID-19-Tracker/stargazers'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 20.0, vertical: 3.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 4.5, color: Colors.blueGrey))),
                      child: Icon(Icons.info, color: Colors.black),
                    ),
                    title: Text(
                      "Privacy & Policy",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text(" visit", style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch(
                  'https://github.com/flutterdevzim/CoVID-19-Tracker/blob/master/README.md#license'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 80.0, vertical: 0.5),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 100.0, vertical: 40.0),
                    leading: Container(
                      child: Container(
                        child: Image(
                          fit: BoxFit.fill,
                          height: 90,
                          width: 100,
                          image: AssetImage(
                            'assets/images/work.png',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "THE DEVELOPERS",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text(" meet the team",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch(
                  'https://github.com/flutterdevzim/CoVID-19-Tracker/commits/master'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      child: Container(
                        child: Image(
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                          image: AssetImage(
                            'assets/images/ali.png',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Alistair Holmes",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text(" Click to view profile",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch('https://github.com/alistairholmes'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      child: Container(
                        child: Image(
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                          image: AssetImage(
                            'assets/images/donn.png',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Donn C",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text(" view profile",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch('https://github.com/DonnC'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      child: Container(
                        child: Image(
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                          image: AssetImage(
                            'assets/images/ngoni1.png',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Ngonidzashe Maphosa",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text(" view profile",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch('https://github.com/Ngoni-Sama'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 4.5, color: Colors.blueGrey))),
                      child: Icon(Icons.people, color: Colors.black54),
                    ),
                    title: Text(
                      "Ngonidzashe Mangudya",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Text(" view profile",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch('https://github.com/iamNGVJ'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      padding: EdgeInsets.only(right: 12.0),
                      decoration: new BoxDecoration(
                          border: new Border(
                              right: new BorderSide(
                                  width: 4.5, color: Colors.blueGrey))),
                      child: Icon(Icons.people, color: Colors.black54),
                    ),
                    title: Text(
                      "SuperCode",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Row(
                      children: <Widget>[
                        Text(" view profile",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch('https://github.com/ignertic'),
            ),
            InkWell(
              child: Card(
                elevation: 5.0,
                margin:
                new EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.5),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListTile(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    leading: Container(
                      child: Container(
                        child: Image(
                          fit: BoxFit.contain,
                          height: 50,
                          width: 50,
                          image: AssetImage(
                            'assets/images/ad.png',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      "Admire Makusha",
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                    subtitle: Row(
                      children: <Widget>[
                        Text("view profile",
                            style: TextStyle(color: Colors.grey))
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () => launch('https://github.com/admaku'),
            ),
          ],
        ),
      ),
    );
  }
}