import 'package:get/get.dart';

class NavigationController extends GetxController {
  RxString tab = "Storage".obs;

  changeTab(String t) {
    tab.value = t;
  }
}
