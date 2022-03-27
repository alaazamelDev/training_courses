import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  int selectedTapIndex = 0;
  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    final String name = data['name'];
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: kSecondaryColor,
        title: PageTitle(
          title: '$name Training Courses',
        ),
        actions: const [
          AppBarBackButton(
            buttonColor: kPrimaryColor,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding,
          vertical: kDefaultVerticalPadding,
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      if (selectedTapIndex == 1) {
                        setState(() {
                          selectedTapIndex = 0;
                        });
                      }
                    },
                    child: Text(
                      'current courses',
                      style: TextStyle(
                        color: selectedTapIndex == 0
                            ? kSecondaryColor
                            : Colors.grey,
                        fontSize: kTitlesFontSize,
                      ),
                    ),
                  ),
                  SizedBox(width: kDefaultHorizontalPadding),
                  TextButton(
                    onPressed: () {
                      if (selectedTapIndex == 0) {
                        setState(() {
                          selectedTapIndex = 1;
                        });
                      }
                    },
                    child: Text(
                      'previous courses',
                      style: TextStyle(
                        color: selectedTapIndex == 1
                            ? kSecondaryColor
                            : Colors.grey,
                        fontSize: kTitlesFontSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.9,
                    crossAxisCount: 2,
                    mainAxisSpacing: kDefaultVerticalPadding * 0.5,
                    crossAxisSpacing: kDefaultHorizontalPadding * 0.5,
                  ),
                  itemCount: selectedTapIndex == 0
                      ? currentCourses.length
                      : previousCourses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CourseCard(
                      image: selectedTapIndex == 0
                          ? currentCourses[index]['image']
                          : previousCourses[index]['image'],
                      name: selectedTapIndex == 0
                          ? currentCourses[index]['name']
                          : previousCourses[index]['name'],
                      date: selectedTapIndex == 0
                          ? currentCourses[index]['date']
                          : previousCourses[index]['date'],
                      showExtraButton: true,
                      extraButtonColor:
                          selectedTapIndex == 0 ? kAccentColor : Colors.red,
                      extraButtonTitle:
                          selectedTapIndex == 0 ? 'details' : 'rate',
                      onPressed: () {
                        if (selectedTapIndex == 0) {
                          Navigator.pushNamed(context, '/course_details');
                        } else {
                          Navigator.pushNamed(context, '/rating');
                        }
                      },
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SubmitButton(
                  title: 'Add a new course',
                  radius: 15,
                  onPressed: () {
                    // Add course functionality
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
