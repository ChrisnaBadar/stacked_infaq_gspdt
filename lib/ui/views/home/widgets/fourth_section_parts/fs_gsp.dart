import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/widgets/themed_button.dart';

class FsGsp extends StatelessWidget {
  const FsGsp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[900],
      child: Column(
        children: [
          Expanded(
              child: Icon(
            Icons.shield,
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
                  "Kontrakot & Jasa Kebersihan",
                  style: ktsBodyRegular.copyWith(color: kcVeryLightGrey),
                ),
                Text(
                  "PT. Global Solution Provider",
                  style: ktsBodyLarge.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w800,
                      color: kcVeryLightGrey),
                ),
                Text(
                  "Beroperasi di bawah naungan Pondok Pesantren Daarut Tauhiid, kami membawa nilai-nilai kebersamaan dan kepercayaan dalam setiap layanan yang kami tawarkan.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: ktsBodyRegular.copyWith(color: kcVeryLightGrey),
                ),
                ThemedButton(
                    onPressed: () {
                      final snackBar = SnackBar(
                        content: Text('Website gspdt.co.id dalam maintenance'),
                        duration: Duration(seconds: 3),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    buttonText: "CONTACT")
              ],
            ),
          ))
        ],
      ),
    );
  }
}
