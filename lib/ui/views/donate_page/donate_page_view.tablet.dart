import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'donate_page_viewmodel.dart';

class DonatePageViewTablet extends ViewModelWidget<DonatePageViewModel> {
  const DonatePageViewTablet({super.key});

  @override
  Widget build(BuildContext context, DonatePageViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, TABLET UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
