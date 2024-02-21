import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'routing_test_viewmodel.dart';

class RoutingTestViewMobile extends ViewModelWidget<RoutingTestViewModel> {
  const RoutingTestViewMobile({super.key});

  @override
  Widget build(BuildContext context, RoutingTestViewModel viewModel) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Hello, MOBILE UI!',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
