import 'dart:math';
import 'package:flutter/material.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';

class HomeThirdSection extends StatelessWidget {
  final FundraisesListModel fundraisesListModel;
  const HomeThirdSection({super.key, required this.fundraisesListModel});

  @override
  Widget build(BuildContext context) {
    int getRandomIndex() {
      final random = Random();
      return random.nextInt(fundraisesListModel.data!.length);
    }

    var randomInt = getRandomIndex();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: kdDesktopMaxContentWidth,
        height: 400,
        child: Stack(
          children: [
            Image.network(
              fundraisesListModel.data![randomInt].attributes!.imageLink!,
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
                    fundraisesListModel.data![randomInt].attributes!.title!,
                    style: ktsBodyLarge.copyWith(
                        color: kcVeryLightGrey, fontWeight: FontWeight.w700),
                  ),
                  verticalSpace(10),
                  Text(
                    fundraisesListModel.data![randomInt].attributes!
                        .description!.first.children!.first.text!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ktsBodyLarge.copyWith(color: kcVeryLightGrey),
                  ),
                  verticalSpace(10),
                  Text(
                    fundraisesListModel.data![randomInt].attributes!
                        .description![1].children!.first.text!,
                    maxLines: 8,
                    overflow: TextOverflow.ellipsis,
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
