import 'package:flutter/widgets.dart';
import 'package:flutter_callkit_voximplant/flutter_callkit_voximplant.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:get/get.dart';
import 'package:jonggack_phonebook/service/call_service.dart';

class ContactsController extends GetxController with WidgetsBindingObserver {
  RxList<Contact> localContacts = RxList();
  RxList<Contact> filteredLocalContacts = RxList();

  Map<String, String> aaa = {};
  RxBool isLoading = false.obs;

  CallService callService = CallService();
  List<FCXIdentifiablePhoneNumber> identifiedNumbers = [];

  TextEditingController searchCrl = TextEditingController();
  void onChanged(String value) {
    value = value.toLowerCase();
    filteredLocalContacts.assignAll(
      localContacts
          .where((contact) => contact.displayName.toLowerCase().contains(value))
          .toList(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      getLocalContacts();
    }
  }

  @override
  void onInit() async {
    getLocalContacts();
    identifiedNumbers = await callService.getIdentifiedNumbers();
    print('identifiedNumbers.length : ${identifiedNumbers.length}');

    for (var identifiedNumber in identifiedNumbers) {
      aaa[identifiedNumber.number.toString().replaceFirst('81', '0')] =
          identifiedNumber.number.toString();
    }

    super.onInit();
  }

  void test() {
    callService.addIdentifiedNumber('817055608528', '랄랄라');
    callService.addIdentifiedNumber('818048058834', '아야탕탕탕');
  }

  void test2() async {
    callService.reloadExtension();
    var a = await callService.getIdentifiedNumbers();
    for (var b in a) {
      print('b.label : ${b.label}');
      print('b.number : ${b.number}');
    }
    print('a.length : ${a.length}');
  }

  void deletAll() {
    for (var identifiedNumber in identifiedNumbers) {
      callService.removeIdentifiedNumber(identifiedNumber.number);
      print('${identifiedNumber.number} ${identifiedNumber.label}');
      print('----------');
    }
  }

  void addIdentifiedNumber(String phone, String label) async {
    await callService.addIdentifiedNumber('81${phone.substring(1)}', label);
    identifiedNumbers = await callService.getIdentifiedNumbers();
  }

  String? getIdentifiedNumber(String phone) {
    for (var identifiedNumber in identifiedNumbers) {
      if (identifiedNumber.number.toString().replaceFirst('81', '0') == phone) {
        print(identifiedNumber.number);
        return identifiedNumber.label;
      }
    }
    return null;
  }

  void getLocalContacts() async {
    isLoading(true);
    localContacts.assignAll(
      await FlutterContacts.getContacts(
        withProperties: true,
        withThumbnail: true,
        withPhoto: true,
        withGroups: true,
        withAccounts: true,
      ),
    );

    for (var localContact in localContacts) {
      for (var i = 0; i < localContact.phones.length; i++) {
        localContact.phones[i].number = localContact.phones[i].number
            .replaceAll('-', '');

        localContact.phones[i].number = localContact.phones[i].number
            .replaceAll(' ', '');

        // print(
        //   'localContact.phones[i].number : ${localContact.phones[i].number}',
        // );
      }
      filteredLocalContacts.assignAll(localContacts);
    }

    isLoading(false);
  }
}
