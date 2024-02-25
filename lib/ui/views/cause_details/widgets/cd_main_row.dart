import 'package:flutter/material.dart';
import 'package:infaq/models/fundraise_model.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/cause_details/cause_details_viewmodel.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_donation_progress.dart';
import 'package:infaq/ui/views/cause_details/widgets/lang_switch.dart';
import 'package:infaq/ui/views/cause_details/widgets/secondary_parts/cdsp_articles.dart';
import 'package:infaq/ui/widgets/themed_button.dart';
import 'package:infaq/ui/widgets/themed_image.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CauseDetailsMainRow extends StatelessWidget {
  final FundraiseModel? fundraiseModel;
  final CauseDetailsViewModel viewModel;
  const CauseDetailsMainRow(
      {super.key, required this.fundraiseModel, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    List<Widget> rowChildren = [
      //Title, start-date, tags Column
      Expanded(
        flex: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //date and tags
            dateNtags(fundraiseModel!),

            //title
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: causeTitle(),
            )
          ],
        ),
      ),

      //Button
      Expanded(
        child: donateButton(),
      )
    ];
    List<Widget> columnChildren = [
      dateNtags(fundraiseModel!),
      causeTitle(),
      verticalSpace(10),
      SizedBox(width: kdDesktopMaxContentWidth, child: donateButton())
    ];

    List<TextSpan> buildTextSpans(List<Description> descriptions) {
      List<TextSpan> spans = [];
      for (var description in descriptions) {
        for (var child in description.children ?? []) {
          if (child.text?.isNotEmpty == true) {
            spans.add(TextSpan(text: child.text + '\n\n'));
          } else {
            spans.add(TextSpan(text: '\n')); // Add a new line for empty text
          }
        }
      }
      return spans;
    }

    //START
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //main image
          ThemedImage(
            imgString: fundraiseModel!.data!.attributes!.imageLink!,
            width: double.infinity,
          ),

          // LangSwitch(),

          //Row of title and button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ScreenTypeLayout.builder(
              desktop: (_) => Row(
                children: rowChildren,
              ),
              mobile: (_) => Column(
                children: columnChildren,
              ),
            ),
          ),

          //percentage progress
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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

          //donation progress and pdf report form
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, bottom: 10),
            child: ScreenTypeLayout.builder(
              desktop: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CauseDetailsDonationProgress(
                    fundraiseModel: fundraiseModel!,
                  ),
                  pdfReport()
                ],
              ),
              mobile: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CauseDetailsDonationProgress(fundraiseModel: fundraiseModel!),
                  pdfReport()
                ],
              ),
            ),
          ),

          //description
          Text.rich(
            TextSpan(
                children: buildTextSpans(
                    fundraiseModel!.data!.attributes!.description!)),
          ),

          const Divider(),
          verticalSpace(20),

          //daftar donatur
          Text(
            "Donasi & Do'a",
            style: ktsBodyLarge.copyWith(
                fontSize: 17, fontWeight: FontWeight.w900),
          ),
          verticalSpace(10),
          SizedBox(
            width: kdDesktopMaxContentWidth,
            height: 500,
            child: ListView(
              children: List.generate(
                  fundraiseModel!.data!.attributes!.donations!.data!.length,
                  (index) => SizedBox(
                        width: kdDesktopMaxContentWidth * .5,
                        child: ListTile(
                          isThreeLine: true,
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.person,
                              color: kcWhite,
                            ),
                          ),
                          title: Text(
                            fundraiseModel!.data!.attributes!.donations!
                                .data![index].attributes!.nama!,
                            style: ktsBodyLarge.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w900),
                          ),
                          subtitle: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: NumberFormat.currency(
                                        locale: "id_ID", symbol: "Rp. ")
                                    .format(int.parse(fundraiseModel!
                                        .data!
                                        .attributes!
                                        .donations!
                                        .data![index]
                                        .attributes!
                                        .nominal!))
                                    .substring(
                                        0,
                                        NumberFormat.currency(
                                                    locale: "id_ID",
                                                    symbol: "Rp. ")
                                                .format(int.parse(
                                                    fundraiseModel!
                                                        .data!
                                                        .attributes!
                                                        .donations!
                                                        .data![index]
                                                        .attributes!
                                                        .nominal!))
                                                .length -
                                            3),
                                style: ktsBodyRegular.copyWith(
                                    fontWeight: FontWeight.w800, fontSize: 20)),
                            TextSpan(text: "\n"),
                            TextSpan(
                                text: fundraiseModel!.data!.attributes!
                                    .donations!.data![index].attributes!.pesan),
                            TextSpan(text: "\n")
                          ])),
                        ),
                      )),
            ),
          ),
          const Divider(),
          verticalSpace(20),

          //laporan alur dana
          CauseDetailsArticles(
            viewModel: viewModel,
          ),
        ],
      ),
    );
  }

  TextButton pdfReport() {
    return TextButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.document_scanner_outlined),
        label: const Text('Download PDF Report'));
  }

  ThemedButton donateButton() {
    return ThemedButton(
      onPressed: () {
        viewModel.showDonateDialog(
            causeTitle: fundraiseModel!.data!.attributes!.title!,
            description: fundraiseModel!
                .data!.attributes!.description!.first.children!.first.text!);
      },
      buttonText: 'INFAQ',
    );
  }

  Text causeTitle() {
    return Text(
      fundraiseModel!.data!.attributes!.title!,
      maxLines: 2,
      style: ktsBodyLarge.copyWith(fontSize: 20, fontWeight: FontWeight.w900),
    );
  }

  Row dateNtags(FundraiseModel fundraiseModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.timelapse,
          size: 12,
        ),
        const SizedBox(
          width: 10,
        ),
        dateStart(fundraiseModel),
        const SizedBox(
          width: 30,
        ),
        const Icon(
          Icons.folder,
          size: 12,
        ),
        const SizedBox(
          width: 10,
        ),
        // Text.rich(
        //   TextSpan(
        //     children: List.generate(
        //         3,
        //         (index) => TextSpan(
        //               text: 'Tags #${index + 1}',
        //               style: ktsBodyRegular, // Style as needed
        //               children: [
        //                 if (index < 2)
        //                   const TextSpan(
        //                       text:
        //                           ', '), // Add comma and space except after the last tag
        //               ],
        //             )),
        //   ),
        // )
      ],
    );
  }

  Text dateStart(FundraiseModel fundraiseModel) {
    return Text(
      DateFormat("dd MMMM yyyy")
          .format(fundraiseModel.data!.attributes!.dateStart!),
      style: ktsBodyRegular.copyWith(fontSize: 12),
    );
  }
}
