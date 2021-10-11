import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fdrive/models/file_model.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FilesController extends GetxController {
  final String type;
  final String foldername;
  final String fileType;
  FilesController(this.type, this.foldername, this.fileType);

  String uid = FirebaseAuth.instance.currentUser.uid;
  RxList<FileModel> files = <FileModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    if (type == "Files") {
      print(fileType);
      files.bindStream(
        userCollection
            .doc(uid)
            .collection('files')
            .where('fileType', isEqualTo: fileType)
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
    } else {
      files.bindStream(
        userCollection
            .doc(uid)
            .collection('files')
            .where('folder', isEqualTo: foldername)
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
    }
  }
}

class FilesBinding extends Bindings {
  final String type;
  final String foldername;
  final String fileType;
  FilesBinding(this.type, this.foldername, this.fileType);

  @override
  void dependencies() {
    Get.lazyPut<FilesController>(
        () => FilesController(type, this.foldername, fileType));
  }
}
