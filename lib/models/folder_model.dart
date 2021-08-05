import 'package:cloud_firestore/cloud_firestore.dart';

class FolderModel {
  String id;
  String name;
  Timestamp dateCreated;
  int items;

  FolderModel(this.id, this.name, this.dateCreated, this.items);

  FolderModel.fromDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    id = doc.id;
    name = doc.data()['name'];
    dateCreated = doc.data()['time'];
    items = 500;
  }
}
