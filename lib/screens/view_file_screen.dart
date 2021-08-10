import 'package:fdrive/models/file_model.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:flutter/material.dart';

class ViewFileScreen extends StatelessWidget {
  FileModel file;
  ViewFileScreen(this.file);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45),
        child: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            file.name,
            style: textStyle(18, Colors.white, FontWeight.w600),
          ),
          actions: [
            IconButton(
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
                        ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image(
                              width: 32,
                              height: 32,
                              image: NetworkImage(file.url),
                              fit: BoxFit.cover,
                            ),
                          ),
                          title: Text(
                            file.name,
                            style: textStyle(16, Colors.black, FontWeight.w500),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 3,
                        ),
                        ListTile(
                          dense: true,
                          contentPadding:
                              EdgeInsets.only(bottom: 0, left: 16, top: 12),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          leading: Icon(
                            Icons.file_download,
                            color: Colors.grey,
                          ),
                          title: Text(
                            "Download",
                            style: textStyle(16, Colors.black, FontWeight.w500),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          contentPadding:
                              EdgeInsets.only(top: 8, left: 16, bottom: 12),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          leading: Icon(
                            Icons.delete,
                            color: Colors.grey,
                            size: 22,
                          ),
                          title: Text(
                            "Remove",
                            style: textStyle(16, Colors.black, FontWeight.w500),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
          child: Image(
            image: NetworkImage(file.url),
          ),
        ),
      ),
    );
  }
}
