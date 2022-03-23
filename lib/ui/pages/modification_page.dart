import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/option_listtile.dart';

class ModificationPage extends StatelessWidget {
  const ModificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: kSecondaryColor,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setHeight(40),
                  backgroundImage: const AssetImage('assets/user.jpg'),
                ),
                SizedBox(width: kDefaultHorizontalPadding),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Saja Alharbi',
                      style: TextStyle(
                        fontSize: kUsernameFontSize,
                        color: kSecondaryColor,
                      ),
                    ),
                    SizedBox(height: kDefaultVerticalPadding * 0.2),
                    Text(
                      '050XXXXXX',
                      style: TextStyle(
                        fontSize: kTextFontSize,
                        color: kSecondaryColor,
                      ),
                    ),
                    SizedBox(height: kDefaultVerticalPadding * 0.2),
                    Text(
                      '12345678901',
                      style: TextStyle(
                        fontSize: kTextFontSize,
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: modificationOptions.length,
                itemBuilder: (context, index) {
                  return index == 3
                      ? ListTile(
                          tileColor: kAccentColor.withOpacity(0.8),
                          leading: Icon(
                            modificationOptions[index]['icon'],
                            color: Colors.black,
                          ),
                          title: Text(
                            modificationOptions[index]['title'],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: kTextFontSize,
                            ),
                          ),
                          trailing: Icon(
                            modificationOptions[index]['trailing'],
                            color: Colors.black,
                          ),
                        )
                      : OptionListTile(
                          icon: modificationOptions[index]['icon'],
                          title: modificationOptions[index]['title'],
                        );
                },
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: kAccentColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: kDefaultHorizontalPadding * 2.5,
                    vertical: kDefaultVerticalPadding * 0.5,
                  ),
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: kTitlesFontSize,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
