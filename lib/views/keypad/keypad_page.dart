import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/controllers/edit_contact_controller.dart';
import 'package:jonggack_phonebook/controllers/keypad_controller.dart';
import 'package:jonggack_phonebook/views/edit_contact/edit_contact_page.dart';
import 'package:jonggack_phonebook/views/keypad/widgets/keypad_back_button.dart';
import 'package:jonggack_phonebook/views/keypad/widgets/keypad_button.dart';
import 'package:jonggack_phonebook/views/keypad/widgets/keypad_call_button.dart';

enum KeypadEnum {
  one("1"),
  two("2"),
  three("3"),
  four("4"),
  five("5"),
  six("6"),
  seven("7"),
  height("8"),
  nine("9"),
  zeroLeft("*"),
  zero("0"),
  zeroRight("#"),
  // empty(""),
  call("call"),
  back("back");

  final String label;
  const KeypadEnum(this.label);
}

class KeypadPage extends GetView<KeypadController> {
  const KeypadPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Text(
                controller.isSearchMode.value
                    ? ''
                    : controller.displayNumber.value,
                style: TextStyle(fontSize: 35, letterSpacing: 1.2),
              ),
            ),
            SizedBox(
              height: 40,
              child:
                  !controller.isEmptyNumber &&
                          controller.filteredContacts.isEmpty
                      ? GestureDetector(
                        onTap: controller.goToEditPage,
                        child: Center(child: Text('번호 추가')),
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          controller.filteredContacts.length,
                          (index) {
                            return GestureDetector(
                              onTap:
                                  () => controller.onTapFilteredContact(index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  controller
                                      .filteredContacts[index]
                                      .displayName,
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
            ),

            SizedBox(height: 20),
            SizedBox(
              width: size.width * .8,
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.end,
                  spacing: 20,
                  runSpacing: 12,
                  children: List.generate(KeypadEnum.values.length, (index) {
                    switch (KeypadEnum.values[index]) {
                      case KeypadEnum.call:
                        return KeypadCallButton(
                          onTap: controller.onTapCallBtn,
                          isEnable: !controller.isEmptyNumber,
                        );

                      case KeypadEnum.back:
                        return Obx(() {
                          return KeypadBackButton(
                            onLongPress: controller.deleteAllNumber,
                            onTap:
                                controller.isEmptyNumber
                                    ? null
                                    : controller.onTapRemoveBtn,
                            isVisable: !controller.isEmptyNumber,
                          );
                        });

                      default:
                        return KeypadButton(
                          onTap: () {
                            controller.onTapNumber(
                              KeypadEnum.values[index].label,
                            );
                          },
                          label: Text(
                            KeypadEnum.values[index].label,
                            style: TextStyle(fontSize: 22),
                          ),
                        );
                    }
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
