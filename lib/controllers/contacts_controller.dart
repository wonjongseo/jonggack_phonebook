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
    print('object');
    isLoading(true);
    localContacts.assignAll(
      await FlutterContacts.getContacts(withProperties: true, withPhoto: true),
    );
    print('localContacts.length : ${localContacts.length}');

    isLoading(false);
  }
}
