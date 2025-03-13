import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jonggack_phonebook/common/widgets/custom_text_form_field.dart';
import 'package:jonggack_phonebook/controllers/edit_contact_controller.dart';
import 'package:jonggack_phonebook/controllers/keypad_controller.dart';

class EditContactPage extends GetView<EditContactController> {
  const EditContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<EditContactController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextFormField(
                  hintText: '성',
                  controller: controller.firstNameCtl,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  hintText: '이름',
                  controller: controller.lastNameCtl,
                ),
                SizedBox(height: 16),
                CustomTextFormField(
                  hintText: '직장',
                  controller: controller.companyNameCtl,
                ),

                SizedBox(height: 16),
                _phoneNumbers(),
                GestureDetector(
                  onTap:
                      () =>
                          controller.addPhoneOrEmailField(isPhonenumber: true),
                  child: Icon(Icons.add),
                ),
                SizedBox(height: 16),
                _emails(),
              ],
            ),
          );
        },
      ),
    );
  }

  Column _phoneNumbers() {
    return Column(
      children: List.generate(controller.phoneNumberCtls.length, (index) {
        return Column(
          children: [
            CustomTextFormField(
              hintText: '전화번호',
              controller: controller.phoneNumberCtls[index],
            ),

            SizedBox(height: 16),
          ],
        );
      }),
    );
  }

  Column _emails() {
    return Column(
      children: List.generate(controller.emailCtls.length, (index) {
        return Column(
          children: [
            CustomTextFormField(
              hintText: '이메일',
              controller: controller.emailCtls[index],
            ),
            SizedBox(height: 16),
          ],
        );
      }),
    );
  }
}
