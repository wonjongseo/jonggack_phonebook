import 'package:flutter_contacts/flutter_contacts.dart';

class LocalContactController {
  void init() async {
    if (await FlutterContacts.requestPermission()) {
      // Get all contacts (lightly fetched)
      List<Contact> contacts = await FlutterContacts.getContacts();

      // Get all contacts (fully fetched)
      contacts = await FlutterContacts.getContacts(
        withProperties: true,
        withPhoto: true,
      );

      for (var contact in contacts) {
        print('contact.displayName : ${contact.displayName}');
        List<Phone> phones = contact.phones;
        for (var phone in phones) {
          print('phone : ${phone}');
        }
      }

      // Get contact with specific ID (fully fetched)
      //   Contact? contact = await FlutterContacts.getContact(contacts.first.id);

      //   // Open external contact app to view/edit/pick/insert contacts.
      //   await FlutterContacts.openExternalView(contact!.id);
      //   await FlutterContacts.openExternalEdit(contact!.id);
      //   final contact1 = await FlutterContacts.openExternalPick();
      //   final contact2 = await FlutterContacts.openExternalInsert();

      //   // Listen to contact database changes
      //   FlutterContacts.addListener(() => print('Contact DB changed'));

      //   // Create a new group (iOS) / label (Android).
      //   await FlutterContacts.insertGroup(Group('', 'Coworkers'));

      //   // Export contact to vCard
      //   String vCard = contact.toVCard();

      //   // Import contact from vCard
      //   contact = Contact.fromVCard(
      //     'BEGIN:VCARD\n'
      //     'VERSION:3.0\n'
      //     'N:;Joe;;;\n'
      //     'TEL;TYPE=HOME:123456\n'
      //     'END:VCARD',
      //   );
    }
  }
}
// See installation notes below regarding AndroidManifest.xml and Info.plist

// Request contact permission
