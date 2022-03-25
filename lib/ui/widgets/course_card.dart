import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.image,
    required this.name,
    required this.date,
    required this.onPressed,
  }) : super(key: key);

  final String image;
  final String name;
  final String date;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
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
            SizedBox(height: kDefaultVerticalPadding * 0.5),
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
    );
  }
}
