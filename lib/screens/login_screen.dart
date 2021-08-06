import 'package:fdrive/controllers/authentication_controller.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurpleAccent,
            Colors.purpleAccent,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewPadding.top + 52),
              child: Image(
                width: 200,
                height: 200,
                image: AssetImage('images/filemanager.png'),
                fit: BoxFit.cover,
              ),
            ),
            Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Simplify your",
                      style: textStyle(25, Color(0xff635C9B), FontWeight.w700),
                    ),
                    Text(
                      "filing system",
                      style: textStyle(25, Color(0xff635C9B), FontWeight.w700),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "keep your files",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    Text(
                      "organized more easily",
                      style: textStyle(20, textColor, FontWeight.w600),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => Get.find<AuthController>().login(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrangeAccent.withOpacity(0.8),
                        ),
                        child: Center(
                          child: Text(
                            "Let's Go",
                            style: textStyle(23, Colors.white, FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
