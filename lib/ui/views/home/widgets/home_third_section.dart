import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';

class HomeThirdSection extends StatelessWidget {
  const HomeThirdSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: kdDesktopMaxContentWidth,
        height: 400,
        child: Stack(
          children: [
            Image.network(
              "https://picsum.photos/500/200",
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            Container(
              color: kcPrimaryColorDark.withOpacity(.8),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: ktsTitleText.copyWith(color: kcVeryLightGrey),
                  ),
                  verticalSpace(10),
                  Text(
                    faker.lorem.sentence(),
                    maxLines: 1,
                    style: ktsBodyLarge.copyWith(color: kcVeryLightGrey),
                  ),
                  verticalSpace(10),
                  Text(
                    faker.lorem.sentences(10).join(" "),
                    maxLines: 8,
                    style: ktsBodyRegular.copyWith(color: kcVeryLightGrey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
