import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'privacy_policy_viewmodel.dart';

class PrivacyPolicyViewTablet extends ViewModelWidget<PrivacyPolicyViewModel> {
  const PrivacyPolicyViewTablet({super.key});

  @override
  Widget build(BuildContext context, PrivacyPolicyViewModel viewModel) {
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
