import 'package:fdrive/controllers/navigation_controller.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends StatelessWidget {
  NavigationController controller = Get.put(NavigationController());

  Container tabCell(String text, bool selected, BuildContext context) {
    return selected
        ? Container(
            width: MediaQuery.of(context).size.width * 0.45 - 5,
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
            width: MediaQuery.of(context).size.width * 0.45 - 5,
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
      child: Column(
        children: [
          Text(
            "F-Drive",
            style: textStyle(28, textColor, FontWeight.bold),
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
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => controller.changeTab("Storage"),
                        child: tabCell("Storage",
                            controller.tab.value == "Storage", context),
                      ),
                      InkWell(
                        onTap: () => controller.changeTab("Files"),
                        child: tabCell(
                            "Files", controller.tab.value == "Files", context),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
