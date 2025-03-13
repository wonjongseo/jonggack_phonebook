import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/controllers/contacts_controller.dart';
import 'package:jonggack_phonebook/controllers/root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      builder: (controller) {
        return Scaffold(
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Text('확인'),
                onPressed: () {
                  Get.find<ContactsController>().test2();
                },
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                child: Text('삭제'),
                onPressed: () {
                  Get.find<ContactsController>().deletAll();
                },
              ),
              SizedBox(width: 20),
              FloatingActionButton(
                child: Text('추가'),
                onPressed: () {
                  Get.find<ContactsController>().test();
                },
              ),
            ],
          ),
          body: SafeArea(child: controller.bodys[controller.pageIndex]),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (value) => controller.onTapBottomNavigation(value),
            items: [
              BottomNavigationBarItem(label: '', icon: Text('contacts')),
              BottomNavigationBarItem(label: '', icon: Text('keypad')),
            ],
          ),
        );
      },
    );
  }
}
