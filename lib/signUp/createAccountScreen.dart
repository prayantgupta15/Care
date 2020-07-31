import 'package:dr_appointment/utils/commonUtils.dart';
import 'package:dr_appointment/utils/userData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dr_appointment/signUp/hiNameScreen.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  void onTap() {
    nameController.text = nameController.text.trim();
    print(nameController.text.toString());
    if (_formKey.currentState.validate()) {
      USER_NAME = nameController.text;
      print("Name Entered Correctly");
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HiNameScreen(name: nameController.text)));
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
                Center(child: Text('Create Account', style: headerStyle)),
                SizedBox(height: 20),
                Center(child: Text('Enter your Name', style: subHeaderStyle)),
                SizedBox(height: 50),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: nameController,
                      validator: (str) {
                        str = str.trim();
                        if (str.isEmpty || str.length == 0) return 'Enter name';
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: themeColor,
                            width: 5,
                          ),
                        ),
                        labelText: 'Full Name',
                        labelStyle: TextStyle(color: themeColor),
                      ),
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                raisedButtons(text: "LET'S START", onTap: onTap),
                SizedBox(height: getScreenHeight(context) * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
