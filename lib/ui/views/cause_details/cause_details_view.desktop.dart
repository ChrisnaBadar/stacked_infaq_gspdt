import 'package:flutter/material.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_main_row.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_secondary_row.dart';
import 'package:stacked/stacked.dart';

import 'cause_details_viewmodel.dart';

class CauseDetailsViewDesktop extends ViewModelWidget<CauseDetailsViewModel> {
  const CauseDetailsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, CauseDetailsViewModel viewModel) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //main ROw
              Expanded(flex: 4, child: CauseDetailsMainRow()),

              //secondary row
              Expanded(flex: 2, child: CauseDetailsSecondaryRow())
            ],
          ),
        ],
      ),
    );
  }
}
