import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class terms_condition extends StatefulWidget {
  const terms_condition({Key? key}) : super(key: key);

  @override
  State<terms_condition> createState() => _terms_conditionState();
}

class _terms_conditionState extends State<terms_condition> {

  String terms='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load_terms();
  }
  load_terms()async{

    terms=await rootBundle.loadString('assets/terms.txt');
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
                    child: Text("Terms and Conditions",
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
                              Text(terms,style: TextStyle(fontSize: 17),)
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
