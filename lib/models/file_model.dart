import 'package:cloud_firestore/cloud_firestore.dart';

class FileModel {
  String id;
  String url;
  String name;
  Timestamp dateUploaded;
  String fileType;
  int size;

  FileModel(this.id, this.url, this.dateUploaded, this.fileType, this.size);

  FileModel.fromDocumentSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    id = doc.id;
    url = doc.data()['fileUrl'];
    name = doc.data()['fileName'];
    dateUploaded = doc.data()['dateUploaded'];
    fileType = doc.data()['fileType'];
    size = doc.data()['size'];
  }
}
