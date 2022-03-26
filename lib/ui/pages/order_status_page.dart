import 'package:flutter/material.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/widgets.dart';

class OrderStatusPage extends StatelessWidget {
  const OrderStatusPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        leading: const SizedBox(),
        backgroundColor: kPrimaryColor,
        title: const PageTitle(
          title: 'Order Status',
          titleColor: kSecondaryColor,
        ),
        elevation: 0,
        actions: const [
          AppBarBackButton(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: getScreenHeight(context) * 0.05),
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ordersList.length,
              itemBuilder: (BuildContext context, int index) {
                return OrderEntry(
                  index: index + 1,
                  orderCurrentStage: ordersList[index]['currentStage'],
                  failedStages: ordersList[index]['failedStages'],
                  onPressed: () {
                    _showNoteSheet(context);
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                flex: 5,
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: kSecondaryColor),
                      right: BorderSide(color: kSecondaryColor),
                    ),
                  ),
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          )
        ],
      ),
    );
  }
}

void _showNoteSheet(BuildContext context) {
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
    builder: (context) {
      return Container(
        height: getScreenHeight(context) * 0.5,
        width: getScreenWidth(context),
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding,
          vertical: kDefaultVerticalPadding * 0.5,
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: kDefaultHorizontalPadding * 1.5),
                  const PageTitle(
                    title: 'Note',
                    titleColor: kSecondaryColor,
                  ),
                  IconButton(
                    onPressed: () {
                      // Close sheet
                      Navigator.pop(context);
                    },
                    splashRadius: 25,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: kSecondaryColor,
                      size: kDefaultIconSize,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: kDefaultVerticalPadding),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Approved, we wish you success',
                    style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: kTextFontSize,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: kAccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: kDefaultHorizontalPadding * 2.0,
                        vertical: kDefaultVerticalPadding * 0.25,
                      ),
                      child: Text(
                        'Confirmation',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: kTitlesFontSize,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}
