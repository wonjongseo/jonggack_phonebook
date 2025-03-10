import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/controllers/contacts_controller.dart';
import 'package:jonggack_phonebook/views/contact_detail/contact_detail_page.dart';

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
                  onTap: () {
                    Get.to(
                      () => ContactDetailPage(
                        contact: controller.localContacts[index],
                      ),
                    );
                  },
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
