import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_phonebook/views/contacts/contacts_page.dart';
import 'package:jonggack_phonebook/views/keypad/keypad_page.dart';

class RootController extends GetxController {
  RxInt pageIndex = 0.obs;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: pageIndex.value);
    super.onInit();
  }

  List<Widget> bodys = [ContactsPage(), KeypadPage()];
}
