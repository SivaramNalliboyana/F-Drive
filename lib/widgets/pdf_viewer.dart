import 'dart:io';

import 'package:fdrive/models/file_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PdfViewer extends StatefulWidget {
  final FileModel file;
  PdfViewer(this.file);

  @override
  State<PdfViewer> createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  late File pdfFile;
  bool initialized = false;

  loadpdfFile(FileModel file) async {
    final response = await http.get(Uri.parse(file.url));
    final bytes = response.bodyBytes;
    return storefile(file, bytes);
  }

  storefile(FileModel file, List<int> bytes) async {
    final dir = await getApplicationDocumentsDirectory();
    final filename = File("${dir.path}/${file.name}");
    await filename.writeAsBytes(bytes, flush: true);
    return filename;
  }

  initializePDF() async {
    pdfFile = await loadpdfFile(widget.file);
    initialized = true;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializePDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initialized
          ? PDFView(
              filePath: pdfFile.path,
              fitEachPage: false,
            )
          : Container(),
    );
  }
}
