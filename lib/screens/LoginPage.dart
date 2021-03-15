import 'package:flutter/material.dart';
import 'package:my_project/screens/HomePage.dart';
import 'package:polygon_clipper/polygon_clipper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController name = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  final mobileNumberFocus = FocusNode();
  bool _checkBox = false;

  @override
  Widget build(BuildContext context) {
    var east;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left: 40, top: 50, bottom: 30),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 45,
                      child: ClipOval(
                        child: Container(color: Colors.blue),
                      ),
                    ),
                    SizedBox(width: 25),
                    Text(
                      "My Project",
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    )
                  ],
                )),
            Stack(children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.68,
              ),
              Positioned(
                  left: MediaQuery.of(context).size.height * 0.05,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: ClipPolygon(
                          sides: 5,
                          borderRadius: 30,
                          rotate: 30,
                          boxShadows: [
                            PolygonBoxShadow(
                                color: Colors.black, elevation: 1.0),
                          ],
                          child: Container(
                            color: Colors.white70,
                          )))),
              Positioned(
                  left: MediaQuery.of(context).size.height * 0.05,
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: ClipPolygon(
                          sides: 5,
                          borderRadius: 18,
                          boxShadows: [
                            PolygonBoxShadow(
                                color: Colors.black, elevation: 1.0),
                          ],
                          child: Container(
                              color: Colors.white,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .20,
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .65,
                                        margin: EdgeInsets.only(
                                          left: 65,
                                          bottom: 20,
                                        ),
                                        child: TextField(
                                          style: TextStyle(color: Colors.blue),
                                          controller: name,
                                          keyboardType: TextInputType.text,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(Icons.person,
                                                color: Colors.blue),
                                            labelText: "Name",
                                            labelStyle:
                                                TextStyle(color: Colors.blue),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue)),
                                          ),
                                          textInputAction: TextInputAction.next,
                                          onEditingComplete: () =>
                                              FocusScope.of(context)
                                                  .requestFocus(
                                                      mobileNumberFocus),
                                        )),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .65,
                                        margin: EdgeInsets.only(
                                          left: 65,
                                          bottom: 10,
                                        ),
                                        child: TextField(
                                          style: TextStyle(color: Colors.blue),
                                          controller: mobileNumber,
                                          keyboardType: TextInputType.number,
                                          cursorColor: Colors.black,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(Icons.call,
                                                color: Colors.blue),
                                            labelText: "Mobile Number",
                                            labelStyle:
                                                TextStyle(color: Colors.blue),
                                            enabledBorder:
                                                new UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue)),
                                            focusedBorder:
                                                new UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.blue)),
                                          ),
                                          focusNode: mobileNumberFocus,
                                          textInputAction: TextInputAction.done,
                                          onEditingComplete: () =>
                                              FocusScope.of(context).unfocus(),
                                        )),
                                    Container(
                                        margin: EdgeInsets.only(
                                            bottom: 0,
                                            top: 0,
                                            left: 50,
                                            right: 20),
                                        child: Row(children: <Widget>[
                                          Checkbox(
                                              activeColor: Colors.blue,
                                              value: _checkBox,
                                              onChanged: (val) {
                                                _checkBox = val;
                                                setState(() {});
                                              }),
                                          Text(
                                              "I agree to all Terms & Conditions",
                                              style:
                                                  TextStyle(color: Colors.blue))
                                        ])),
                                  ]))))),
              Positioned(
                  bottom: 0,
                  right: MediaQuery.of(context).size.width * 0.50,
                  child: SizedBox(
                    width: 90,
                    height: 90,
                    child: ClipPolygon(
                        sides: 5,
                        borderRadius: 18,
                        boxShadows: [
                          PolygonBoxShadow(color: Colors.black, elevation: 1.0),
                        ],
                        child: RaisedButton(
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            child: Icon(
                              Icons.east,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              if (name.text.isEmpty) {
                                _showToast("Name cannot be Empty");
                              } else if (mobileNumber.text.isEmpty) {
                                _showToast("Phone Number cannot be Empty");
                              } else if (!(mobileNumber.text.length == 10)) {
                                _showToast(
                                    "Phone Number should be of 10 letters");
                              } else {
                                _checkBox
                                    ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()))
                                    : _showToast("Tick the Check Box");
                              }
                            })),
                  )),
            ]),
          ],
        ),
      ),
    ));
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
        msg: "$message",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
