import 'package:dr_appointment/bookAppointmentScreens/selectSlot.dart';
import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/rawData.dart';
import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCategoryScreen extends StatefulWidget {
  @override
  _SelectCategoryScreenState createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
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
              Text(DR_NAME, style: subHeaderStyle),
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
                        Text('NOW WE MAY HELP', style: subHeaderStyle),
                        SizedBox(height: 20),
                        Expanded(
                          child: Scrollbar(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                childAspectRatio: 1.3,
                              ),
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          gradient: _selectedIndex == index
                                              ? linearGradient
                                              : null,
                                          borderRadius: borderRadius(10),
                                          border: Border.all(
                                            color: Colors.grey,
                                          )),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Image.asset(
                                              'assets/${iconName[index]}.png',
                                              color: _selectedIndex == index
                                                  ? Colors.white
                                                  : themeColor,
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              categories[index],
                                              style: TextStyle(
                                                color: _selectedIndex == index
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      _selectedIndex = index;
                                      setState(() {
                                        Future.delayed(
                                            Duration(milliseconds: 100), () {
                                          CATEGORY = categories[index];
                                          Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                  builder: (context) =>
                                                      SelectSlotScreen()));
                                        });
                                      });
                                    });
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
              Center(child: Text("2 of 4", style: subHeaderStyle)),
            ],
          ),
        ),
      ),
    );
  }
}
