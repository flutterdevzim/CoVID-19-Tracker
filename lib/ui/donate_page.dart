import 'package:covid_19_tracker/models/donation_summary.dart';
import 'package:covid_19_tracker/models/donors.dart';
import 'package:covid_19_tracker/services/api_services.dart';
import 'package:covid_19_tracker/ui/faq_page.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:covid_19_tracker/widgets/donate_bottom_sheet.dart';
import 'package:covid_19_tracker/widgets/summary_loading.dart';
import 'package:flutter/material.dart';

class DonatePage extends StatefulWidget {
  @override
  _DonatePageState createState() => _DonatePageState();
}

class _DonatePageState extends State<DonatePage> {
  final _api = new ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: preventivePageBGColor,
        //floatingActionButton: DonateFAB(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: Icon(
                    Icons.help,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FaqPage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  right: 10.0,
                  bottom: 15.0,
                ),
                child: DonateFAB(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                  bottom: 3.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Donations Summary',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: _api.getDonationSummary(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    List<DonationSummary> donations = snap.data;
                    return Container(
                      height: 160.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: donations.length,
                        itemBuilder: (BuildContext context, int index) {
                          DonationSummary donationSummary = donations[index];
                          return Container(
                            height: 160.0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(5.0),
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 5.0,
                                    left: 5.0,
                                    right: 5.0,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 60,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        child: Image.asset(
                                          'assets/images/${donationSummary.icon}',
                                          fit: BoxFit.fitHeight,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              donationSummary.category,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Color(0xFFFC9246),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.0,
                                            ),
                                            Text(
                                              donationSummary.quantity,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                fontSize: 12,
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
                        },
                      ),
                    );
                  } else {
                    return summaryLoading(
                        context, MediaQuery.of(context).size.width);
                  }
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Recent Donations',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: _api.getDonors(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    List<Donor> donors = snap.data;
                    return Container(
                      height: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: donors.length,
                        itemBuilder: (BuildContext context, int index) {
                          Donor donor = donors[index];
                          return Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            height: 80.0,
                            margin: EdgeInsets.all(10.0),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 3.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        donor.donorName,
                                        softWrap: true,
                                        style: TextStyle(
                                          color: Colors.black.withOpacity(0.7),
                                          fontSize: 17.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.calendar_today,
                                        color: Colors.grey,
                                        size: 13.0,
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        donor.donatedOn,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.attach_file,
                                        color: Colors.grey,
                                        size: 13.0,
                                      ),
                                      SizedBox(
                                        width: 2.0,
                                      ),
                                      Text(
                                        donor.resource,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    donor.estimatedValue,
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DonateFAB extends StatefulWidget {
  @override
  _DonateFABState createState() => _DonateFABState();
}

class _DonateFABState extends State<DonateFAB> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(
          context: context,
          backgroundColor: questionsPageBGColor,
          builder: (context) => DonateBottomSheet(),
        );
      },
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Text(
            'Donate Now to Covid-19',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
