import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_constants.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/common/ui_helpers.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_articles.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_gsp.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_join_info.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_subscribe.dart';
import 'package:infaq/ui/widgets/themed_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeFourthSection extends StatelessWidget {
  const HomeFourthSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: StaggeredGrid.count(
        crossAxisCount: 5,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: [
          StaggeredGridTile.count(
              crossAxisCellCount: getValueForScreenType(
                  context: context, mobile: 5, desktop: 3),
              mainAxisCellCount: getValueForScreenType(
                  context: context, mobile: 3, desktop: 1),
              child: const FsSubscribe()),
          StaggeredGridTile.count(
              crossAxisCellCount: getValueForScreenType(
                  context: context, mobile: 5, desktop: 2),
              mainAxisCellCount: getValueForScreenType(
                  context: context, mobile: 5, desktop: 2),
              child: const FsJoinInfo()),
          StaggeredGridTile.count(
              crossAxisCellCount: getValueForScreenType(
                  context: context, mobile: 5, desktop: 3),
              mainAxisCellCount: getValueForScreenType(
                  context: context, mobile: 6, desktop: 2),
              child: const FsArticles()),
          StaggeredGridTile.count(
              crossAxisCellCount: getValueForScreenType(
                  context: context, mobile: 5, desktop: 2),
              mainAxisCellCount: getValueForScreenType(
                  context: context, mobile: 5, desktop: 2),
              child: const FsGsp()),
        ],
      ),
    );
  }
}

Widget _tile() {
  return Container(
    decoration: BoxDecoration(border: Border.all()),
  );
}
