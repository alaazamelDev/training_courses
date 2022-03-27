import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: kPrimaryColor,
            child: Center(
              child: CircleAvatar(
                backgroundImage: const AssetImage('assets/user.png'),
                radius: ScreenUtil().setHeight(45),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultHorizontalPadding * 0.25,
                vertical: kDefaultVerticalPadding * 0.5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Expanded(
                    flex: 1,
                    child: UserInformation(
                      username: 'Username',
                      phonenumber: 'Phone number',
                      numberID: 'Number ID',
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Divider(
                            color: Colors.grey.withOpacity(0.5),
                            height: 0.05,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: profileOptions.length,
                            itemBuilder: (context, index) {
                              return OptionListTile(
                                icon: profileOptions[index]['icon'],
                                title: profileOptions[index]['title'],
                                onPressed: () {
                                  // Move to the selected page
                                  switch (index) {
                                    case 0:
                                      Navigator.pushNamed(context, '/clubs');
                                      break;
                                    case 1:
                                      _showSettingsSheet(context);
                                      break;
                                    case 2:
                                      // Implement Logout functionality
                                      break;
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void _showSettingsSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: kPrimaryColor,
    elevation: 1,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    builder: (BuildContext context) {
      return SettingsSheet(
        onOptionPressed: (index) {
          switch (index) {
            case 0:
              break;
            case 1:
              Navigator.pushReplacementNamed(context, '/notifications');
              break;
          }
        },
      );
    },
  );
}
