import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  Container tabCell(String text, bool selected, BuildContext context) {
    return selected
        ? Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.deepOrangeAccent,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.025),
                    offset: Offset(10, 10),
                    blurRadius: 10),
                BoxShadow(
                    color: Colors.black.withOpacity(0.025),
                    offset: Offset(-10, 10),
                    blurRadius: 10)
              ],
            ),
            child: Center(
              child: Text(
                text,
                style: textStyle(23, Colors.white, FontWeight.bold),
              ),
            ),
          )
        : Container(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 60,
            child: Center(
              child: Text(
                text,
                style: textStyle(23, textColor, FontWeight.bold),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Text(
            "F-Drive",
            style: textStyle(25, textColor, FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.only(left: 20),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: Offset(10, 10),
                    blurRadius: 10),
                BoxShadow(
                    color: Colors.black.withOpacity(0.03),
                    offset: Offset(-10, 10),
                    blurRadius: 10)
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: tabCell("Storage", true, context),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: tabCell("Files", false, context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
