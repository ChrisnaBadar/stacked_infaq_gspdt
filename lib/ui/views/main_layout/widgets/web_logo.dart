import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_shared_style.dart';

class WebLogo extends StatelessWidget {
  const WebLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Amala App Infaq',
      style: ktsBodyLarge.copyWith(
          fontSize: 20, fontWeight: FontWeight.w800, fontFamily: "Poppins"),
    );
  }
}
