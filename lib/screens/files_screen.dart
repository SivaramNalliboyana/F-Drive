import 'dart:io';
import 'dart:ui';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fdrive/controllers/files_screen_controller.dart';
import 'package:fdrive/screens/nav_screen.dart';
import 'package:fdrive/widgets.dart/folders_section.dart';
import 'package:fdrive/widgets.dart/recent_files.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';

class FilesScreen extends StatelessWidget {
  TextEditingController folderController = TextEditingController();
  Uuid uuid = Uuid();
  final FlutterFFmpeg flutterFFmpeg = FlutterFFmpeg();
  FilesScreenController controller = Get.put(FilesScreenController());

  openAddFolderDialog(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 10),
          title: Text(
            "New folder",
            style: textStyle(17, Colors.black, FontWeight.w600),
          ),
          content: TextFormField(
            controller: folderController,
            autofocus: true,
            style: textStyle(16, Colors.black, FontWeight.w500),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[250],
              hintText: "Untitled folder",
              hintStyle: textStyle(16, Colors.grey, FontWeight.w500),
            ),
          ),
          actions: [
            InkWell(
              onTap: () => Get.offAll(NavScreen()),
              child: Text(
                "Cancel",
                style: textStyle(16, textColor, FontWeight.bold),
              ),
            ),
            InkWell(
              onTap: () {
                userCollection
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .collection('folders')
                    .add(
                  {'name': folderController.text, 'time': DateTime.now()},
                );
                Get.offAll(NavScreen());
              },
              child: Text(
                "Create",
                style: textStyle(16, textColor, FontWeight.bold),
              ),
            )
          ],
        );
      },
    );
  }

  Future<File> compressFile(File file, String fileType) async {
    if (fileType == 'image') {
      Directory directory = await getTemporaryDirectory();
      String targetpath = directory.path + "/${uuid.v4().substring(0, 8)}.jpg";
      File result = await FlutterImageCompress.compressAndGetFile(
          file.path, targetpath,
          quality: 75);
      return result;
    } else if (fileType == 'video') {
      final info = await VideoCompress.compressVideo(
        file.path,
        quality: VideoQuality.MediumQuality,
        deleteOrigin: false,
      );
      print(info.filesize);
      return File(info.path);
    } else {
      return file;
    }
  }

  selectFiles() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path)).toList();

      for (File file in files) {
        // Getting the fileType
        String fileType = lookupMimeType(file.path);
        String end = "/";
        int startIndex = 0;
        int endIndex = fileType.indexOf(end);
        String filteredFileType = fileType.substring(startIndex, endIndex);

        // Filtering file name and extension
        String fileName = file.path.split('/').last;
        String fileExtension = fileName.substring(fileName.indexOf('.') + 1);

        // Getting compressedfile
        File compressedFile = await compressFile(file, filteredFileType);

        // Getting length of the files collection
        int length = await userCollection
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection('files')
            .get()
            .then((value) => value.docs.length);

        // Uploading file to firebase storage
        UploadTask uploadTask = FirebaseStorage.instance
            .ref()
            .child('files')
            .child("File $length")
            .putFile(compressedFile);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
        String fileUrl = await snapshot.ref.getDownloadURL();

        // Saving data in firebase document
        userCollection
            .doc(FirebaseAuth.instance.currentUser.uid)
            .collection('files')
            .add({
          "fileName": fileName,
          "fileUrl": fileUrl,
          "fileType": filteredFileType,
          "fileExtension": fileExtension,
          "size":
              (compressedFile.readAsBytesSync().lengthInBytes / 1024).round(),
          "dateUploaded": DateTime.now(),
        });
      }
      Get.back();
    } else {
      print("Cancelled");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecentFiles(),
                  FoldersSection(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                      ),
                      builder: (context) {
                        return Container(
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () => openAddFolderDialog(context),
                                  child: Row(
                                    children: [
                                      Icon(EvaIcons.folderAdd,
                                          color: Colors.grey, size: 32),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Folder",
                                        style: textStyle(
                                            20, Colors.black, FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () => selectFiles(),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Upload",
                                        style: textStyle(
                                            20, Colors.black, FontWeight.w600),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Icon(EvaIcons.upload,
                                          color: Colors.grey, size: 32),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: 45,
                    height: 45,
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
