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

// Icon size
const double kDefaultIconSize = 30;

// font sizes
final kTitlesFontSize = 16.sp;
final kTextFontSize = 14.sp;
final kUsernameFontSize = 24.sp;
final kStepperFontSize = 12.sp;

// width & height constants
double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// Routes
var routes = {
  '/': (context) => const ProfilePage(),
  '/modification': (context) => const ModificationPage(),
  '/clubs': (context) => const ClubsPage(),
  '/courses': (context) => const CoursesPage(),
  '/order_status': (context) => const OrderStatusPage(),
  '/info': (context) => const InfoPage(),
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

// Settings sheet options list
final List settingOptions = [
  {
    'icon': Icons.public_rounded,
    'title': 'Language',
  },
  {
    'icon': Icons.notifications_none_rounded,
    'title': 'Notices',
  },
  {
    'icon': Icons.phone_in_talk_rounded,
    'title': 'Help',
  },
];

// Available clubs list
final List availableClubs = [
  {
    'image': 'assets/club.jpg',
    'name': 'Club Name',
    'id': 'Club ID',
  },
  {
    'image': 'assets/club.jpg',
    'name': 'Club Name',
    'id': 'Club ID',
  },
  {
    'image': 'assets/club.jpg',
    'name': 'Club Name',
    'id': 'Club ID',
  },
  {
    'image': 'assets/club.jpg',
    'name': 'Club Name',
    'id': 'Club ID',
  },
];

// Current courses list
final List currentCourses = [
  {
    'image': 'assets/user.jpg',
    'name': 'Course',
    'date': '01234567',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Course',
    'date': '01234567',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Course',
    'date': '01234567',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Course',
    'date': '01234567',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Coursee',
    'date': '01234567',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Course',
    'date': '01234567',
  },
];

// Previous courses list
final List previousCourses = [
  {
    'image': 'assets/course.jpg',
    'name': 'Previous',
    'date': '98765432',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Previous',
    'date': '98765432',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Previous',
    'date': '98765432',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Previous',
    'date': '98765432',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Previous',
    'date': '98765432',
  },
  {
    'image': 'assets/course.jpg',
    'name': 'Previous',
    'date': '98765432',
  },
];
