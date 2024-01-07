import 'package:flutter/material.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_main_row.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_secondary_row.dart';
import 'package:stacked/stacked.dart';

import 'cause_details_viewmodel.dart';

class CauseDetailsViewMobile extends ViewModelWidget<CauseDetailsViewModel> {
  const CauseDetailsViewMobile({super.key});

  @override
  Widget build(BuildContext context, CauseDetailsViewModel viewModel) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [CauseDetailsMainRow(), CauseDetailsSecondaryRow()],
      ),
    );
  }
}
