import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gdigitaldelivery/screens/home/HomeScreen.dart';

import '../../components/otpview/otp_field.dart';
import '../../components/otpview/otp_field_style.dart';
import '../../components/otpview/style.dart';
import '../../res/ResColor.dart';
import '../../res/ResString.dart';
import '../../utils/Utils.dart';

class OtpVerificationScreen extends StatefulWidget {
  String mobileNumber;

  OtpVerificationScreen(this.mobileNumber, {Key? key}) : super(key: key);

  @override
  OtpVerificationScreenState createState() => OtpVerificationScreenState();
}

class OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String otpStr = "";

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
                    image: AssetImage("${imagePath}img_otp_bg.png"))),
          ),
          Positioned(
              top: 100,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            verifyMobile,
                            style: TextStyle(
                                fontSize: 30,
                                fontFamily: ralewayBold,
                                color: blackColor),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          Text(
                            "Enter the OTP send to ${widget.mobileNumber}",
                            style: TextStyle(
                                color: greyColor,
                                fontSize: 13,
                                height: 1.0,
                                fontFamily: poppinsRegular),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    OTPTextField(
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 64,
                      otpFieldStyle: OtpFieldStyle(
                        focusBorderColor: mainColor,
                        enabledBorderColor: mainColor,
                        disabledBorderColor: greyColor4,
                        borderColor: greyColor4,
                        errorBorderColor: greyColor4,
                      ),
                      style: TextStyle(fontSize: 25, fontFamily: poppinsBold),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldStyle: FieldStyle.underline,
                      onChanged: (currentvalue) {},
                      onCompleted: (pin) {
                        setState(() {
                          otpStr = pin;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Resend code in ",
                          style: TextStyle(
                              color: blackColor,
                              fontSize: 13,
                              fontFamily: ralewayRegular),
                        ),
                        Text(
                          "8s",
                          style: TextStyle(
                              color: darkGreenColor,
                              fontSize: 13,
                              fontFamily: ralewaySemiBold),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    otpStr.isNotEmpty
                        ? InkWell(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                "${imagePath}img_enable_btn.png",
                              ))),
                              height: 55,
                              child: Center(
                                  child: Text(
                                verify,
                                style: TextStyle(
                                    color: whiteColor,
                                    fontSize: 17,
                                    fontFamily: ralewayBold),
                              )),
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                              "${imagePath}img_disable_btn.png",
                            ))),
                            height: 55,
                            child: Center(
                                child: Text(
                              verify,
                              style: TextStyle(
                                  color: whiteColor,
                                  fontSize: 17,
                                  fontFamily: ralewayBold),
                            )),
                          ),
                  ],
                ),
              )),
          Positioned(
              top: 30,
              left: 10,
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Image.asset(
                    "${imagePath}ic_left_arrow.png",
                    width: 24,
                    height: 24,
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
