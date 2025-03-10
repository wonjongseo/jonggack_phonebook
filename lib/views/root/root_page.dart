import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:jonggack_phonebook/controllers/root_controller.dart';

class RootPage extends GetView<RootController> {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: controller.pageController,
          itemCount: controller.bodys.length,
          itemBuilder: (context, index) {
            return controller.bodys[index];
          },
        ),
      ),
    );
  }
}
