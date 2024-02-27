import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/app_values.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/home/home_viewmodel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:intl/intl.dart';

class HomeSecondSection extends StatelessWidget {
  final HomeViewModel viewModel;
  final FundraisesListModel? fundraisesListModel;
  const HomeSecondSection(
      {super.key, required this.viewModel, required this.fundraisesListModel});

  @override
  Widget build(BuildContext context) {
    FundraisesListModelDatum featuredData = fundraisesListModel!.data!
        .where((el) => el.attributes!.urgentCause == true)
        .toList()
        .first;
    var targetDonation = featuredData.attributes!.targetDonation;
    var collectedDonation = featuredData.attributes!.donations!.data!
        .where((e) => e.attributes!.donationStatus! == "Diterima")
        .map((e) => int.parse(e.attributes!.nominal!))
        .reduce((v, t) => v + t);

    Map<String, dynamic> dataList = {
      "id": featuredData.id,
      "img":
          "https://api.amala-api.online${featuredData.attributes!.mainImage!.data!.attributes!.url!}",
      "title":
          featuredData.attributes!.title!, // Assuming title is available here
      "description":
          featuredData.attributes!.description!.first.children!.first.text,
      "targetDonation": NumberFormat.currency(locale: "id_ID", symbol: "Rp.")
          .format(int.parse(targetDonation!))
          .substring(
              0,
              NumberFormat.currency(locale: "id_ID", symbol: "Rp.")
                      .format(int.parse(targetDonation))
                      .length -
                  3),
      "collectedDonation": NumberFormat.currency(locale: "id_ID", symbol: "Rp.")
          .format(collectedDonation)
          .substring(
              0,
              NumberFormat.currency(locale: "id_ID", symbol: "Rp.")
                      .format(collectedDonation)
                      .length -
                  3),
      "percentage": collectedDonation / int.parse(targetDonation),
      "causeId": featuredData.id.toString()
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ScreenTypeLayout.builder(
        desktop: (_) => Row(
          children: [
            //About Us
            Expanded(child: _aboutUs(context)),

            //Urgent Cause
            Expanded(flex: 2, child: _urgentCause(context, dataList, viewModel))
          ],
        ),
        mobile: (_) => Column(
          children: [
            _aboutUs(context),
            _urgentCause(context, dataList, viewModel)
          ],
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
                  "Amala App Infaq",
                  style: ktsBodyRegular.copyWith(
                    color: kcVeryLightGrey,
                  ),
                ),
                verticalSpace(10),

                //description
                Text(
                  about_us_paragraph_1,
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

Widget _urgentCause(BuildContext context, Map<String, dynamic> dataList,
    HomeViewModel viewModel) {
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
            dataList['img'],
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
                  dataList['title'],
                  style: ktsBodyLarge.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    color: kcVeryLightGrey,
                  ),
                ),
                verticalSpace(10),

                //description
                Text(
                  dataList['description'],
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: ktsBodyRegular.copyWith(color: kcWhite),
                ),
                verticalSpace(10),

                //learn more
                TextButton(
                    onPressed: () {
                      // print(dataList['causeId']);
                      viewModel.toCauseDetailsView(
                          causeId: dataList['causeId']);
                    },
                    child: Text(
                      "Learn More",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    )),
                verticalSpace(10),
                LinearPercentIndicator(
                  lineHeight: 5,
                  percent: dataList['percentage'],
                  progressColor: kcLightGrey,
                  backgroundColor: kcDarkGreyColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${dataList['collectedDonation']} Collected",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    ),
                    Text(
                      "from ${dataList['targetDonation']}",
                      style: ktsBodyRegular.copyWith(color: kcWhite),
                    ),
                  ],
                ),
                verticalSpace(10),
                MaterialButton(
                  onPressed: () {
                    viewModel.showDonateDialog(
                        causeTitle: dataList['title'],
                        description: dataList['description'],
                        id: dataList['id']);
                  },
                  color: kcVeryLightGrey,
                  textColor: kcPrimaryColorDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the corner radius here
                  ),
                  child: SizedBox(
                      width: 200,
                      height: 25,
                      child: Text(
                        'INFAQ',
                        textAlign: TextAlign.center,
                        style: ktsBodyRegular.copyWith(
                            fontWeight: FontWeight.w700),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
