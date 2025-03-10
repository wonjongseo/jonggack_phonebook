import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/controllers/keypad_controller.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Obx(
          () => Text(
            controller.displayNumber.value,
            style: TextStyle(fontSize: 35, letterSpacing: 1.2),
          ),
        ),

        SizedBox(height: 20),
        SizedBox(
          width: size.width * .8,
          child: Center(
            child: Wrap(
              alignment: WrapAlignment.end,
              spacing: 20,
              runSpacing: 20,
              children: List.generate(KeypadEnum.values.length, (index) {
                return GestureDetector(
                  onTap:
                      () => controller.onTapNumber(
                        KeypadEnum.values[index].label,
                      ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                    ),
                    width: 80,
                    height: 80,
                    child: Center(
                      child: Text(
                        KeypadEnum.values[index].label,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
