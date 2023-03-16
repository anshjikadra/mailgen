import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class privacy_police extends StatefulWidget {
  const privacy_police({Key? key}) : super(key: key);

  @override
  State<privacy_police> createState() => _privacy_policeState();
}

class _privacy_policeState extends State<privacy_police> {

  String privacy='';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load_privacy();

  }
  load_privacy()
  async{
    privacy=await rootBundle.loadString('assets/privacy.txt');
    setState(() {

    });
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
                    child: Text("Privacy Police",
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
                      child:Flexible(
                        child: ListView(
                          padding: EdgeInsets.all(10),
                          children: [
                            Text(privacy,style: TextStyle(fontSize: 17),)
                          ],
                        ),
                      )
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
