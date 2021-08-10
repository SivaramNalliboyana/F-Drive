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
            Icon(Icons.more_vert),
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
