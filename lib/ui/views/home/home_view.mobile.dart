import 'package:flutter/material.dart';
import 'package:infaq/models/fundraises_list_model.dart';
import 'package:infaq/ui/views/home/widgets/home_cause_slider.dart';
import 'package:infaq/ui/views/home/widgets/home_fourth_section.dart';
import 'package:infaq/ui/views/home/widgets/home_header.dart';
import 'package:infaq/ui/views/home/widgets/home_second_section.dart';
import 'package:infaq/ui/views/home/widgets/home_third_section.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: FutureBuilder(
        future: viewModel.getFundraisesData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final fundraisesListMode =
                FundraisesListModel(data: snapshot.data!.data);
            return ListView(
              children: [
                HomeHeader(
                  viewModel: viewModel,
                  fundraisesListModel: fundraisesListMode,
                ),
                HomeSecondSection(
                  viewModel: viewModel,
                  fundraisesListModel: fundraisesListMode,
                ),
                HomeCauseSlider(
                  viewModel: viewModel,
                  fundraisesListModel: fundraisesListMode,
                ),
                HomeThirdSection(
                  fundraisesListModel: fundraisesListMode,
                ),
                HomeFourthSection(
                  viewModel: viewModel,
                )
              ],
            );
          } else {
            return Center(
              child: Text(
                  "Data cannot be fetched, check your internet connection!!"),
            );
          }
        },
      ),
    );
  }
}
