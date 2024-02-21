import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';

class ThemedButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  final bool reverse;
  const ThemedButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      this.reverse = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: reverse ? kcPrimaryColorDark : kcVeryLightGrey,
      textColor: reverse ? kcVeryLightGrey : kcPrimaryColorDark,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(8.0), // Adjust the corner radius here
      ),
      child: Text(
        buttonText,
        style: ktsBodyRegular.copyWith(fontWeight: FontWeight.w700),
      ),
    );
  }
}
