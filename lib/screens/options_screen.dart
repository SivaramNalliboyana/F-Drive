import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OptionsScreen extends StatelessWidget {
  final String type;
  OptionsScreen(this.type);

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
            type,
            style: textStyle(18, textColor, FontWeight.bold),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.25),
        itemCount: 4,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: Text(
                          "Motivational quote.png",
                          style: textStyle(13, textColor, FontWeight.bold),
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
