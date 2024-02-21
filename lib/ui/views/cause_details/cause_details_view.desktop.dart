import 'package:flutter/material.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_main_row.dart';
import 'package:infaq/ui/views/cause_details/widgets/cd_secondary_row.dart';
import 'package:stacked/stacked.dart';

import 'cause_details_viewmodel.dart';

class CauseDetailsViewDesktop extends ViewModelWidget<CauseDetailsViewModel> {
  final String causeId;
  const CauseDetailsViewDesktop({super.key, required this.causeId});

  @override
  Widget build(BuildContext context, CauseDetailsViewModel viewModel) {
    return Scaffold(
      body: FutureBuilder(
        future: viewModel.getFundraiseData(id: causeId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final fundraiseModel = snapshot.data!;
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //main ROw
                    Expanded(
                        flex: 4,
                        child: CauseDetailsMainRow(
                          fundraiseModel: fundraiseModel,
                          viewModel: viewModel,
                        )),

                    //secondary row
                    Expanded(
                        flex: 2,
                        child: CauseDetailsSecondaryRow(
                          fundraiseModel: fundraiseModel,
                          viewModel: viewModel,
                        ))
                  ],
                ),
              ],
            );
          } else {
            return Center(
              child:
                  Text("Cannot fetched data, check your internet connection!!"),
            );
          }
        },
      ),
    );
  }
}
