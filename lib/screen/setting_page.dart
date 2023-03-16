import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mailgen/screen/first_page.dart';
import 'package:mailgen/screen/privacy_police.dart';
import 'package:mailgen/screen/terms_condition.dart';
import 'package:rate_my_app/rate_my_app.dart';

class setting_page extends StatefulWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  State<setting_page> createState() => _setting_pageState();
}

class _setting_pageState extends State<setting_page> {





  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 0,
    minLaunches: 2,
    googlePlayIdentifier: 'gujarati.kids.learning',
    appStoreIdentifier: '1661741363',
  );



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(onTap: () {

                      Navigator.pop(context);

                    },child: Icon(Icons.arrow_back_ios)),
                    GestureDetector(
                      onTap: () {

                        setState(() {

                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Back",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text("Settings",
                        style:
                        TextStyle(fontSize: 27, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 35,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Flexible(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder: (context) {
                                  return terms_condition();
                                },));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Container(
                                  height: 90,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: bgcolor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15,15,0,10),
                                        child: Text("Terms and conditions",style: TextStyle(fontSize: 20),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15,0,0,10),
                                        child: Row(
                                          children: [

                                            Icon(Icons.description,color: Color(0xFFc2ccd6)),
                                            SizedBox(width: 5,),
                                            Text("Visit our terms and conditions ",style: TextStyle(fontSize: 17),),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,MaterialPageRoute(builder:(context) {

                                  return privacy_police();
                                },));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Container(
                                  height: 85,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: bgcolor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15,15,0,10),
                                        child: Text("Privacy Policy",style: TextStyle(fontSize: 20),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15,0,0,10),
                                        child: Row(
                                          children: [

                                            Icon(Icons.privacy_tip,color: Color(0xFFc2ccd6)),
                                            SizedBox(width: 5,),
                                            Text("Visit our privacy policy",style: TextStyle(fontSize: 17),),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 25),
                              child: Container(
                                height: 90,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: bgcolor,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(15,15,0,10),
                                      child: Text("About MailGen",style: TextStyle(fontSize: 20),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(15,0,0,10),
                                      child: Row(
                                        children: [

                                          Icon(Icons.mail,color: Color(0xFFc2ccd6),),
                                          SizedBox(width: 5,),
                                          Text("Version 1.0.3",style: TextStyle(fontSize: 17),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                rating();
                                setState(() {

                                });

                              },
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Container(
                                  height: 90,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: bgcolor,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15,15,0,10),
                                        child: Text("Rate Us",style: TextStyle(fontSize: 20),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(15,0,0,10),
                                        child: Row(
                                          children: [

                                            Icon(Icons.star_half,color: Color(0xFFc2ccd6),),
                                            SizedBox(width: 5,),
                                            Text("Rate My App",style: TextStyle(fontSize: 17),),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  rating()
  {
    rateMyApp.showStarRateDialog(
      context,
      title: 'Rate this app',
      // The dialog title.
      message:"You like this app ? Then take a little bit of your time to leave a rating :",
      actionsBuilder: (context, stars) {

        return [
          TextButton(
            child: const Text('OK',style: TextStyle(fontFamily: "Myfontlight",color: Colors.black),),
            onPressed: () async {
              print('Thanks for the ' +
                  (stars == null ? '0' : stars.round().toString()) + ' star(s) !');

              await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
              Navigator.pop<RateMyAppDialogButton>(context, RateMyAppDialogButton.rate);

            },
          ),
        ];
      },
      ignoreNativeDialog: Platform.isAndroid,
      dialogStyle: const DialogStyle(
        titleAlign: TextAlign.center,
        messageAlign: TextAlign.center,
        messagePadding: EdgeInsets.only(bottom: 20),
      ),
      starRatingOptions: const StarRatingOptions(),
      onDismissed: () => rateMyApp.callEvent(RateMyAppEventType.laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
    );



  }
}
