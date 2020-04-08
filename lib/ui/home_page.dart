import 'package:covid_19_tracker/ui/news.dart';
import 'package:covid_19_tracker/ui/self_checker.dart';
import 'package:covid_19_tracker/utils/date_retriever.dart';
import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:covid_19_tracker/models/countries.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _date = new DateHelper();
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
              fontSize: 30.0,
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
                    'Current outbreak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: questionsPageBGColor,
                      fontSize: 18,
                    ),
                  ),
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
                '${_date.getDay()}, ${_date.getDate()} ${_date.getMonth()} ${_date.getYear()}',
                style: TextStyle(color: Color(0xFFA4ACC3), fontSize: 15,),
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
                              width: 0.125 * _width,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => SelfCheckerScreen()));
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Container(
              height: 140.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                                border: Border.all(color: Color(0xFFFC9246),)
                              ),
                              child: Icon(Icons.add, color: Color(0xFFFC9246), size: 15,),
                            ),
                            SizedBox(height: 20),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "790",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color(0xFFFC9246),
                                    ),
                                  ),
                                  Text(
                                    "INFECTED",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: 10,
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
                    padding: const EdgeInsets.only(right: 20.0),
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
                                border: Border.all(color: Color(0xFF44B876),),
                              ),
                              child: Icon(Icons.favorite, color: Color(0xFF44B876), size: 15,),
                            ),
                            SizedBox(height: 20,),
                            Expanded(
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    "31",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30,
                                      color: Color(0xFF44B876),
                                    ),
                                  ),
                                  Text(
                                    "RECOVERED",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
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
                              border: Border.all(color: Color(0xFFF94340))
                            ),
                            child: Icon(Icons.close, color: Color(0xFFF94340), size: 15,),
                          ),
                          SizedBox(height: 20),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "58",
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
                                    fontSize: 10,
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
                ],
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
