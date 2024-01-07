import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/cause_details/widgets/secondary_parts/cdsp_articles.dart';
import 'package:infaq/ui/widgets/themed_button.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CauseDetailsMainRow extends StatelessWidget {
  const CauseDetailsMainRow({super.key});

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
            dateNtags(),

            //title
            causeTitle()
          ],
        ),
      ),

      //Button
      Expanded(
        child: donateButton(),
      )
    ];
    List<Widget> columnChildren = [
      dateNtags(),
      causeTitle(),
      verticalSpace(10),
      SizedBox(width: kdDesktopMaxContentWidth, child: donateButton())
    ];
    //START
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //main image
          Placeholder(
            child: Image.network(
              "https://picsum.photos/400/200",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

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
            child: LinearPercentIndicator(),
          ),

          //donation progress and pdf report form
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10, bottom: 10),
            child: ScreenTypeLayout.builder(
              desktop: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [donationProgress(), pdfReport()],
              ),
              mobile: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [donationProgress(), pdfReport()],
              ),
            ),
          ),

          //description
          Text(
            faker.lorem.sentences(10).join(" "),
            style: ktsBodyRegular,
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
                  5,
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
                            faker.person.name(),
                            style: ktsBodyLarge.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w900),
                          ),
                          subtitle: Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Rp. 2.000,-\n",
                                style: ktsBodyRegular.copyWith(
                                    fontWeight: FontWeight.w800, fontSize: 20)),
                            TextSpan(text: faker.lorem.sentences(3).join(" ")),
                            TextSpan(text: "\n")
                          ])),
                        ),
                      )),
            ),
          ),
          const Divider(),
          verticalSpace(20),

          //laporan alur dana
          CauseDetailsArticles(),
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

  Text donationProgress() {
    return const Text.rich(TextSpan(children: [
      TextSpan(text: "Rp. xx.xxx.xxx,- "),
      TextSpan(text: "From total of Rp. xx.xxx.xxx,- ")
    ]));
  }

  ThemedButton donateButton() {
    return ThemedButton(
      onPressed: () {},
      buttonText: 'DONATE',
    );
  }

  Text causeTitle() {
    return Text(
      faker.lorem.sentence(),
      maxLines: 2,
      style: ktsBodyLarge.copyWith(fontSize: 20, fontWeight: FontWeight.w900),
    );
  }

  Row dateNtags() {
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
        Text(
          "00 Januari 2024",
          style: ktsBodyRegular.copyWith(fontSize: 12),
        ),
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
        Text.rich(
          TextSpan(
            children: List.generate(
                3,
                (index) => TextSpan(
                      text: 'Tags #${index + 1}',
                      style: ktsBodyRegular, // Style as needed
                      children: [
                        if (index < 2)
                          const TextSpan(
                              text:
                                  ', '), // Add comma and space except after the last tag
                      ],
                    )),
          ),
        )
      ],
    );
  }
}
