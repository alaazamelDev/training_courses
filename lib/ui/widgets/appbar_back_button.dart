import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';

class AppBarBackButton extends StatefulWidget {
  const AppBarBackButton({
    Key? key,
    this.buttonColor,
  }) : super(key: key);
  final Color? buttonColor;

  @override
  State<AppBarBackButton> createState() => _AppBarBackButtonState();
}

class _AppBarBackButtonState extends State<AppBarBackButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      splashRadius: 20,
      icon: Icon(
        Icons.arrow_back_ios_new_rounded,
        size: kDefaultIconSize,
        color: widget.buttonColor ?? kSecondaryColor,
      ),
    );
  }
}
