import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/Model/appointmentModel.dart';
import 'package:dr_appointment/bookAppointmentScreens/SelectDRScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//NAVIGATION BAR ITEM 0

class YourAppointmentsScreen extends StatefulWidget {
  @override
  _YourAppointmentsScreenState createState() => _YourAppointmentsScreenState();
}

class _YourAppointmentsScreenState extends State<YourAppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: getScreenHeight(context) * 0.05),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text("Your Appointments", style: headerStyle),
        ),
        SizedBox(height: 20),
        //IF NO APPOINTMENTS BOOKED SHOW THIS COLUMN
        appointmentsList.length == 0
            ? Column(
                children: <Widget>[
                  Container(
                    height: 200,
                    child: Center(
                      child: Image.asset('assets/noApp.png',color: themeColor),
                    ),
                  ),
                  Text(
                    "You have no scheduled",
                    style: subHeaderStyle,
                  ),
                  SizedBox(height: 80),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(context) * 0.2),
                    child: raisedButtons(
                        text: 'BOOK',
                        onTap: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => SelectDRScreen()));
                        }),
                  )
                ],
              )
            : Flexible(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: appointmentsList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: index != appointmentsList.length - 1
                            ? EdgeInsets.fromLTRB(30, 30, 0, 80)
                            : EdgeInsets.fromLTRB(30, 30, 30, 80),
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius(20),
                        ),
                        elevation: 5,
                        child: Container(
                          width: 300,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          decoration: BoxDecoration(
                            gradient: linearGradient,
                            borderRadius: borderRadius(20),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                "Consultation with",
                                style: drNameStyle,
                              ),
                              //DR NAME
                              Text(
                                appointmentsList[index].drname,
                                style: drNameStyle,
                              ),
                              SizedBox(height: 10),
                              //DATE
                              ListTile(
                                leading: Image.asset('assets/date.png',
                                    color: Colors.white),
                                title: Text(
                                  appointmentsList[index].Date,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10),
                              //TIME
                              ListTile(
                                leading: Image.asset('assets/time.png',
                                    color: Colors.white),
                                title: Text(
                                  appointmentsList[index].Time,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10),
                              //ADDRESS
                              ListTile(
                                leading: Image.asset('assets/location.png',
                                    color: Colors.white),
                                title: Text(
                                  appointmentsList[index].Add,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              SizedBox(height: 10), SizedBox(height: 10),
                              //phone
                              ListTile(
                                leading: Image.asset('assets/phone.png',
                                    color: Colors.white),
                                title: Text(
                                  appointmentsList[index].Phone,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              )
      ],
    );
  }
}
