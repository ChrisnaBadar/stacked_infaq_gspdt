import 'package:flutter/material.dart';
import 'package:infaq/extensions/hover_extensions.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:stacked/stacked.dart';

import 'menu_overlay_viewmodel.dart';

class MenuOverlay extends StackedView<MenuOverlayViewModel> {
  final VoidCallback removeOverlayCallback;
  final Function? onMenuItemTapped;
  const MenuOverlay(
      {super.key, this.onMenuItemTapped, required this.removeOverlayCallback});

  @override
  Widget builder(
      BuildContext context, MenuOverlayViewModel viewModel, Widget? child) {
    return Material(
      borderRadius: BorderRadius.circular(5),
      elevation: 8,
      color: kcMediumGrey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            alignment: Alignment.center,
            child: viewModel.isBusy
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: () async {
                      removeOverlayCallback();
                      await viewModel.toHome();
                      onMenuItemTapped?.call();
                    },
                    child: const Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ).showCursorOnHover,
          Container(
            height: 60,
            alignment: Alignment.center,
            child: viewModel.isBusy
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: () async {
                      removeOverlayCallback();
                      await viewModel.toProfile();
                      onMenuItemTapped?.call();
                    },
                    child: const Text(
                      'Profile',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ).showCursorOnHover,
          Container(
            height: 60,
            alignment: Alignment.center,
            child: viewModel.isBusy
                ? const CircularProgressIndicator()
                : GestureDetector(
                    onTap: () async {
                      removeOverlayCallback();
                      await viewModel.toPortofolio();
                      onMenuItemTapped?.call();
                    },
                    child: const Text(
                      'Portofolio',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
          ).showCursorOnHover,
        ],
      ),
    );
  }

  @override
  MenuOverlayViewModel viewModelBuilder(BuildContext context) =>
      MenuOverlayViewModel();
}