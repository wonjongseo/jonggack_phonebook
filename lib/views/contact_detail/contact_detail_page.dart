import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:jonggack_phonebook/common/widgets/custom_text_form_field.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage({super.key, required this.contact});

  final Contact contact;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            children: [
              CustomTextFormField(hintText: contact.displayName),
              SizedBox(height: 16),
              Column(
                children: List.generate(contact.phones.length, (index) {
                  return Column(
                    children: [
                      CustomTextFormField(
                        hintText: contact.phones[index].number,
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                }),
              ),
              Column(
                children: List.generate(contact.emails.length, (index) {
                  return Column(
                    children: [
                      CustomTextFormField(
                        hintText: contact.emails[index].address,
                      ),
                      SizedBox(height: 16),
                    ],
                  );
                }),
              ),

              SizedBox(height: 16),
              CustomTextFormField(),
            ],
          ),
        ),
      ),
    );
  }
}
