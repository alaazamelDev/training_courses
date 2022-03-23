import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';

class OptionListTile extends StatelessWidget {
  const OptionListTile({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Icon(
        icon,
        color: kGreyColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: kGreyColor,
          fontSize: kTextFontSize,
        ),
      ),
    );
  }
}
