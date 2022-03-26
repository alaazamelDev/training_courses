import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Climb the ladder of success\nand make your mark',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: kTitlesFontSize,
                ),
              ),
              SizedBox(height: kDefaultVerticalPadding),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.asset('assets/ladder.svg'),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultVerticalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: kDefaultHorizontalPadding),
                    child: Text(
                      'New training courses',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: kTitlesFontSize,
                      ),
                    ),
                  ),
                  SizedBox(height: kDefaultVerticalPadding),
                  SizedBox(
                    height: getScreenHeight(context) * 0.25,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(
                          left: kDefaultHorizontalPadding * 0.5),
                      itemCount: currentCourses.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          width: getScreenWidth(context) * 0.4,
                          height: getScreenWidth(context) * 0.4,
                          margin: EdgeInsets.only(
                              right: kDefaultHorizontalPadding * 0.5),
                          child: CourseCard(
                            image: currentCourses[index]['image'],
                            name: currentCourses[index]['name'],
                            date: currentCourses[index]['date'],
                            onPressed: () {
                              Navigator.pushNamed(context, '/course_details');
                            },
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
