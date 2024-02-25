import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infaq/models/articles_model.dart';
import 'package:infaq/ui/views/home/home_viewmodel.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_articles.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_gsp.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_join_info.dart';
import 'package:infaq/ui/views/home/widgets/fourth_section_parts/fs_subscribe.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeFourthSection extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeFourthSection({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.getArticlesData(),
        builder: (context, snapshot) {
          print('object: $snapshot');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            final articlesListModel = ArticlesModel(data: snapshot.data!.data);
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
                      child: FsArticles(
                        viewModel: viewModel,
                        articlesModel: articlesListModel,
                      )),
                  StaggeredGridTile.count(
                      crossAxisCellCount: getValueForScreenType(
                          context: context, mobile: 5, desktop: 2),
                      mainAxisCellCount: getValueForScreenType(
                          context: context, mobile: 5, desktop: 2),
                      child: const FsGsp()),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

Widget _tile() {
  return Container(
    decoration: BoxDecoration(border: Border.all()),
  );
}
