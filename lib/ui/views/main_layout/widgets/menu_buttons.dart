import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/views/main_layout/widgets/menu_overlay/menu_overlay.dart';

class MenuButtons extends StatefulWidget {
  const MenuButtons({super.key});

  @override
  State<MenuButtons> createState() => _MenuButtonsState();
}

class _MenuButtonsState extends State<MenuButtons> {
  OverlayEntry? entry;
  LayerLink? layerLink = LayerLink();
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink!,
      child: MaterialButton(
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            return entry == null ? showMenu() : removeMenu();
          });
        },
        child: const Icon(
          Icons.menu,
          color: kcPrimaryColorDark,
        ),
      ),
    );
  }

  void showMenu() {
    entry = OverlayEntry(
      builder: (context) => Positioned(
          width: 200,
          child: CompositedTransformFollower(
            link: layerLink!,
            offset: const Offset(-150, 30),
            child: MenuOverlay(
              removeOverlayCallback: removeMenu,
            ),
          )),
    );
    Overlay.of(context).insert(entry!);
  }

  void removeMenu() {
    entry?.remove();
    entry = null;
  }
}
