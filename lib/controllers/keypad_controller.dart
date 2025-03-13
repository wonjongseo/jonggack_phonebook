import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';
import 'package:jonggack_phonebook/controllers/contacts_controller.dart';
import 'package:jonggack_phonebook/controllers/edit_contact_controller.dart';
import 'package:jonggack_phonebook/views/edit_contact/edit_contact_page.dart';
import 'package:url_launcher/url_launcher.dart';

class KeypadController extends GetxController {
  RxString _number = ''.obs;

  String get number => _number.value;
  RxString displayNumber = ''.obs;
  RxBool isSearchMode = false.obs;
  bool get isEmptyNumber => _number.value.isEmpty || _number.value == '';

  RxList<Contact> filteredContacts = RxList();
  ContactsController contactsController = Get.find<ContactsController>();

  void goToEditPage() {
    Get.to(
      () => EditContactPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => EditContactController(number: number));
      }),
    );
  }

  void onTapFilteredContact(int index) {
    Contact contact = filteredContacts[index];
    displayNumber(contact.phones[0].number);
    _number(contact.phones[0].number);
  }

  void onTapNumber(String v) {
    _number.value += v;
    displayNumber.value = _getLastChars(_number.value, 15);
    searchNumber();
  }

  void searchNumber() {
    if (_number.value.length >= 6) {
      filteredContacts.assignAll(
        contactsController.localContacts
            .where(
              (context) =>
                  context.phones.isEmpty
                      ? false
                      : context.phones[0].number.contains(_number.value),
            )
            .toList(),
      );
    } else {
      filteredContacts.clear();
    }
  }

  void toggleMode() {
    isSearchMode.toggle();
  }

  void deleteAllNumber() {
    _number.value = '';
    displayNumber.value = '';
    searchNumber();
  }

  void onTapCallBtn() async {
    if (isEmptyNumber) return;

    // final url = Uri.parse('tel:817055608528');
    // final url = Uri.parse('tel:07055608528');
    final url = Uri.parse('tel:${_number.value}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void onTapRemoveBtn() {
    displayNumber.value = displayNumber.value.substring(
      0,
      displayNumber.value.length - 1,
    );
    _number.value = _number.value.substring(0, _number.value.length - 1);

    searchNumber();
  }

  String _getLastChars(String text, int length) {
    if (text.length <= length) return text;
    return text.substring(text.length - length);
  }
}
