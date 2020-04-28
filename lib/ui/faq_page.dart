import 'package:covid_19_tracker/models/faq.dart';
import 'package:covid_19_tracker/services/api_services.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  final _api = new ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: questionsPageBGColor,
        appBar: AppBar(
          backgroundColor: questionsPageBGColor,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Donate FAQs',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: FutureBuilder(
          future: _api.getFAQs(),
          builder: (context, snap) {
            if (snap.hasData) {
              List<FAQ> faqs = snap.data;
              return ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (BuildContext context, int index) {
                  FAQ faq = faqs[index];
                  return Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            faq.question,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.95),
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Divider(
                            color: Colors.white.withOpacity(0.8),
                          ),
                          Text(
                            faq.answer,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 12.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
