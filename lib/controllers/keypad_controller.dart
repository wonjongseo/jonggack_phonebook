import 'package:get/get.dart';

class KeypadController extends GetxController {
  RxString _number = ''.obs;
  RxString displayNumber = ''.obs;

  void onTapNumber(String v) {
    _number.value += v;
    displayNumber.value = _getLastChars(_number.value, 15);
  }

  String _getLastChars(String text, int length) {
    if (text.length <= length) return text;
    return text.substring(text.length - length);
  }
}
