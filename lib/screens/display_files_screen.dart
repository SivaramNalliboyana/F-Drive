import 'package:fdrive/controllers/files_controller.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.25),
        itemCount: controller.files.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 10, top: 15),
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image(
                      image: NetworkImage(
                          'https://th.bing.com/th/id/OIP.g4H8CGswzyiMmgcY0ne60QHaL2?pid=ImgDet&rs=1'),
                      width: MediaQuery.of(context).size.width / 2.5,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0, top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                            "Motivational quote.png",
                            style: textStyle(14, textColor, FontWeight.bold),
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
          );
        },
      ),
    );
  }
}
