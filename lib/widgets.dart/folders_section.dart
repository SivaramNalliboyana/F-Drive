import 'package:fdrive/controllers/folders_controller.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoldersSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<FoldersController>(
        init: Get.put(FoldersController()),
        builder: (FoldersController foldersController) {
          if (foldersController != null &&
              foldersController.foldersList != null) {
            return GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: foldersController.foldersList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade100,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.00001),
                          offset: Offset(10, 10),
                          blurRadius: 5),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/folder.png',
                        width: 82,
                        height: 82,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        foldersController.foldersList[index].name,
                        style: textStyle(18, textColor, FontWeight.bold),
                      ),
                      Text(
                        "${foldersController.foldersList[index].items} items",
                        style: textStyle(14, Colors.grey[400], FontWeight.bold),
                      )
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
