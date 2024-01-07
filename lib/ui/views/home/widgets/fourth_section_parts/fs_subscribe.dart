import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/widgets/themed_button.dart';

class FsSubscribe extends StatelessWidget {
  const FsSubscribe({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: kcDarkGreyColor,
        ),
        Positioned(
          left: 3,
          child: Icon(
            Icons.home_work_outlined,
            color: kcLightGrey.withOpacity(.3),
            size: 250,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Subscribe to our newsletter",
                style: ktsBodyLarge.copyWith(
                    color: kcWhite, fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.mail_outline),
                    hintText: 'Enter your email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    )),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ThemedButton(
                onPressed: () {},
                buttonText: "SUBSCRIBE",
              ),
            )
          ],
        )
      ],
    );
  }
}
