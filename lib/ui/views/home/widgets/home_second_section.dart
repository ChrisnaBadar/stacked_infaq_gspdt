import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeSecondSection extends StatelessWidget {
  const HomeSecondSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ScreenTypeLayout.builder(
        desktop: (_) => Row(
          children: [
            //About Us
            Expanded(child: _aboutUs(context)),

            //Urgent Cause
            Expanded(flex: 2, child: _urgentCause(context))
          ],
        ),
        mobile: (_) => Column(
          children: [_aboutUs(context), _urgentCause(context)],
        ),
      ),
    );
  }
}

Widget _aboutUs(BuildContext context) {
  return Padding(
    padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        desktop: const EdgeInsets.only(right: 10.0, left: 20)),
    child: Container(
      height: 300,
      decoration: BoxDecoration(border: Border.all()),
      child: Stack(
        children: [
          Image.network(
            "https://picsum.photos/200/300",
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child; // Image is fully loaded
              }
              return const Center(
                child: CircularProgressIndicator(
                  color:
                      kcPrimaryColor, // Show progress indicator while image is loading
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => const SizedBox(),
          ),
          Container(color: kcBackgroundColor.withOpacity(.75)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //section title
                Text(
                  "About Us",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: kcVeryLightGrey),
                ),
                verticalSpace(10),

                //who are we
                Text(
                  "Who are we?",
                  style: ktsBodyRegular.copyWith(
                    color: kcVeryLightGrey,
                  ),
                ),
                verticalSpace(10),

                //description
                Text(
                  faker.lorem.sentences(10).join(" "),
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: ktsBodyRegular.copyWith(color: kcWhite),
                ),
                verticalSpace(10),

                //learn more
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Learn More",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    )),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _urgentCause(BuildContext context) {
  return Padding(
    padding: getValueForScreenType(
        context: context,
        mobile: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        desktop: const EdgeInsets.only(right: 20.0, left: 10)),
    child: Container(
      height:
          getValueForScreenType(context: context, mobile: 350, desktop: 300),
      decoration: BoxDecoration(border: Border.all()),
      child: Stack(
        children: [
          Image.network(
            "https://picsum.photos/400/200",
            width: double.infinity,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child; // Image is fully loaded
              }
              return const Center(
                child: CircularProgressIndicator(
                  color:
                      kcPrimaryColor, // Show progress indicator while image is loading
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => const SizedBox(),
          ),
          Container(color: kcBackgroundColor.withOpacity(.75)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //section title
                Text(
                  "Urgent Cause",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: kcVeryLightGrey),
                ),
                verticalSpace(10),

                //who are we
                Text(
                  faker.lorem.words(4).join(" "),
                  style: ktsBodyLarge.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: kcVeryLightGrey,
                  ),
                ),
                verticalSpace(10),

                //description
                Text(
                  faker.lorem.sentences(10).join(" "),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: ktsBodyRegular.copyWith(color: kcWhite),
                ),
                verticalSpace(10),

                //learn more
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Learn More",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    )),
                verticalSpace(10),
                LinearPercentIndicator(
                  lineHeight: 5,
                  percent: .5,
                  progressColor: kcLightGrey,
                  backgroundColor: kcDarkGreyColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Rp. x.xxx.xxx,- Collected",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    ),
                    Text(
                      "from RP. xx.xxx.xxx,-",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    ),
                  ],
                ),
                verticalSpace(10),
                MaterialButton(
                  onPressed: () {
                    // Add your onPressed code here
                  },
                  color: kcVeryLightGrey,
                  textColor: kcPrimaryColorDark,
                  child: SizedBox(
                      width: 200,
                      height: 25,
                      child: Text(
                        'DONATE',
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(
                            fontWeight: FontWeight.w700),
                      )),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the corner radius here
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
