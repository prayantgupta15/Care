import 'package:dr_appointment/bookAppointmentScreens/selectCategory.dart';
import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/rawData.dart';
import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectDRScreen extends StatefulWidget {
  @override
  _SelectDRScreenState createState() => _SelectDRScreenState();
}

class _SelectDRScreenState extends State<SelectDRScreen> {
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
              Text('Book Appointment in Smile', style: subHeaderStyle),
              SizedBox(height: 20),
              Container(
                constraints: BoxConstraints(
                  maxHeight: getScreenHeight(context) * 0.7,
                ),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: borderRadius(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 10),
                        Text('SELECT DENTIST', style: subHeaderStyle),
                        SizedBox(height: 20),
                        Expanded(
                          child: Scrollbar(
                            child: ListView.separated(
                              separatorBuilder: (context, index) => Divider(),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: DoctorsList.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  color: _selectedIndex == index
                                      ? themeColor
                                      : Colors.white,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundImage:
                                          AssetImage('assets/person.png'),
                                      backgroundColor: Colors.white,
                                    ),
                                    title: Text(
                                      DoctorsList[index],
                                      style: TextStyle(
                                        color: _selectedIndex == index
                                            ? Colors.white
                                            : Colors.black,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Dentist-Ortho',
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
                                      DR_NAME = DoctorsList[_selectedIndex];
                                      Future.delayed(
                                          Duration(milliseconds: 100), () {
                                        Navigator.push(
                                            context,
                                            CupertinoPageRoute(
                                                builder: (context) =>
                                                    SelectCategoryScreen()));
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
              Center(child: Text("1 of 4", style: subHeaderStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
