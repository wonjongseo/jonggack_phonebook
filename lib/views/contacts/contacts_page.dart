import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/common/widgets/custom_text_form_field.dart';
import 'package:jonggack_phonebook/controllers/contacts_controller.dart';
import 'package:jonggack_phonebook/controllers/edit_contact_controller.dart';
import 'package:jonggack_phonebook/views/contact_detail/contact_detail_page.dart';
import 'package:jonggack_phonebook/views/edit_contact/edit_contact_page.dart';

class ContactsPage extends GetView<ContactsController> {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(
              controller: controller.searchCrl,
              hintText: '검색',
              onChanged: (v) {
                controller.onChanged(v);
                print('v : ${v}');
              },
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 8),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Get.to(
                        () => EditContactPage(),
                        binding: BindingsBuilder(() {
                          Get.lazyPut(
                            () => EditContactController(
                              contact: controller.filteredLocalContacts[index],
                            ),
                          );
                        }),
                      );
                    },
                    title: Text(
                      controller.filteredLocalContacts[index].displayName ??
                          'aa',
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.filteredLocalContacts.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
