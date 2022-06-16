import 'dart:core';
import 'dart:io';

import 'package:fdrive/utils/firebase.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:fdrive/models/file_model.dart';
import 'package:fdrive/widgets/audio_player.dart';
import 'package:fdrive/widgets/pdf_viewer.dart';
import 'package:fdrive/widgets/video_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class ViewFileScreen extends StatelessWidget {
  FileModel file;
  ViewFileScreen(this.file);

  FirebaseService firebaseService = FirebaseService();

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
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                file.name,
                                style: textStyle(
                                    16, Colors.black, FontWeight.w500),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            height: 3,
                          ),
                          ListTile(
                            onTap: () {
                              firebaseService.deleteFile(file);
                              Get.back();
                            },
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
                              style:
                                  textStyle(16, Colors.black, FontWeight.w500),
                            ),
                          ),
                          ListTile(
                            onTap: () {
                              firebaseService.deleteFile(file);
                              Get.close(2);
                            },
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
                              style:
                                  textStyle(16, Colors.black, FontWeight.w500),
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
        body: file.fileType == "image"
            ? showImage(file.url)
            : file.fileType == "application"
                ? showFile(file, context)
                : file.fileType == "video"
                    ? VideoPlayerWidget(file.url)
                    : file.fileType == "audio"
                        ? AudioPlayerWidget(file.url)
                        : showError());
  }
}

showImage(String url) {
  return Center(
    child: Image(
      image: NetworkImage(url),
    ),
  );
}

showFile(FileModel file, context) {
  if (file.fileExtension == "pdf") {
    return PdfViewer(file);
  } else {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Unfortunately this file cannot be opened",
            style: textStyle(18, Colors.white, FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 36,
            child: TextButton(
                onPressed: () => FirebaseService().downloadFile(file),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent),
                child: Center(
                  child: Text(
                    "Download",
                    style: textStyle(17, Colors.white, FontWeight.w600),
                  ),
                )),
          )
        ],
      ),
    );
  }
}

showError() {}
