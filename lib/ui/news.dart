import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsList extends StatelessWidget {
  final List<String> images;
  final VoidCallback loadMore;

  const NewsList({Key key, this.images, this.loadMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size cardSize = Size(300.0, 460.0);
    return Scaffold(
      body: FutureBuilder(
        future: this.loadNews(),
        builder: (context, snap) {
          if (snap.hasData) {
            final height = MediaQuery.of(context).size.height;
            final width = double.infinity;

            final List item = snap.data;
            return PageView.builder(itemBuilder: (context, index) {
              return Stack(
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(item[index]['urlToImage']))),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: height,
                    width: width,
                    child: ListView(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          item[index]['title'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          item[index]['description'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          item[index]['content'],
                          style: TextStyle(
                              color: Colors.white.withOpacity(.7),
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              fontStyle: FontStyle.italic),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text('Date'),
                        Text(
                          item[index]['publishedAt'],
                          style: TextStyle(
                              color: Colors.tealAccent,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                              fontStyle: FontStyle.italic),
                        ),
                        Row(
                          children: <Widget>[
                            Text('By'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item[index]['author'],
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('from'),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item[index]['source']['name'],
                              style: TextStyle(
                                  color: Colors.white.withOpacity(.6)),
                            )
                          ],
                        ),
                        RaisedButton(
                          elevation: 5,
                          color: Colors.lightBlue,
                          child: Text(
                            'Read Full Article',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            launch(item[index]['url']);
                          },
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                          Colors.lightBlue,
                          Colors.purple.withOpacity(.3)
                        ])),
                  )
                ],
              );
            });
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Future<List> loadNews() async {
    // get data
    String url = 'https://cvtrackerzw.herokuapp.com/news';
    final response = await http.get(url);
    final data = jsonDecode(response.body);
    return data['articles'];
  }
}
