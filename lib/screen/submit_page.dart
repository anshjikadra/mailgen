import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;

import 'first_page.dart';

class submit_page extends StatefulWidget {


  String ans;
  submit_page({required this.ans});

  @override
  State<submit_page> createState() => _submit_pageState();
}

class _submit_pageState extends State<submit_page> {



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


      setState(() {});

      // Navigator.of(context).push(
      //   MaterialPageRoute(
      //       builder: (context) =>
      //           submit_page(
      //             ans: jsonResponse['ans'],
      //           )),
      // );
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(onTap: () {
                  isLoding = false;
                  Navigator.pop(context);

                },child: Icon(Icons.arrow_back_ios)),
                GestureDetector(
                  onTap: () {
                    isLoding = false;
                    setState(() {

                    });
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Spacer(),
                Align(alignment: Alignment.topRight,
                  child: IconButton(onPressed: () {

                    Clipboard.setData(ClipboardData(text: widget.ans));

                    Fluttertoast.showToast(
                        msg: "Text Copied",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black38,
                        textColor: Colors.white,
                        fontSize: 16.0);
                    setState(() {});


                  }, icon:Icon(Icons.copy)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text("Generated email",
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
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Flexible(
                        child: ListView(
                          children: [
                            Center(child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('${widget.ans}',style: TextStyle(fontSize: 17)),
                            )),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                call_api();
                              },
                              child: Container(
                                margin: EdgeInsets.all(10),
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('#2e30e4'),
                                ),
                                child: Center(
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(height: 15,child: Image.asset('image/refresh-icon-white-0.jpeg',fit: BoxFit.cover)),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Regenrate",
                                        style: TextStyle(color: Colors.white,fontSize: 17),
                                      ),
                                    ],
                                  )
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Share.share("${widget.ans}");
                              },
                              child: Container(
                                margin:EdgeInsets.all(10),
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: HexColor('#2e30e4'),
                                ),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(height: 15,child: Image.asset('image/telegram-icon-512x512-z8lb0qsx.png',fit: BoxFit.cover)),
                                      SizedBox(width: 5,),
                                      Text(
                                        "Share",
                                        style: TextStyle(color: Colors.white,fontSize: 17),
                                      ),
                                    ],
                                  )
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
