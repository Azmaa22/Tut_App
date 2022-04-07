import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utilities/constants/sizing_manager.dart';
import 'package:flutter_svg/svg.dart';

class ArrowButton extends StatelessWidget {
  final String iconName;
  final Function onPress;
  const ArrowButton({
    Key? key,
    required this.iconName,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(PaddingManager.p12),
      child: GestureDetector(
        onTap: () => onPress(),
        child: SvgPicture.asset(iconName),
      ),
    );
  }
}
