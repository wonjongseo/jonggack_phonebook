import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/controllers/contacts_controller.dart';
import 'package:jonggack_phonebook/controllers/root_controller.dart';
import 'package:jonggack_phonebook/service/call_service.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      builder: (controller) {
        return Scaffold(
          // floatingActionButton: _floatingActionButton(callService),
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

  Row _floatingActionButton(CallService callService) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          child: Text('_callService.getExtensionStatus'),
          onPressed: () async {
            String aa = await callService.getExtensionStatus();
            print('aa : ${aa}');
          },
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          child: Text('openSettings'),
          onPressed: () async {
            callService.openSettings();
          },
        ),
        SizedBox(width: 20),
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
    );
  }
}
