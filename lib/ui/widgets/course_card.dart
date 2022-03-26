import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:training_courses/constants/constants.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.image,
    required this.name,
    required this.date,
    this.showExtraButton = false,
    this.extraButtonColor,
    this.extraButtonTitle,
    this.onPressed,
  }) : super(key: key);

  final String image;
  final String name;
  final String date;
  final Function()? onPressed;
  final bool showExtraButton;
  final Color? extraButtonColor;
  final String? extraButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !showExtraButton ? onPressed : null,
      child: Stack(
        children: [
          Container(
            margin:
                EdgeInsets.symmetric(vertical: kDefaultVerticalPadding * 0.5),
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: kDefaultHorizontalPadding),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: kDefaultVerticalPadding * 0.25),
                Text(
                  name,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: kTitlesFontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'date: ' + date,
                  style: TextStyle(
                    color: kPrimaryColor.withOpacity(0.5),
                    fontSize: kTextFontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          if (showExtraButton)
            Positioned.fill(
              child: Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: InkWell(
                  onTap: onPressed,
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: ScreenUtil().setWidth(70),
                    height: ScreenUtil().setHeight(20),
                    decoration: BoxDecoration(
                      color: extraButtonColor ?? Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        extraButtonTitle ?? '',
                        style: TextStyle(fontSize: kTextFontSize),
                      ),
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
