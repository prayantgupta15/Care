import 'package:dr_appointment/bookAppointmentScreens/paymentScreen.dart';
import 'package:dr_appointment/bookAppointmentScreens/selectInsurance.dart';
import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/rawData.dart';
import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectSlotScreen extends StatefulWidget {
  @override
  _SelectSlotScreenState createState() => _SelectSlotScreenState();
}

class _SelectSlotScreenState extends State<SelectSlotScreen> {
  Map<int, int> _selectedIndex = {0: 0};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.05),
              Text('Book Appointment', style: headerStyle),
              SizedBox(height: 10),
              Row(
                children: <Widget>[
                  Text(DR_NAME + ' ', style: subHeaderStyle),
                  CircleAvatar(backgroundColor: Colors.grey, radius: 3),
                  Text(' ' + CATEGORY + ' ', style: subHeaderStyle),
                ],
              ),
              SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(
                  maxHeight: getScreenHeight(context) * 0.7,
                ),
                child: Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text(DR_NAME + ' SLOTS', style: subHeaderStyle),
                        SizedBox(height: 20),
                        Expanded(
                          child: Scrollbar(
                            child: ListView.builder(
                                itemCount: slots.length,
                                itemBuilder: (context, dateIndex) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(slots.keys.toList()[dateIndex]),
                                      SizedBox(height: 10),
                                      GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          crossAxisSpacing: 10,
                                          mainAxisSpacing: 10,
                                          childAspectRatio: 2,
                                        ),
                                        shrinkWrap: true,
                                        physics: BouncingScrollPhysics(),
                                        itemCount: slots[
                                                slots.keys.toList()[dateIndex]]
                                            .length,
                                        itemBuilder: (context, timeIndex) {
                                          List<String> timeSlots = slots[
                                              slots.keys.toList()[dateIndex]];
                                          return GestureDetector(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: dateIndex ==
                                                                _selectedIndex
                                                                        .keys
                                                                        .toList()[
                                                                    0] &&
                                                            timeIndex ==
                                                                _selectedIndex
                                                                    .values
                                                                    .toList()[0]
                                                        ? linearGradient
                                                        : null,
                                                    borderRadius:
                                                        borderRadius(10),
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    )),
                                                child: Center(
                                                  child: Text(
                                                    timeSlots[timeIndex],
                                                    style: TextStyle(
                                                      color: slots.keys.toList()[
                                                                      dateIndex] ==
                                                                  DATE_SLOT
//                                                                  _selectedIndex
//                                                                          .keys
//                                                                          .toList()[
//                                                                      0]
                                                              &&
                                                              timeIndex ==
                                                                  _selectedIndex
                                                                      .values
                                                                      .toList()[0]
                                                          ? Colors.white
                                                          : Colors.black,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                DATE_SLOT = slots.keys
                                                    .toList()[dateIndex];
                                                TIME_SLOT = slots.values
                                                        .toList()[dateIndex]
                                                    [timeIndex];
                                                _selectedIndex = {
                                                  dateIndex: timeIndex
                                                };
                                                setState(() {});
                                                Future.delayed(
                                                    Duration(milliseconds: 100),
                                                    () {
                                                  Navigator.push(
                                                      context,
                                                      CupertinoPageRoute(
                                                          builder: (context) =>
//                                                              SelectInsuranceScreen()
                                                      PaymentScreen()
                                                      ));
                                                });
                                              });
                                        },
                                      ),
                                      SizedBox(height: 20),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(child: Text("3 of 4", style: subHeaderStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
