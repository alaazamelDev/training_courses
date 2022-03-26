import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class CourseDetailsPage extends StatefulWidget {
  const CourseDetailsPage({Key? key}) : super(key: key);

  @override
  State<CourseDetailsPage> createState() => _CourseDetailsPageState();
}

class _CourseDetailsPageState extends State<CourseDetailsPage> {
  // to change registration button state
  late bool isRegistered;
  @override
  void initState() {
    super.initState();
    isRegistered = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        leading: const SizedBox(),
        actions: const [AppBarBackButton()],
        title: const PageTitle(
          title: 'Training Courses',
          titleColor: kSecondaryColor,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: kDefaultHorizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: Text(
                      'The Title of Training Course',
                      style: TextStyle(
                        color: kSecondaryColor,
                        fontSize: kCourseTitleFontSize,
                      ),
                    ),
                  ),
                  SizedBox(width: kDefaultHorizontalPadding * 0.5),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: kDefaultVerticalPadding),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/course.jpg',
                        width: getScreenWidth(context) * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  bottom: 0,
                  child: SvgPicture.asset('assets/background.svg'),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: courseDetailsList
                                .map<Widget>(
                                  (detailsElement) => DetailsWidget(
                                    icon: detailsElement['icon'],
                                    title: detailsElement['title'],
                                  ),
                                )
                                .toList(),
                          ),
                          SizedBox(height: kDefaultVerticalPadding * 0.5),
                          Column(
                            children: const [
                              DetailsWidget(
                                icon: Icons.description_outlined,
                                title: 'Date',
                              ),
                              DetailsWidget(
                                icon: Icons.schedule_rounded,
                                title: 'Time',
                              ),
                              DetailsWidget(
                                icon: Icons.place,
                                title: 'Location',
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            EdgeInsets.only(right: kDefaultHorizontalPadding),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: TextButton(
                            onPressed: () {
                              // Implement course registration functionality
                              setState(() {
                                isRegistered = !isRegistered;
                              });
                              print(isRegistered);
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: kAccentColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: kDefaultHorizontalPadding * 1.5,
                                vertical: kDefaultVerticalPadding * 0.5,
                              ),
                              child: Text(
                                isRegistered
                                    ? 'Cancel Registration'
                                    : 'Register',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: kTextFontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
