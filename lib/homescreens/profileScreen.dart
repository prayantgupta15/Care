import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
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
          Center(child: Text('Hi! ' + USER_NAME, style: headerStyle)),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
