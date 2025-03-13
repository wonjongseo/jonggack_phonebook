import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KeypadBackButton extends StatelessWidget {
  const KeypadBackButton({
    super.key,
    this.onTap,
    this.onLongPress,
    required this.isVisable,
  });
  final Function()? onTap;
  final Function()? onLongPress;
  final bool isVisable;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: SizedBox(
        width: 80,
        height: 80,
        child:
            isVisable
                ? Center(child: FaIcon(FontAwesomeIcons.deleteLeft, size: 30))
                : null,
      ),
    );
  }
}
