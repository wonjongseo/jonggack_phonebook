import 'package:flutter/material.dart';
import 'package:flutter_callkit_voximplant/flutter_callkit_voximplant.dart';
import 'package:jonggack_phonebook/service/call_service.dart';

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
                // 070 5560 8528
                //817055608528
                //817091179402

                //817055608528
                callService.addIdentifiedNumber('817055608528', '랄랄라');
              },
              child: Text('addIdentifiedNumber'),
            ),
          ],
        ),
      ),
    );
  }
}
