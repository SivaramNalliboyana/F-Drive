import 'dart:isolate';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

class StorageController extends GetxController {
  String uid = FirebaseAuth.instance.currentUser.uid;
  RxInt size = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getStorage();
  }

  getStorage() {
    size.bindStream(
      userCollection.doc(uid).collection("files").snapshots().map(
        (QuerySnapshot query) {
          int size = 0;
          query.docs.forEach((element) {
            size += extractSize(element);
          });

          return size;
        },
      ),
    );
  }

  extractSize(QueryDocumentSnapshot<Map<String, dynamic>> element) {
    return element.data()['size'];
  }
}
