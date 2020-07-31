import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/rawData.dart';
import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectInsuranceScreen extends StatefulWidget {
  @override
  _SelectInsuranceScreenState createState() => _SelectInsuranceScreenState();
}

class _SelectInsuranceScreenState extends State<SelectInsuranceScreen> {
  int _selectedIndex;
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
                  CircleAvatar(backgroundColor: Colors.grey, radius: 3),
                  Text(' ' + DATE_SLOT + ' ', style: subHeaderStyle),
                  CircleAvatar(backgroundColor: Colors.grey, radius: 3),
                  Text(' ' + TIME_SLOT + ' ', style: subHeaderStyle),
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
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text('INSURANCE TYPE', style: subHeaderStyle),
                        SizedBox(height: 20),
                        Expanded(
                          child: Scrollbar(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: insurances.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: _selectedIndex == index
                                      ? themeColor
                                      : Colors.white,
                                  child: ListTile(
                                    title: Text(
                                      insurances[index],
                                      style: TextStyle(
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    trailing: Icon(Icons.arrow_forward_ios),
                                    onTap: () {
                                      _selectedIndex = index;
                                      setState(() {});
                                      Future.delayed(
                                          Duration(milliseconds: 100), () {
                                        return bookingConfirmDialog(context);
                                      });
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Center(child: Text("4 of 4", style: subHeaderStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
