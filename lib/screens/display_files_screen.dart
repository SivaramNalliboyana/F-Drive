import 'package:fdrive/controllers/files_controller.dart';
import 'package:fdrive/screens/view_file_screen.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayFilesScreen extends StatelessWidget {
  final String title;
  DisplayFilesScreen(this.title);

  FilesController controller = Get.find<FilesController>();

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
                    height: 100,
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
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                width: MediaQuery.of(context).size.width / 2.5,
                                height: 80,
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
                                    color: Colors.black, size: 22),
                                onPressed: () {},
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
