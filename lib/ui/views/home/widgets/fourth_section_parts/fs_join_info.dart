import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/widgets/themed_button.dart';

class FsJoinInfo extends StatelessWidget {
  const FsJoinInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[900],
      child: Column(
        children: [
          Expanded(
              child: Icon(
            Icons.admin_panel_settings_sharp,
            size: 250,
            color: kcVeryLightGrey,
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We Need You!!",
                  style: ktsBodyRegular.copyWith(color: kcVeryLightGrey),
                ),
                Text(
                  "Become Volunteer",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: kcVeryLightGrey),
                ),
                Text(
                  faker.lorem.sentences(3).join(" "),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ktsBodyRegular.copyWith(color: kcVeryLightGrey),
                ),
                ThemedButton(onPressed: () {}, buttonText: "APPLY NOW")
              ],
            ),
          ))
        ],
      ),
    );
  }
}
