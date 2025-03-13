import 'package:flutter/material.dart';
import 'package:flutter_callkit_voximplant/flutter_callkit_voximplant.dart';
import 'package:get/get.dart';
import 'package:jonggack_phonebook/service/call_service.dart';
import 'package:jonggack_phonebook/views/call/call_screen.dart';
import 'package:jonggack_phonebook/views/identify_list/identify_list_screen.dart';

class ExampleColors {
  static const Color primary = const Color(0xFF1C0B43);
  static const Color primaryDark = const Color(0xFF392B5B);
  static const Color button = const Color(0xFF662EFF);
  static const Color accent = const Color(0xff8b61ff);
}

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  CallService callService = CallService();

  List<FCXIdentifiablePhoneNumber> _identifiedNumbers = [];
  TextEditingController? _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _refreshNumbers();
  }

  Future<void> _refreshNumbers() async {
    var numbers = await callService.getIdentifiedNumbers();
    print('numbers.length : ${numbers.length}');

    if (mounted) {
      setState(() {
        _identifiedNumbers = numbers;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Center(
        child: Column(
          children: [
            Column(
              children: List.generate(_identifiedNumbers.length, (index) {
                return Row(
                  children: [
                    Text(_identifiedNumbers[index].number.toString()),
                    Text(_identifiedNumbers[index].label),
                  ],
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                callService.reloadExtension();
              },
              child: Text('reloadExtension'),
            ),
            ElevatedButton(
              onPressed: () {
                callService.addIdentifiedNumber('817055608528', '랄랄라');
              },
              child: Text('addIdentifiedNumber'),
            ),

            ElevatedButton(
              onPressed: () {
                Get.to(() => IdentifyListScreen());
              },
              child: Text('IdentifyListScreen'),
            ),
            ElevatedButton(
              onPressed: () async {
                await callService.emulateIncomingCall('817055608528');
                print('object');
                Get.to(() => CallScreen(false));
              },
              child: Text('CallScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
