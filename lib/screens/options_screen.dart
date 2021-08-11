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
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image(
                    image: NetworkImage(
                        'https://th.bing.com/th/id/OIP.g4H8CGswzyiMmgcY0ne60QHaL2?pid=ImgDet&rs=1'),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text(
                    "Motivation.png",
                    style: textStyle(14, textColor, FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.more_vert, color: Colors.black, size: 22),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
