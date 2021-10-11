import 'package:fdrive/controllers/files_controller.dart';
import 'package:fdrive/screens/view_file_screen.dart';
import 'package:fdrive/utils/firebase.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayFilesScreen extends StatelessWidget {
  final String title;
  final String type;
  DisplayFilesScreen(this.title, this.type);

  FilesController controller = Get.find<FilesController>();
  FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: textColor,
            ),
            onPressed: () => Get.back(),
            iconSize: 24,
          ),
          title: Text(
            title,
            style: textStyle(18, textColor, FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () => type == "folder"
            ? firebaseService.uploadFile(title)
            : firebaseService.uploadFile(null),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              color: Colors.redAccent[200],
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
      body: Obx(() => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.25),
            itemCount: controller.files.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 10, top: 15),
                child: InkWell(
                  onTap: () => Get.to(ViewFileScreen(controller.files[index])),
                  child: Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        controller.files[index].fileType == "image"
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(14),
                                child: Image(
                                  image:
                                      NetworkImage(controller.files[index].url),
                                  width:
                                      MediaQuery.of(context).size.width / 2.5,
                                  height: 75,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 75,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 0.2),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Center(
                                  child: Image(
                                      width: 55,
                                      height: 55,
                                      image: AssetImage(
                                          'images/${controller.files[index].fileExtension}.png'),
                                      fit: BoxFit.cover),
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0, top: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.files[index].name,
                                  style:
                                      textStyle(14, textColor, FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.more_vert,
                                    color: Colors.black, size: 20),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(8),
                                      ),
                                    ),
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Text(
                                                controller.files[index].name,
                                                style: textStyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.w500),
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey,
                                            height: 3,
                                          ),
                                          ListTile(
                                            onTap: () {
                                              firebaseService.downloadFile(
                                                  controller.files[index]);
                                              Get.back();
                                            },
                                            dense: true,
                                            contentPadding: EdgeInsets.only(
                                                bottom: 0, left: 16, top: 12),
                                            visualDensity: VisualDensity(
                                                horizontal: 0, vertical: -4),
                                            leading: Icon(
                                              Icons.file_download,
                                              color: Colors.grey,
                                            ),
                                            title: Text(
                                              "Download",
                                              style: textStyle(16, Colors.black,
                                                  FontWeight.w500),
                                            ),
                                          ),
                                          ListTile(
                                            onTap: () {
                                              firebaseService.deleteFile(
                                                  controller.files[index]);
                                              Get.back();
                                            },
                                            dense: true,
                                            contentPadding: EdgeInsets.only(
                                                top: 8, left: 16, bottom: 12),
                                            visualDensity: VisualDensity(
                                                horizontal: 0, vertical: -4),
                                            leading: Icon(
                                              Icons.delete,
                                              color: Colors.grey,
                                              size: 22,
                                            ),
                                            title: Text(
                                              "Remove",
                                              style: textStyle(16, Colors.black,
                                                  FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
