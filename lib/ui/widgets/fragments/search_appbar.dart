import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      centerTitle: true,
      elevation: 0,
      title: const PageTitle(
        title: 'Search',
        titleColor: kSecondaryColor,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
