import 'package:covid_19_tracker/models/corona_news.dart';
import 'package:covid_19_tracker/utils/corona_news_data.dart';
import 'package:flutter/material.dart';

class CoronaNewsScreen extends StatelessWidget {
  final CoronaNewsDataService coronaNewsPosts = CoronaNewsDataService();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: FutureBuilder(
        future: coronaNewsPosts.getCoronaNews(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: <Widget>[
                Center(
                  child: Text(snapshot.data.articles),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
