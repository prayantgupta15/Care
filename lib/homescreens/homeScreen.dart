import 'package:dr_appointment/homescreens/profileScreen.dart';
import 'package:dr_appointment/homescreens/yourAppointmentScreen.dart';
import 'package:dr_appointment/bookAppointmentScreens/SelectDRScreen.dart';
import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPage = 0;
  final _pageOptions = [
    YourAppointmentsScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pageOptions[_selectedPage],
        floatingActionButton: FloatingActionButton(
          backgroundColor: themeColor,
          child: Icon(Icons.add),
          tooltip: 'Book Appointment',
          onPressed: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (ctx) => SelectDRScreen()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          elevation: 5,
          currentIndex: _selectedPage,
          onTap: (_index) {
            setState(() {
              _selectedPage = _index;
            });
          },
          items: [
            BottomNavigationBarItem(
              title: Text(
                'Appointments',
                style: TextStyle(
                  color: _selectedPage == 0 ? themeColor : Colors.grey,
                ),
              ),
              activeIcon: Image.asset(
                'assets/list.png',
                color: themeColor,
              ),
              icon: Image.asset(
                'assets/list.png',
                color: Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: _selectedPage == 1 ? themeColor : Colors.grey,
                  ),
                ),
                activeIcon: Image.asset(
                  'assets/profile.png',
                  color: themeColor,
                ),
                icon: Image.asset(
                  'assets/profile.png',
                  color: Colors.grey,
                )
//
//
                ),
          ],
        ),
      ),
    );
  }
}
