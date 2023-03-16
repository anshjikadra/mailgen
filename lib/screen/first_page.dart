import 'dart:convert';
import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mailgen/screen/setting_page.dart';
import 'package:mailgen/screen/submit_page.dart';
import 'package:http/http.dart' as http;

Color bgcolor = Color(0xFFf4f3fa);
bool isLoding = false;

TextEditingController fName = TextEditingController();
TextEditingController toName = TextEditingController();
TextEditingController keyPoint = TextEditingController();

int limit=700;

class first_page extends StatefulWidget {
  const first_page({Key? key}) : super(key: key);

  @override
  State<first_page> createState() => _first_pageState();
}

class _first_pageState extends State<first_page> {



  List sTone = [
    '🙂 Friendly',
    '💎 Luxury',
    '😊 Relaxed',
    '💼 Professional',
    '⛰️ Adventurous',
    '💡 Witty',
    '👩‍🌾 Persuasive',
    '💪 Bold',
    '🤗 Empathetic'
  ];

  List sLength = ['🚲 Short', '🚗 Medium', '✈ ️Long'];
  String st = '🙂 Friendly';
  String sl = '🚗 Medium';




//<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>

  Future call_api() async {
    setState(() {
      isLoding = true;
    });

    var request = http.MultipartRequest('POST',
        Uri.parse('https://drawing-how-to-draw.com/chatgpt/api/chat_gpt'),
    );

    request.headers['Authorization'] = 'Bearer rZ79vbE6Gq1RU8kvVZKx9IvNo21hSdWkJEde5iYIGN3l0fycTawUXqjY92Yu';
    // print("-------------------login api ${'http://192.168.1.34/vidhi/laravel/dayworkout/api/user_login'}");
    print("-------------------login api ${'https://drawing-how-to-draw.com/chatgpt/api/chat_gpt'}");

    request.fields.addAll({
      'q':'Write email from ${fName.text} to ${toName.text} on ${keyPoint.text} topic',
      'app_id': '11',
      'limit':int.parse(limit.toString()).toString(),
      // 'limit':limit.toString(),
    });

    print("---------------------------quetion ${fName.text}");
    print("+++++++${limit}");
    print("---------------------------quetion ${toName.text}");
    print("---------------------------quetion ${keyPoint.text}");
    print("---------------------------app_id");
    print("Waiting....");

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(await response.stream.bytesToString());
      print("==========login $jsonResponse========");
      print("=========${jsonResponse['ans']}========");

      // String date='${dt.day}-${dt.month} ${dt.hour}:${dt.minute}';
      // String formattedDate = DateFormat('dd-MMMM y').format(dt);

      String ans = jsonResponse['ans'];
      if (ans.startsWith("\n")) {
        ans = ans.substring(1, ans.length);
        if (ans.startsWith("\n")) {
          ans = ans.substring(1, ans.length);
        }
      }

      // DB.save(H_data(
      //     question_data: myText.text,
      //     ans_data: ans,
      //     current_time: formattedDate));
      setState(() {});

      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) =>
                submit_page(
                  ans: jsonResponse['ans'],
                )),
      );
      isLoding=false;
      setState(() {

      });

      if (jsonResponse['success'] == "1") {
        //SharedPreferences sp = await SharedPreferences.getInstance();
        // sp.setString("user_id", jsonResponse['data']['id'].toString());

        // print("LOGIN_SCREEN_USER_ID_SET------------${sp.getString("user_id")}");

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            // content: Text('Invalid Mobile Number or Password!'),
            content: Text("User Login Successful"),
          ),
        );

        // loading(false);
        setState(() {
          isLoding = false;
        });
      }
      else if (jsonResponse['success'] == "0") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // content: Text('Invalid Mobile Number or Password!'),
            content: Text(jsonResponse['message'].toString()),
          ),
        );
        setState(() {
          isLoding = false;
        });
      }
      else if (jsonResponse['code'] == 400) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Invalid Mobile Number or Password!'),
          ),
        );
        setState(() {
          isLoding = false;
        });

        // box('Invalid Mobile Number or Password!');
        // loading(false);
        // const CircularProgressIndicator();
      }
    } else {
      setState(() {
        isLoding = false;
      });
      print("Waiting.....");
      print(response.reasonPhrase);
    }
  }

//<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>








  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text("Smart email generator",
                          style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.bold))),
                  Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return setting_page();
                          },));
                        },
                        child: Icon(
                          Icons.settings,
                          size: 25,
                        ),
                      )),

                ],
              ),



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
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Flexible(
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "From name",
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextField(
                                    controller: fName,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'From name (Optional)'),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: bgcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "To name",
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextField(
                                    controller: toName,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'To name (Optional)'),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: bgcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Key points",
                                style: TextStyle(fontSize: 20),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  width: double.infinity,
                                  height: 50,
                                  child: TextField(
                                    controller: keyPoint,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'In short,write the main topic of your email'),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: bgcolor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Text("Select tone", style: TextStyle(fontSize: 20)),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                  // direction: Axis.vertical,
                                  runSpacing: 15,
                                  spacing: 15,
                                  // runAlignment: WrapAlignment.center,
                                  children: sTone
                                      .map((i) => GestureDetector(
                                          onTap: () {
                                            print("${i}");
                                            st = i;
                                            setState(() {});
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: st == i
                                                      ? HexColor('#2e30e4')
                                                      : bgcolor),
                                              child: Text(
                                                '$i',
                                                style: TextStyle(
                                                    color: st == i
                                                        ? Colors.white
                                                        : null),
                                              ))))
                                      .toList()),
                              SizedBox(
                                height: 25,
                              ),
                              Text(
                                "Select length",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Wrap(
                                  // direction: Axis.vertical,
                                  runSpacing: 15,
                                  spacing: 15,
                                  // runAlignment: WrapAlignment.center,
                                  children: sLength
                                      .map((j) => GestureDetector(
                                          onTap: () {
                                            print("${j}");
                                            sl = j;
                                            if(sl=='🚲 Short')
                                              {
                                                limit=300;
                                                print(limit);
                                              }
                                            if(sl=='✈ ️Long')
                                              {
                                                limit=1000;
                                                print(limit);
                                              }
                                            if(sl=='🚗 Medium')
                                              {
                                                limit=500;
                                                print(limit);
                                              }
                                            setState(() {});
                                          },
                                          child: AnimatedContainer(
                                              duration:
                                                  Duration(milliseconds: 100),
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10,
                                              ),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: sl == j
                                                      ? HexColor('#2e30e4')
                                                      : bgcolor),
                                              child: Text(
                                                '$j',
                                                style: TextStyle(
                                                    color: sl == j
                                                        ? Colors.white
                                                        : null),
                                              ))))
                                      .toList()),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(
                            //   builder: (context) {
                            //     return submit_page();
                            //   },
                            // ));

                             call_api();

                          },
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Expanded(
                              child: Container(
                                margin: EdgeInsets.all(10),
                                width: double.infinity,
                                height: 60,
                                child: isLoding?Center(child: CircularProgressIndicator()):Center(
                                    child: Text(
                                  "Write for me ✍️",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('#2e30e4'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
        backgroundColor: bgcolor,
      ),
    );
  }
}
