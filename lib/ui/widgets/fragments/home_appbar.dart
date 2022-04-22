import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kSecondaryColor,
      leading: IconButton(
        icon: const Icon(
          Icons.notifications_outlined,
          size: kDefaultIconSize,
          color: kPrimaryColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/notifications');
        },
        splashRadius: 20,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/request');
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.add,
            color: kPrimaryColor,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
