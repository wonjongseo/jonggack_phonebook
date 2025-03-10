import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';

class ContactsController extends GetxController {
  RxList<Contact> localContacts = RxList();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getLocalContacts();
    super.onInit();
  }

  void getLocalContacts() async {
    isLoading(true);
    localContacts.assignAll(
      await FlutterContacts.getContacts(withProperties: true, withPhoto: true),
    );

    isLoading(false);
  }
}
