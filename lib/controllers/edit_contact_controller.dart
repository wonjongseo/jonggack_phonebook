import 'package:flutter/widgets.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:get/get.dart';

class EditContactController extends GetxController {
  String? number;
  Contact? contact;
  late TextEditingController firstNameCtl, lastNameCtl, companyNameCtl;
  List<TextEditingController> phoneNumberCtls = [];
  List<TextEditingController> emailCtls = [];

  void addPhoneOrEmailField({required bool isPhonenumber}) {
    if (isPhonenumber) {
      phoneNumberCtls.add(TextEditingController());
    } else {
      emailCtls.add(TextEditingController());
    }
    update();
  }

  @override
  void onInit() {
    initTextEditingControllers();
    super.onInit();
  }

  EditContactController({this.number, this.contact});

  void initTextEditingControllers() {
    if (contact != null) {
      firstNameCtl = TextEditingController(text: contact!.name.first);
      lastNameCtl = TextEditingController(text: contact!.name.last);
      if (contact!.organizations.isNotEmpty) {
        companyNameCtl = TextEditingController(
          text: contact!.organizations[0].company,
        );
      }
      for (var phone in contact!.phones) {
        companyNameCtl = TextEditingController(text: phone.number);
      }
      for (var email in contact!.emails) {
        companyNameCtl = TextEditingController(text: email.address);
      }
    } else {
      firstNameCtl = TextEditingController();
      lastNameCtl = TextEditingController();
      companyNameCtl = TextEditingController();
      phoneNumberCtls.add(TextEditingController(text: number));
      emailCtls.add(TextEditingController());
    }
  }
}
