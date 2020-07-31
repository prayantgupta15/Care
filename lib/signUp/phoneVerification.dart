import 'package:dr_appointment/signUp/enterCodeScreen.dart';
import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class PhoneVerificationScreen extends StatefulWidget {
  @override
  _PhoneVerificationScreenState createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  Country _selected = Country.IN;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  void onTap() {
    print(phoneController.text.toString());
    if (_formKey.currentState.validate()) {
      print("Phone Number Entered Correctly");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  EnterCodeScreen(PhoneNumber: phoneController.text)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                SizedBox(height: getScreenHeight(context) * 0.2),
                Center(child: Text(WELCOME, style: headerStyle)),
                SizedBox(height: 20),
                Text(ENTER_PH_NO, style: subHeaderStyle),
                SizedBox(height: 50),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        CountryPicker(
                          dense: false,
                          showFlag: true, //displays flag, true by default
                          showDialingCode:
                              true, //displays dialing code, false by default
                          showName:
                              false, //displays country name, true by default
                          showCurrency: false, //eg. 'British pound'
                          showCurrencyISO: false, //eg.// 'GBP'
                          onChanged: (Country country) {
                            setState(() {
                              _selected = country;
                            });
                          },
                          selectedCountry: _selected,
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: TextFormField(
                            controller: phoneController,
                            validator: (str) {
                              str = str.trim();
                              if (str.isEmpty || str.length == 0)
                                return 'Enter Phone Number';
                              else {
                                if (str.length != 10)
                                  return 'Enter Valid Phone Number';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(
                                  color: themeColor,
                                  width: 5,
                                ),
                              ),
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(color: themeColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50),
                raisedButtons(text: 'NEXT', onTap: onTap),
                SizedBox(height: getScreenHeight(context) * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
