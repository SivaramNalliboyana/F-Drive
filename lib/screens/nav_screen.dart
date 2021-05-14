import 'package:fdrive/utils/utils.dart';
import 'package:fdrive/widgets.dart/header.dart';
import 'package:fdrive/widgets.dart/storage_container.dart';
import 'package:flutter/material.dart';

class NavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(
              height: 30,
            ),
            StorageContainer()
          ],
        ),
      ),
    );
  }
}
