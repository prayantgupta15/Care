import 'package:dr_appointment/homescreens/homeScreen.dart';
import 'package:dr_appointment/signUp/phoneVerification.dart';
import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HiNameScreen extends StatefulWidget {
  String name;
  HiNameScreen({@required this.name});
  @override
  _HiNameScreenState createState() => _HiNameScreenState();
}

class _HiNameScreenState extends State<HiNameScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.2),
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset('assets/diagBG.png', color: Colors.grey),
                    Image.asset('assets/person.png',color:themeColor),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(child: Text('Hi! ' + widget.name, style: headerStyle)),
              SizedBox(height: 30),
              Text(
                'We’ve found that you already visited '
                'Smile and can automatically create your account using information from your patient folder',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              raisedButtons(
                  text: "OK! Let's Start",
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => HomeScreen()));
                  }),
              SizedBox(height: 50),
              Center(
                child: GestureDetector(
                  child: Text('This is not me',
                      style: TextStyle(
                        color: themeColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => PhoneVerificationScreen()),
                        (Route<dynamic> route) => false);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
