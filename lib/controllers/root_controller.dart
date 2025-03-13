import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_phonebook/views/contacts/contacts_page.dart';
import 'package:jonggack_phonebook/views/keypad/keypad_page.dart';

class RootController extends GetxController {
  int pageIndex = 0;

  @override
  void onInit() {
    super.onInit();
  }

  void onTapBottomNavigation(int index) {
    pageIndex = index;

    update();
  }

  List<Widget> bodys = [ContactsPage(), KeypadPage()];
}
