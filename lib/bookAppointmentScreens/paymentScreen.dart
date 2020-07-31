import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.05),
              Text('PAYMENT', style: headerStyle),
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
                        Text('PAY TO CONFIRM APPOINTMENT', style: subHeaderStyle),
                        SizedBox(height: 30),
                        Text("Consultation Fees:  Rs 100"),
                        SizedBox(height: 20),
                        Text("Consultation Fees:  Rs 100"),
                        SizedBox(height: 30),
                        raisedButtons(text: 'PAY', onTap: (){
                          bookingConfirmDialog(context);
                        })

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          constraints: BoxConstraints(
            maxHeight: getScreenHeight(context)*0.1,
          ),
          child: Center(child: Text("4 of 4", style: subHeaderStyle)),
        ),
      ),
    );
  }
}
