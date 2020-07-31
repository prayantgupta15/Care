import 'package:dr_appointment/signUp/createAccountScreen.dart';
import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class EnterCodeScreen extends StatefulWidget {
  String PhoneNumber;
  EnterCodeScreen({@required this.PhoneNumber});
  @override
  _EnterCodeScreenState createState() => _EnterCodeScreenState();
}

class _EnterCodeScreenState extends State<EnterCodeScreen> {
  TextEditingController controller = TextEditingController(text: "");
  bool showOTPerror = false;
  String error = 'hh';
  void onTap() {
    if (controller.text.length != 6) {
      print("OTP not correct");
      setState(() {
        showOTPerror = true;
        error = 'Incorrect OTP';
      });
    } else {
      print("OTP Correct");
      Navigator.pushReplacement(context,
          CupertinoPageRoute(builder: (context) => CreateAccountScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: ListView(
            children: <Widget>[
              SizedBox(height: getScreenHeight(context) * 0.2),
              Center(child: Text(VERIFICATION_CODE, style: headerStyle)),
              SizedBox(height: 20),
              Text(CODE_SENT + widget.PhoneNumber, style: subHeaderStyle),
              SizedBox(height: 50),
              PinCodeTextField(
                controller: controller,
                highlight: true,
                highlightColor: Colors.black,
                defaultBorderColor: themeColor,
                hasTextBorderColor: Colors.grey,
                maxLength: 6,
                pinBoxHeight: getScreenWidth(context) / 8,
                pinBoxWidth: getScreenWidth(context) / 8,
                onDone: (otp) {
                  if (otp != null && otp.length == 6)
                    setState(() {
                      showOTPerror = false;
                    });
                },
              ),
              SizedBox(height: 10),
              Visibility(
                visible: showOTPerror,
                child: Text(error, style: TextStyle(color: Colors.redAccent)),
              ),
              SizedBox(height: 50),
              raisedButtons(text: 'NEXT', onTap: onTap),
              SizedBox(height: getScreenHeight(context) * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
