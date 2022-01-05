import 'package:fdrive/controllers/files_screen_controller.dart';
import 'package:fdrive/screens/view_file_screen.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentFiles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Recent Files",
            style: textStyle(20, textColor, FontWeight.bold),
          ),
        ),
        SizedBox(height: 15),
        GetX<FilesScreenController>(
            builder: (FilesScreenController controller) {
          return Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.recentFiles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: InkWell(
                    onTap: () =>
                        Get.to(ViewFileScreen(controller.recentFiles[index])),
                    child: Container(
                      width: 65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          controller.recentFiles[index].fileType == "image"
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(18),
                                  child: Image(
                                    width: 65,
                                    height: 60,
                                    image: NetworkImage(
                                        controller.recentFiles[index].url),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  width: 65,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 0.15),
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Center(
                                    child: Image(
                                        width: 42,
                                        height: 42,
                                        image: AssetImage(
                                            'images/${controller.recentFiles[index].fileExtension}.png'),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(controller.recentFiles[index].name,
                              style: textStyle(
                                13,
                                textColor,
                                FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis)
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }),
      ],
    );
  }
}
