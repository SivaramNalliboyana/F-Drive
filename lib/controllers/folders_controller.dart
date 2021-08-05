import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fdrive/models/folder_model.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class FoldersController extends GetxController {
  String uid = FirebaseAuth.instance.currentUser.uid;
  RxList<FolderModel> foldersList = <FolderModel>[].obs;

  @override
  void onInit() {
    super.onInit();
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
            folders.add(FolderModel.fromDocumentSnapshot(element));
          });
          return folders;
        },
      ),
    );
  }
}
