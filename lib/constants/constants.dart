import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_courses/ui/pages/pages.dart';

// constant colors
const Color kPrimaryColor = Color(0xFF155B5A);
const Color kSecondaryColor = Color(0xFFFFFFFF);
const Color kAccentColor = Color(0xFFFFBA00);
const Color kGreyColor = Colors.grey;

// constatn padding
final kDefaultHorizontalPadding = ScreenUtil().setWidth(20);
final kDefaultVerticalPadding = ScreenUtil().setHeight(20);

// font sizes
final kTitlesFontSize = 16.sp;
final kTextFontSize = 14.sp;
final kUsernameFontSize = 24.sp;

// Routes
var routes = {
  '/': (context) => ProfilePage(),
  '/modification': (context) => const ModificationPage(),
};

// profile page options list
final List profileOptions = [
  {
    'icon': Icons.account_balance_rounded,
    'title': 'Clubs',
  },
  {
    'icon': Icons.settings_rounded,
    'title': 'Settings',
  },
  {
    'icon': Icons.logout_rounded,
    'title': 'Logout',
  },
];

// modification page options list
final List modificationOptions = [
  {
    'icon': Icons.add_photo_alternate_outlined,
    'title': 'Change Image',
  },
  {
    'icon': Icons.phone_rounded,
    'title': 'Change phone number',
  },
  {
    'icon': Icons.lock_rounded,
    'title': 'Change the password',
  },
  {
    'icon': Icons.person_rounded,
    'title': 'Name',
    'trailing': Icons.arrow_forward_rounded
  },
];
