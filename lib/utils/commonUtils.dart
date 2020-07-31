import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:dr_appointment/homescreens/homeScreen.dart';
import 'package:dr_appointment/utils/Model/appointmentModel.dart';

getScreenWidth(BuildContext ctx) => MediaQuery.of(ctx).size.width;
getScreenHeight(BuildContext ctx) => MediaQuery.of(ctx).size.height;

//---------------------------COLORS--------------------------
Color themeColor = Color(0x557566).withOpacity(1);
LinearGradient linearGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: <Color>[
    Color(0x557566).withOpacity(1),
      Color(0x557566).withOpacity(1),
//      Color(0x5C8BF7).withOpacity(1),
//      Color(0x4C45F5).withOpacity(1)
    ]);

//------------------TEXT STYLES----------------------------------

TextStyle headerStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Color(0x0C233C).withOpacity(1),
  fontSize: 30,
);
TextStyle subHeaderStyle = TextStyle(
  fontSize: 18,
  color: Color(0x222222).withOpacity(0.7),
);
TextStyle buttonTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 16,
);
TextStyle drNameStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 25,
);

//----------------------BUTTONS-------------------------------------//
raisedButtons({
  @required String text,
  @required onTap,
}) =>
    GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: linearGradient,
        ),
        child: Center(child: Text(text, style: buttonTextStyle)),
      ),
      onTap: onTap,
    );
// ----------------------------------BORDER RADIUS------------
borderRadius(double a) => BorderRadius.circular(a);

//-------------------------------Dialog----
bookingConfirmDialog(BuildContext ctx) {
  showDialog(
      barrierDismissible: false,
      context: ctx,
      builder: (ctx) => AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: borderRadius(10)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Image.asset('assets/diagBG.png', color: Colors.grey),
                      Image.asset(
                        'assets/date.png',
                        scale: 0.5,
                        color: themeColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text("Thanks for booking!", style: headerStyle),
                SizedBox(height: 10),
                Text("You booked an appointment with "
                    "$DR_NAME on $DATE_SLOT at $TIME_SLOT"),
                SizedBox(height: 50),
                raisedButtons(
                    text: 'GO TO MY APPOINTMENTS',
                    onTap: () {
                      bookAppointment(AppointmentModel(
                        drname: DR_NAME,
                        Date: DATE_SLOT,
                        Time: TIME_SLOT,
                      ));
                      Navigator.of(ctx).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (Route<dynamic> route) => false);
                    }),
                SizedBox(height: 10),
              ],
            ),
          ));
}
