import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/constants/enums.dart';
import 'package:training_courses/ui/widgets/appbar_back_button.dart';
import 'package:training_courses/ui/widgets/page_title.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: const AppBarBackButton(buttonColor: kPrimaryColor),
        title: const PageTitle(
          title: 'Notifications',
          titleColor: kSecondaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(
              Icons.add_circle_outline_rounded,
              size: kDefaultIconSize,
              color: kSecondaryColor,
            ),
          )
        ],
      ),
      body: SizedBox(
        width: getScreenWidth(context),
        height: getScreenHeight(context),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: notificationsList.length,
          itemBuilder: (context, index) {
            var notification = notificationsList[index];
            IconData icon;
            String title;
            Color color;

            // Determine the values of icons and title
            switch (notification['type']) {
              case NotificationType.success:
                color = Colors.green;
                title = 'Success';
                icon = Icons.check_circle_outline_rounded;
                break;
              case NotificationType.newCourse:
                color = Colors.blue;
                title = 'New Course';
                icon = Icons.fiber_new_outlined;
                break;
              case NotificationType.warning:
                color = Colors.red;
                title = 'Warning';
                icon = Icons.adjust;
                break;
              case NotificationType.reminder:
                color = Colors.amberAccent;
                title = 'Reminder';
                icon = Icons.error_outline_rounded;
                break;
              default:
                color = Colors.black;
                title = 'Null';
                icon = Icons.notifications_none;
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: color, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                leading: Icon(
                  icon,
                  size: kDefaultIconSize,
                  color: color,
                ),
                title: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: kTitlesFontSize,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
