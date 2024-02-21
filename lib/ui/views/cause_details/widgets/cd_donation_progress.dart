import 'package:flutter/material.dart';
import 'package:infaq/models/fundraise_model.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:intl/intl.dart';

class CauseDetailsDonationProgress extends StatelessWidget {
  final FundraiseModel fundraiseModel;
  const CauseDetailsDonationProgress({super.key, required this.fundraiseModel});

  @override
  Widget build(BuildContext context) {
    final collectedDonations = fundraiseModel.data!.attributes!.donations!.data!
        .where((element) => element.attributes!.donationStatus == "Diterima")
        .map((e) => int.parse(e.attributes!.nominal!))
        .reduce((value, element) => value + element);
    final formattedCollectedDonation =
        NumberFormat.currency(locale: "id_ID", symbol: "IDR ")
            .format(collectedDonations);
    double usdValue = collectedDonations / 16000.0;
    final formatter = NumberFormat('#,##0.0', 'id_ID');
    String formattedUsdAmount = formatter.format(usdValue);

    final targetDonation =
        int.parse(fundraiseModel.data!.attributes!.targetDonation!);
    final formattedTargetDonation =
        NumberFormat.currency(locale: "id_ID", symbol: "IDR ")
            .format(targetDonation);
    double usdTargetValue = targetDonation / 16000.0;
    String formattedUsdTargetAmount = formatter.format(usdTargetValue);

    return Text.rich(TextSpan(children: [
      TextSpan(
          text: "Terkumpul ",
          style: ktsBodyRegular.copyWith(fontWeight: FontWeight.w700)),
      TextSpan(
          text: formattedCollectedDonation,
          style: ktsBodyRegular.copyWith(
              color: kcPrimaryColorDark, fontWeight: FontWeight.w900)),
      TextSpan(
          text: " (USD $formattedUsdAmount)",
          style: ktsBodyRegular.copyWith(
              color: kcLightGrey, fontWeight: FontWeight.w900)),
      TextSpan(
          text: "\nDari total ",
          style: ktsBodyRegular.copyWith(fontWeight: FontWeight.w700)),
      TextSpan(
          text: " $formattedTargetDonation ",
          style: ktsBodyRegular.copyWith(
              color: kcPrimaryColorDark, fontWeight: FontWeight.w900)),
      TextSpan(
          text: " (USD $formattedUsdTargetAmount)",
          style: ktsBodyRegular.copyWith(
              color: kcLightGrey, fontWeight: FontWeight.w900)),
    ]));
  }
}
