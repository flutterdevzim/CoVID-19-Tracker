import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

final List<String> hospitalList = [
  'National Emergency',
  'Wilkins Hospital',
  'Thorngroove Hospital ',
  'Mutare Hospital',
  'Gweru Hospital',
  'Masvingo Hospital',
];

final List<String> numberList = [
  '08002000',
  '08009000',
  '08009001',
  '08009002',
  '08009003',
  '08009004',
];

class HotlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: questionsPageBGColor,
          appBar: AppBar(
            backgroundColor: questionsPageBGColor,
            centerTitle: true,
            title: Text(
              'Covid-19 Hotline Numbers',
              style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    itemBuilder: (context, position) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(hospitalList[position],
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,)
                            ),
                            Text(numberList[position],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.white,),
                            ),
                            FlatButton(
                              color: Colors.pink[200],
                              onPressed: () {
                                // Open dailer to call number
                                String phoneCall = 'tel:' + numberList[position];
                                launch(phoneCall);
                              },
                              child: Text('Call'),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: hospitalList.length,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Ministry of Health on WhatsApp',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,)
                    ),
                    FlatButton(
                      color: Colors.pink[200],
                      onPressed: () {
                        // Open dailer to call number
                        String openWhatsApp = 'https://api.whatsapp.com/send?phone=263714734593';
                        launch(openWhatsApp);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Chat'),
                          Icon(Icons.message),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
