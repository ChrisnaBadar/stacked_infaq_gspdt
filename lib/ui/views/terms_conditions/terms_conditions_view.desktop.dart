import 'package:flutter/material.dart';
import 'package:infaq/ui/views/terms_conditions/terms_condition_text_widget.dart';
import 'package:stacked/stacked.dart';

import 'terms_conditions_viewmodel.dart';

class TermsConditionsViewDesktop
    extends ViewModelWidget<TermsConditionsViewModel> {
  const TermsConditionsViewDesktop({super.key});

  @override
  Widget build(BuildContext context, TermsConditionsViewModel viewModel) {
    return const Scaffold(
      body: SingleChildScrollView(child: TermsConditionsTextWidget()),
    );
  }
}
