import 'package:flutter/material.dart';
import 'package:progress_timeline/progress_timeline.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/appbar_back_button.dart';
import 'package:training_courses/ui/widgets/page_title.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: const AppBarBackButton(),
        backgroundColor: kPrimaryColor,
        title: const PageTitle(
          title: 'Order Status',
          titleColor: kSecondaryColor,
        ),
        elevation: 0,
      ),
      body: const ProgressStepper(),
    );
  }
}

class ProgressStepper extends StatefulWidget {
  const ProgressStepper({
    Key? key,
  }) : super(key: key);

  @override
  State<ProgressStepper> createState() => _ProgressStepperState();
}

class _ProgressStepperState extends State<ProgressStepper> {
  late ProgressTimeline progressTimeline;
  List<SingleState> stages = [
    SingleState(stateTitle: 'request'),
    SingleState(stateTitle: 'review'),
    SingleState(stateTitle: 'approval'),
    SingleState(stateTitle: 'reject'),
    SingleState(stateTitle: 'end'),
  ];

  @override
  void initState() {
    progressTimeline = ProgressTimeline(
      states: stages,
      iconSize: kDefaultIconSize,
      textStyle: TextStyle(
        color: kSecondaryColor,
        fontSize: kStepperFontSize,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return progressTimeline;
  }
}
