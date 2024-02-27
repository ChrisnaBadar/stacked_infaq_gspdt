import 'package:infaq/models/fundraise_model.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/cause_details/cause_details_viewmodel.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_donation_progress.dart';
import 'package:infaq/ui/views/cause_details/widgets/secondary_parts/cdsp_news_articles.dart';
import 'package:infaq/ui/widgets/themed_button.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class CauseDetailsSecondaryRow extends StatelessWidget {
  final FundraiseModel? fundraiseModel;
  final CauseDetailsViewModel viewModel;
  const CauseDetailsSecondaryRow(
      {super.key, required this.fundraiseModel, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text Widget
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(children: [
              TextSpan(text: ''),
              TextSpan(text: ' '),
            ])),
            Text(
              "(Q.S. Al-Baqarah: 261)",
              style: ktsBodyLarge.copyWith(
                  fontSize: 17, fontWeight: FontWeight.w900),
            ),
            const Divider(),
            Text(
              '"Perumpamaan orang-orang yang menginfakkan hartanya di jalan Allah adalah seperti (orang-orang yang menabur) sebutir biji (benih) yang menumbuhkan tujuh tangkai, pada setiap tangkai ada seratus biji. Allah melipatgandakan (pahala) bagi siapa yang Dia kehendaki. Allah Mahaluas lagi Maha Mengetahui."',
              maxLines: 10,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: ktsBodyRegular,
            )
          ],
        ),

        verticalSpace(30),

        //Archive
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: _dayLeft(fundraiseModel!),
                    style:
                        ktsBodyRegular.copyWith(fontWeight: FontWeight.w900)),
                TextSpan(text: " left\n", style: ktsBodyRegular),
                const TextSpan(text: "Active until "),
                TextSpan(text: _dateEnd(fundraiseModel!)),
              ]))
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 231, 229, 229),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CauseDetailsDonationProgress(
                fundraiseModel: fundraiseModel!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: LinearPercentIndicator(
                  percent: (fundraiseModel!.data!.attributes!.donations!.data!
                          .where((element) =>
                              element.attributes!.donationStatus == "Diterima")
                          .map((e) => int.parse(e.attributes!.nominal!))
                          .reduce((value, element) => value + element)) /
                      double.parse(
                          fundraiseModel!.data!.attributes!.targetDonation!),
                  progressColor: kcPrimaryColorDark,
                ),
              ),
              Text(
                fundraiseModel!.data!.attributes!.title!,
                style: ktsBodyRegular.copyWith(
                    fontWeight: FontWeight.w800, color: kcPrimaryColorDark),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                    width: kdDesktopMaxContentWidth,
                    child: ThemedButton(
                        onPressed: () {
                          viewModel.showDonateDialog(
                              id: fundraiseModel!.data!.id!,
                              causeTitle:
                                  fundraiseModel!.data!.attributes!.title!,
                              description: 'description');
                        },
                        buttonText: "INFAQ")),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                    width: kdDesktopMaxContentWidth,
                    child: ThemedButton(
                        onPressed: () async {
                          await viewModel.shareLink(
                              id: fundraiseModel!.data!.id!.toString());
                        },
                        buttonText: "SHARE")),
              ),
              verticalSpace(20),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.people_alt_outlined),
                  label: Text(
                    "${fundraiseModel!.data!.attributes!.donations!.data!.length} People has donated",
                    style: ktsBodyRegular,
                  )),
              verticalSpace(20),
              donatorsMiles(),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ThemedButton(
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text(
                                'Halaman Fitur ini masih dalam tahap perbaikan'),
                            duration: Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        buttonText: "See All"),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ThemedButton(
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text(
                                'Halaman Fitur ini masih dalam tahap perbaikan'),
                            duration: Duration(seconds: 3),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        buttonText: "See Top"),
                  )),
                ],
              )
            ],
          ),
        ),
        verticalSpace(20),

        //Recent News
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //title
            Text(
              "News & Articles",
              style: ktsBodyLarge.copyWith(
                  fontSize: 17, fontWeight: FontWeight.w900),
            ),
            const Divider(),

            //Tile
            CauseDetailsNewsArticles(
              viewModel: viewModel,
            )
          ],
        ),

        //Tag Clound
        const Column()
      ],
    );
  }

  SizedBox donatorsMiles() {
    int findMaxValue() {
      int maxValue = int.parse(fundraiseModel!.data!.attributes!.donations!
          .data!.first.attributes!.nominal!); // Start with the first value
      for (var model in fundraiseModel!.data!.attributes!.donations!.data!) {
        if (int.parse(model.attributes!.nominal!) > maxValue) {
          maxValue = int.parse(model.attributes!
              .nominal!); // Update maxValue if a larger value is found
        }
      }

      return maxValue;
    }

    final formatter = NumberFormat('#,##0.0', 'id_ID');

    //Recent Donation
    var recentDonationData = fundraiseModel!.data!.attributes!.donations!.data!
      ..sort((a, b) =>
          a.attributes!.createdAt!.compareTo(b.attributes!.createdAt!))
      ..first;
    var recentDonationName = recentDonationData.first.attributes!.nama;
    var recentDonationValue =
        NumberFormat.currency(locale: "id_ID", symbol: "IDR ")
            .format(int.parse(recentDonationData.first.attributes!.nominal!));
    double recentUsdValue =
        int.parse(recentDonationData.first.attributes!.nominal!) / 16000.0;
    String formattedRecentUsdAmount = formatter.format(recentUsdValue);

    //Top Donations
    var topDonationData = fundraiseModel!.data!.attributes!.donations!.data!
        .where((element) =>
            element.attributes!.nominal == findMaxValue().toString())
        .first;
    var topDonationName = topDonationData.attributes!.nama!;
    var topDonationValue =
        NumberFormat.currency(locale: "id_ID", symbol: "IDR ")
            .format(int.parse(topDonationData.attributes!.nominal!));
    double topUsdValue =
        int.parse(topDonationData.attributes!.nominal!) / 16000.0;
    String formattedTopUsdAmount = formatter.format(topUsdValue);

    //First Donation
    var firstDonationData = fundraiseModel!.data!.attributes!.donations!.data!
      ..sort((a, b) =>
          b.attributes!.createdAt!.compareTo(a.attributes!.createdAt!))
      ..first;
    var firstDonationName = firstDonationData.first.attributes!.nama;
    var firstDonationValue =
        NumberFormat.currency(locale: "id_ID", symbol: "IDR ")
            .format(int.parse(firstDonationData.first.attributes!.nominal!));
    double firstUsdValue =
        int.parse(firstDonationData.first.attributes!.nominal!) / 16000.0;
    String formattedFirstUsdAmount = formatter.format(firstUsdValue);
    return SizedBox(
      width: kdDesktopMaxContentWidth,
      height: 275,
      child: ListView(
        children: [
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              recentDonationName!,
              style: ktsBodyLarge,
            ),
            subtitle: Text.rich(
              TextSpan(children: [
                TextSpan(text: "$recentDonationValue\n", style: ktsBodyRegular),
                TextSpan(
                  text: "(in USD $formattedRecentUsdAmount) ",
                  style: ktsBodyRegular.copyWith(
                      color: kcPrimaryColorDark, fontWeight: FontWeight.w900),
                ),
                TextSpan(
                  text: "Recent Donation",
                  style: ktsBodyRegular.copyWith(color: kcPrimaryColorDark),
                ),
                const TextSpan(
                  text: "\n",
                )
              ]),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              topDonationName,
              style: ktsBodyLarge,
            ),
            subtitle: Text.rich(
              TextSpan(children: [
                TextSpan(text: "$topDonationValue\n", style: ktsBodyRegular),
                TextSpan(
                  text: "(in USD $formattedTopUsdAmount) ",
                  style: ktsBodyRegular.copyWith(
                      color: kcPrimaryColorDark, fontWeight: FontWeight.w900),
                ),
                TextSpan(
                  text: "Top Donation",
                  style: ktsBodyRegular.copyWith(color: kcPrimaryColorDark),
                ),
                const TextSpan(
                  text: "\n",
                )
              ]),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: Text(
              firstDonationName!,
              style: ktsBodyLarge,
            ),
            subtitle: Text.rich(
              TextSpan(children: [
                TextSpan(text: "$firstDonationValue\n", style: ktsBodyRegular),
                TextSpan(
                  text: "(in USD $formattedFirstUsdAmount) ",
                  style: ktsBodyRegular.copyWith(
                      color: kcPrimaryColorDark, fontWeight: FontWeight.w900),
                ),
                TextSpan(
                  text: "First Donation",
                  style: ktsBodyRegular.copyWith(color: kcPrimaryColorDark),
                ),
                const TextSpan(
                  text: "\n",
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }

  String _dateEnd(FundraiseModel fundraiseModel) {
    var dateEnd = DateFormat("dd MMMM yyyy")
        .format(fundraiseModel.data!.attributes!.dateEnd!);
    return dateEnd;
  }

  String _dayLeft(FundraiseModel fundraiseModel) {
    var dateStart = fundraiseModel.data!.attributes!.dateStart!;
    var now = DateTime.now();
    var totalDays = now.difference(dateStart).inDays;

    // More than 30 days: show months, weeks, and days
    if (totalDays > 30) {
      int months = totalDays ~/ 30;
      int weeks = (totalDays % 30) ~/ 7;
      int days = totalDays % 7;

      String result = "$months months";
      if (weeks > 0) {
        result += ", $weeks weeks";
      }
      if (days > 0) {
        result += ", $days days";
      }
      return result;
    }
    // Between 7 and 30 days: show weeks and days
    else if (totalDays > 7) {
      int weeks = totalDays ~/ 7;
      int days = totalDays % 7;

      String result = "$weeks weeks";
      if (days > 0) {
        result += ", $days days";
      }
      return result;
    }
    // Less than or equal to 7 days: show days only
    else {
      return "$totalDays days";
    }
  }
}
