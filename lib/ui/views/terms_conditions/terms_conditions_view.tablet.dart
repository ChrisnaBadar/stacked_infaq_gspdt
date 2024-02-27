import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'terms_conditions_viewmodel.dart';

class TermsConditionsViewTablet
    extends ViewModelWidget<TermsConditionsViewModel> {
  const TermsConditionsViewTablet({super.key});

  @override
  Widget build(BuildContext context, TermsConditionsViewModel viewModel) {
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
