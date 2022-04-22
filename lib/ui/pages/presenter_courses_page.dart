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
  bool updated = false;

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments;
    if (data != null && !updated) {
      selectedTapIndex = (data as Map<String, Object>)['selected_index'] as int;
      updated = true;
    }
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        leading: const SizedBox(),
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: PageTitle(
          title: selectedTapIndex == 0
              ? 'My Training Courses'
              : 'Training Courses',
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
                      'upcoming courses',
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
                      'presented courses',
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
                      showExtraButton: selectedTapIndex != 0,
                      extraButtonColor: kAccentColor,
                      extraButtonTitle: 'report',
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
          ],
        ),
      ),
    );
  }
}
