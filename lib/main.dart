import 'package:flutter/material.dart';
import 'package:jonggack_phonebook/controllers/contacts_controller.dart';
import 'package:jonggack_phonebook/controllers/keypad_controller.dart';
import 'package:jonggack_phonebook/controllers/local_contact_controller.dart';
import 'package:get/get.dart';
import 'package:jonggack_phonebook/controllers/root_controller.dart';
import 'package:jonggack_phonebook/test/test_page.dart';
import 'package:jonggack_phonebook/views/root/root_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RootController());
    Get.put(ContactsController());
    Get.put(KeypadController());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const TestPage(),
    );
  }
}
