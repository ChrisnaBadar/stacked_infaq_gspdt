import 'package:flutter/material.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/home/widgets/home_cause_slider.dart';
import 'package:infaq/ui/views/home/widgets/home_fourth_section.dart';
import 'package:infaq/ui/views/home/widgets/home_header.dart';
import 'package:infaq/ui/views/home/widgets/home_second_section.dart';
import 'package:infaq/ui/views/home/widgets/home_third_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return FutureBuilder(
      future: viewModel.getFundraisesData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: LinearProgressIndicator(),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          final fundraisesListMode =
              FundraisesListModel(data: snapshot.data!.data);
          return SizedBox(
            width: kdDesktopMaxContentWidth * .5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Header
                  HomeHeader(
                    viewModel: viewModel,
                    fundraisesListModel: fundraisesListMode,
                  ),
                  verticalSpace(20),
                  HomeSecondSection(),
                  verticalSpace(20),
                  HomeCauseSlider(
                    viewModel: viewModel,
                  ),
                  HomeThirdSection(),
                  HomeFourthSection()

                  //
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text(
                "Cannot Fetch Data from the Internet. Check Your Internet Connection."),
          );
        }
      },
    );
  }
}
