// indicator loading for donationsSummary
import 'package:flutter/material.dart';

Widget summaryLoading(BuildContext context, double width) {
  return Container(
    height: 160.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 160.0,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Container(
              width: width * 0.4,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
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
                      width: width * 0.4,
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 30.0,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'loading..',
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
                            'loading..',
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
}
