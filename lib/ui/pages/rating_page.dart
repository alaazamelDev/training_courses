import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:training_courses/constants/constants.dart';
import 'package:training_courses/ui/widgets/page_title.dart';
import 'package:training_courses/ui/widgets/submit_button.dart';

class RatingPage extends StatefulWidget {
  const RatingPage({Key? key}) : super(key: key);

  @override
  State<RatingPage> createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        elevation: 0,
        title: const PageTitle(
          title: 'Rating (training course)',
          titleColor: kSecondaryColor,
        ),
        leading: const SizedBox(),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const RotatedBox(
              quarterTurns: 1,
              child: Icon(
                Icons.arrow_circle_up_rounded,
                size: kDefaultIconSize,
                color: kSecondaryColor,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultHorizontalPadding,
          vertical: kDefaultVerticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: ratingList
                  .map<Widget>(
                    (ratingItem) => ServiceRating(
                      icon: ratingItem['icon'],
                      title: ratingItem['title'],
                      rate: ratingItem['rate'],
                      onRateChanged: (rate) {
                        ratingItem['rate'] = rate;
                      },
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: kDefaultVerticalPadding * 2),
            SubmitButton(
              title: 'Submit',
              radius: 15,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class ServiceRating extends StatelessWidget {
  const ServiceRating({
    Key? key,
    this.icon,
    required this.title,
    required this.rate,
    required this.onRateChanged,
  }) : super(key: key);
  final IconData? icon;
  final String title;
  final double rate;
  final Function(double) onRateChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon != null
          ? Icon(
              icon,
              color: kSecondaryColor,
            )
          : const SizedBox(
              width: 24,
              height: 24,
            ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: kSecondaryColor,
              fontSize: kTextFontSize,
            ),
          ),
          RatingBar.builder(
            initialRating: rate,
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemSize: 20,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: onRateChanged,
          ),
        ],
      ),
    );
  }
}
