import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fdrive/models/file_model.dart';
import 'package:fdrive/models/folder_model.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FilesScreenController extends GetxController {
  String uid = FirebaseAuth.instance.currentUser.uid;
  RxList<FolderModel> foldersList = <FolderModel>[].obs;
  RxList<FileModel> recentFiles = <FileModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    recentFiles.bindStream(
      userCollection
          .doc(uid)
          .collection('files')
          .orderBy('dateUploaded', descending: true)
          .snapshots()
          .map(
        (QuerySnapshot query) {
          List<FileModel> files = [];
          query.docs.forEach((element) {
            files.add(FileModel.fromDocumentSnapshot(element));
          });
          return files;
        },
      ),
    );
    foldersList.bindStream(
      userCollection
          .doc(uid)
          .collection('folders')
          .orderBy('time', descending: true)
          .snapshots()
          .map(
        (QuerySnapshot query) {
          List<FolderModel> folders = [];
          query.docs.forEach((element) {
            FolderModel folder = FolderModel.fromDocumentSnapshot(element);
            folders.add(folder);
          });
          return folders;
        },
      ),
    );
  }
}
