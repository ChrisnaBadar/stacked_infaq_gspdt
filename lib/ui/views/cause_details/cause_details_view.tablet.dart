import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'cause_details_viewmodel.dart';

class CauseDetailsViewTablet extends ViewModelWidget<CauseDetailsViewModel> {
  const CauseDetailsViewTablet({super.key});

  @override
  Widget build(BuildContext context, CauseDetailsViewModel viewModel) {
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
