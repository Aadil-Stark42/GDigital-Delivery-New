import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdigitaldelivery/screens/onboarding/OtpVerificationScreen.dart';

import '../../res/ResColor.dart';
import '../../res/ResString.dart';
import '../../utils/Utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String mobileNumber = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("${imagePath}img_login_bg.png"))),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                padding: const EdgeInsets.only(
                    left: 15, right: 15, bottom: 30, top: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      gDeliveryStart,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 21,
                          fontFamily: ralewayBold,
                          color: blackColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      enterMobile,
                      style: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                          fontFamily: ralewayMedium),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: greyColor3)),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "+91",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: poppinsMedium,
                                color: blackColor),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: 1.5,
                            color: blackColor,
                            height: 15,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: TextFormField(
                              cursorColor: blackColor,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                setState(() {
                                  mobileNumber = value;
                                });
                              },
                              style: TextStyle(
                                  fontFamily: ralewayMedium,
                                  fontSize: 15, //14
                                  color: blackColor),
                              //EditTextColor
                              decoration: InputDecoration(
                                hintText: enterMobile,
                                hintStyle: TextStyle(
                                    color: greyColor,
                                    fontFamily: ralewayMedium),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    mobileNumber.length > 9
                        ? InkWell(
                            onTap: () {
                              hideKeyBoard();
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OtpVerificationScreen(mobileNumber)),
                              );
                            },
                            child: Image.asset(
                              "${imagePath}img_enable_continue.png",
                              height: 55,
                            ),
                          )
                        : Image.asset(
                            "${imagePath}img_disable_continue.png",
                            height: 55,
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "By signing up you agree to our ",
                          style: TextStyle(
                              color: greyColor,
                              fontSize: 12,
                              fontFamily: ralewaySemiBold),
                        ),
                        Text(
                          "Terms of Use ",
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 12,
                              fontFamily: ralewaySemiBold),
                        ),
                        Text(
                          "and ",
                          style: TextStyle(
                              color: greyColor,
                              fontSize: 12,
                              fontFamily: ralewaySemiBold),
                        ),
                        Text(
                          "Privacy Policy ",
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 12,
                              fontFamily: ralewaySemiBold),
                        )
                      ],
                    )
                  ],
                ),
              )),
          Positioned(
              right: 5,
              bottom: 295,
              child: Image.asset(
                "${imagePath}img_leaf.png",
                width: 45,
                height: 35,
                fit: BoxFit.cover,
              ))
        ],
      ),
    ));
  }
}
