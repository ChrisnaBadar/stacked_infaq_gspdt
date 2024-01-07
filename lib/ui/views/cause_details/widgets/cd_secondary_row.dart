import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/widgets/themed_button.dart';

class CauseDetailsSecondaryRow extends StatelessWidget {
  const CauseDetailsSecondaryRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Text Widget
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              faker.lorem.sentence(),
              style: ktsBodyLarge.copyWith(
                  fontSize: 17, fontWeight: FontWeight.w900),
            ),
            Divider(),
            Text(
              faker.lorem.sentences(10).join(" "),
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
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
          child: Row(
            children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "1 Day ",
                    style:
                        ktsBodyRegular.copyWith(fontWeight: FontWeight.w900)),
                TextSpan(text: "left\n", style: ktsBodyRegular),
                TextSpan(text: "Desember 27, 2024")
              ]))
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 231, 229, 229),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                      text: "Rp. xx.xxx.xxx,-",
                      style: ktsBodyLarge.copyWith(
                          fontWeight: FontWeight.w900, fontSize: 20)),
                  TextSpan(text: " dari total target Rp. xx.xxx.xxx,-")
                ]),
                style: ktsBodyRegular,
              ),
              LinearProgressIndicator(),
              Text(
                faker.lorem.sentence(),
                style: ktsBodyRegular,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                    width: kdDesktopMaxContentWidth,
                    child:
                        ThemedButton(onPressed: () {}, buttonText: "DONATE")),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: SizedBox(
                    width: kdDesktopMaxContentWidth,
                    child: ThemedButton(onPressed: () {}, buttonText: "SHARE")),
              ),
              verticalSpace(20),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.people_alt_outlined),
                  label: Text(
                    "xx People has donated",
                    style: ktsBodyRegular,
                  )),
              verticalSpace(20),
              SizedBox(
                width: kdDesktopMaxContentWidth,
                height: 275,
                child: ListView(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        faker.person.name(),
                        style: ktsBodyLarge,
                      ),
                      subtitle: Text(
                        "Rp. x.xxx,- Recent Donation",
                        style: ktsBodyRegular,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        faker.person.name(),
                        style: ktsBodyLarge,
                      ),
                      subtitle: Text(
                        "Rp. x.xxx,- Top Donation",
                        style: ktsBodyRegular,
                      ),
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Text(
                        faker.person.name(),
                        style: ktsBodyLarge,
                      ),
                      subtitle: Text(
                        "Rp. x.xxx,- First Donation",
                        style: ktsBodyRegular,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ThemedButton(onPressed: () {}, buttonText: "See All"),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        ThemedButton(onPressed: () {}, buttonText: "See Top"),
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
            Divider(),

            //Tile
            Column(
              children: List.generate(
                  5,
                  (index) => ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: kcPrimaryColorDark,
                            child: Image.network(
                              "https://picsum.photos/200/20$index",
                              scale: 3,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          faker.job.title(),
                          style: ktsBodyLarge.copyWith(
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          faker.lorem.sentences(5).join(" "),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: ktsBodyRegular,
                        ),
                      )),
            )
          ],
        ),

        //Tag Clound
        Column()
      ],
    );
  }
}
