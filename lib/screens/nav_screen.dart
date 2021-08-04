import 'package:fdrive/controllers/navigation_controller.dart';
import 'package:fdrive/screens/files_screen.dart';
import 'package:fdrive/screens/storage_screen.dart';
import 'package:fdrive/utils/utils.dart';
import 'package:fdrive/widgets.dart/header.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: SafeArea(
        child: Column(
          children: [
            Header(),
            Obx(
              () => Get.find<NavigationController>().tab.value == "Storage"
                  ? StorageScreen()
                  : FilesScreen(),
            )
          ],
        ),
      ),
    );
  }
}
