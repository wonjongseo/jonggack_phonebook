import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/controllers/contacts_controller.dart';

class ContactsPage extends GetView<ContactsController> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Expanded(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    controller.localContacts[index].displayName ?? 'aa',
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: controller.localContacts.length,
            ),
          ),
        ),
      ],
    );
  }
}
