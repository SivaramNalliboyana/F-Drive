import 'package:fdrive/utils/utils.dart';
import 'package:fdrive/widgets.dart/header.dart';
import 'package:fdrive/widgets.dart/storage_container.dart';
import 'package:fdrive/widgets.dart/upload_options.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(25),
        child: AppBar(
          backgroundColor: bgcolor,
          elevation: 0,
        ),
      ),
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 40,
            ),
            StorageContainer(),
            UploadOptions()
          ],
        ),
      ),
    );
  }
}
