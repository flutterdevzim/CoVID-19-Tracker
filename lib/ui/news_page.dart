import 'package:covid_19_tracker/services/api_services.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Newspage extends StatelessWidget {
  final _api = ApiService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: questionsPageBGColor,
        body: FutureBuilder(
          future: _api.loadNews(),
          builder: (context, snap) {
            if (snap.hasData) {
              final height = MediaQuery.of(context).size.height;
              final width = MediaQuery.of(context).size.width;

              final news = snap.data;
              return news.status == "OK"
                  ? PageView.builder(
                      itemCount: news.news.length,
                      itemBuilder: (context, index) {
                        final post = news.news[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: width * 0.8,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(post.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Icon(
                                  Icons.person_pin,
                                  color: Colors.grey,
                                  size: 20.0,
                                ),
                                Text(
                                  '${post.author}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                                ),
                                Icon(
                                  Icons.local_offer,
                                  color: Colors.grey,
                                  size: 20.0,
                                ),
                                Text(
                                  'CoVID-19',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                                ),
                                Icon(
                                  Icons.timelapse,
                                  color: Colors.grey,
                                  size: 20.0,
                                ),
                                Text(
                                  post.posted,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 5.0, right: 5.0, bottom: 5.0),
                              child: Text(
                                post.title,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.75),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: 5.0,
                                  right: 5.0,
                                ),
                                child: Text(
                                  post.summary,
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 5.0,
                                right: 5.0,
                              ),
                              child: MaterialButton(
                                color: Colors.white.withOpacity(0.65),
                                onPressed: () => launch(post.url,),
                                child: Center(
                                  child: Text(
                                    'Read more',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: questionsPageBGColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
                  : Container(
                      height: height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.speaker_notes_off,
                            size: MediaQuery.of(context).size.width,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            'No news available. Check again later',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
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
