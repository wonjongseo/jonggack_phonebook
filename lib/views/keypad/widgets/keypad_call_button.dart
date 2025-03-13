import 'package:flutter/material.dart';

class KeypadCallButton extends StatelessWidget {
  const KeypadCallButton({
    super.key,
    required this.onTap,
    required this.isEnable,
  });
  final Function() onTap;
  final bool isEnable;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      radius: 80,
      borderRadius: BorderRadius.circular(80),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          shape: BoxShape.circle,
        ),
        width: 80,
        height: 80,
        child: Center(child: Icon(Icons.call, size: 30, color: Colors.white)),
      ),
    );
  }
}
