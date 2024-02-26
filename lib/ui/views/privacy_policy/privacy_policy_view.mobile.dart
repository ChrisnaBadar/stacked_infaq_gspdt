import 'package:flutter/material.dart';
import 'package:infaq/ui/views/privacy_policy/privacy_policy_text_widget.dart';
import 'package:stacked/stacked.dart';

import 'privacy_policy_viewmodel.dart';

class PrivacyPolicyViewMobile extends ViewModelWidget<PrivacyPolicyViewModel> {
  const PrivacyPolicyViewMobile({super.key});

  @override
  Widget build(BuildContext context, PrivacyPolicyViewModel viewModel) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
          child: PrivacyPolicyTextWidget(),
        ),
      ),
    );
  }
}
