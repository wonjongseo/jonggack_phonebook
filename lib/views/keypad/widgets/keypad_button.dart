import 'package:flutter/material.dart';

class KeypadButton extends StatelessWidget {
  const KeypadButton({super.key, this.onTap, this.label});

  final Function()? onTap;
  final Widget? label;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      radius: 80,
      borderRadius: BorderRadius.circular(80),
      onTap: onTap,
      child: Container(
        decoration:
            label == null
                ? null
                : BoxDecoration(
                  border: Border.all(color: Colors.black),
                  shape: BoxShape.circle,
                ),
        width: 80,
        height: 80,
        child: Center(child: label),
      ),
    );
  }
}
