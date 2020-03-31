import 'package:covid_19_tracker/ui/news.dart';
import 'package:covid_19_tracker/ui/self_checker.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:covid_19_tracker/models/countries.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Countries> _countries = Countries.getCountries();
  List<DropdownMenuItem<Countries>> _dropDownMenuItems;
  Countries _country;

  @override
  void initState() {
    _dropDownMenuItems = buildDropDownMenuItems(_countries);
    _country = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<Countries>> buildDropDownMenuItems(List countries) {
    List<DropdownMenuItem<Countries>> items = List();
    for (Countries country in countries) {
      items.add(
        DropdownMenuItem(
          value: country,
          child: Text(
            country.countryName,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: questionsPageBGColor,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      );
    }

    return items;
  }

  onChangeDropdownItem(Countries country) {
    setState(() {
      _country = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Current outbreak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: questionsPageBGColor,
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () => print('notifications pressed'),
                      child: Badge(
                        badgeContent: Text(
                          '0',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.grey,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: DropdownButton(
                value: _country,
                items: _dropDownMenuItems,
                onChanged: onChangeDropdownItem,
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
                'Wed, 25 Mar 20',
                style: TextStyle(color: Colors.grey.shade600),
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
                      bottomRight: Radius.circular(5.0)
                    ),
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
                              width: 0.125 * MediaQuery.of(context).size.width,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SelfCheckerScreen()));
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
              padding: EdgeInsets.only(
                left: 10.0,
              ),
              child: Row(
                children: <Widget>[
                  Text(
                    'Latest Covid-19 News',
                    style: TextStyle(
                      color: questionsPageBGColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(
                    width: 55,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NewsList()));
                    },
                    child: Text(
                      'View News',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
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
            // TODO: Add buttons
            Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: Container(
                height: 120.0,
                color: Colors.grey,
                child: Center(
                  child: Text(
                    'TODO: Buttons',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
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
      ),
    );
  }
}
