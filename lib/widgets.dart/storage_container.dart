import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';

class StorageContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.001),
              offset: Offset(10, 10),
              blurRadius: 10),
          BoxShadow(
              color: Colors.grey.withOpacity(0.001),
              offset: Offset(-10, 10),
              blurRadius: 10)
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 35),
        child: Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 10)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "32",
                        style:
                            textStyle(50, Color(0xff635C9B), FontWeight.bold),
                      ),
                      Text(
                        "%",
                        style:
                            textStyle(17, Color(0xff635C9B), FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    "Used",
                    style: textStyle(
                        20, textColor.withOpacity(0.7), FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.deepOrange),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Used",
                          style: textStyle(
                              18, textColor.withOpacity(0.7), FontWeight.w600),
                        ),
                        Text(
                          "48 GB",
                          style:
                              textStyle(20, Color(0xff635C9B), FontWeight.w600),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 18,
                      height: 18,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey.withOpacity(0.25),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      children: [
                        Text(
                          "Free",
                          style: textStyle(
                              18, textColor.withOpacity(0.7), FontWeight.w600),
                        ),
                        Text(
                          "90 GB",
                          style:
                              textStyle(20, Color(0xff635C9B), FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
