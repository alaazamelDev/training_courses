import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: kPrimaryColor, fontSize: kTitlesFontSize),
        ),
        leading: IconButton(
          onPressed: () {
            // Implement onPressed functionality
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.notification_add_outlined,
            color: kPrimaryColor,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Go to modification page
              Navigator.pushNamed(context, '/modification');
            },
            splashRadius: 20,
            icon: const Icon(
              Icons.edit_rounded,
              color: kPrimaryColor,
              size: 30,
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomButtomNavigationBar(
        onTap: (index) {
          // Implement page transitions
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: kPrimaryColor,
              child: Center(
                child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/user.jpg'),
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
                      flex: 2,
                      child: UserInformation(
                        username: 'Username',
                        phonenumber: 'Phone number',
                        numberID: 'Number ID',
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Center(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: profileOptions.length,
                          itemBuilder: (context, index) {
                            return OptionListTile(
                              icon: profileOptions[index]['icon'],
                              title: profileOptions[index]['title'],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
