import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'donate_page_viewmodel.dart';

class DonatePageViewDesktop extends ViewModelWidget<DonatePageViewModel> {
  const DonatePageViewDesktop({super.key});

  @override
  Widget build(BuildContext context, DonatePageViewModel viewModel) {
    return Scaffold(
      body: ListView(
        children: [],
      ),
    );
  }
}
