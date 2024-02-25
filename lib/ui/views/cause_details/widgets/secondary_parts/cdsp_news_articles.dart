import 'package:flutter/material.dart';
import 'package:infaq/ui/common/app_colors.dart';
import 'package:infaq/ui/common/app_shared_style.dart';
import 'package:infaq/ui/views/cause_details/cause_details_viewmodel.dart';

class CauseDetailsNewsArticles extends StatefulWidget {
  final CauseDetailsViewModel viewModel;
  const CauseDetailsNewsArticles({super.key, required this.viewModel});

  @override
  State<CauseDetailsNewsArticles> createState() =>
      _CauseDetailsNewsArticlesState();
}

class _CauseDetailsNewsArticlesState extends State<CauseDetailsNewsArticles> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.getArticlesData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final articleData = snapshot.data!.data!;
            return Column(
              children: List.generate(
                  articleData.length < 5 ? articleData.length : 5,
                  (index) => ListTile(
                        leading: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: Container(
                            width: 50,
                            height: 50,
                            color: kcPrimaryColorDark,
                            child: Image.network(
                              articleData[index]
                                  .attributes!
                                  .landscapeImageLink!,
                              scale: 3,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          articleData[index].attributes!.articleTitle!,
                          style: ktsBodyLarge.copyWith(
                              fontWeight: FontWeight.w700),
                        ),
                        subtitle: Text(
                          articleData[index]
                              .attributes!
                              .mainArticle!
                              .first
                              .children!
                              .first
                              .text!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: ktsBodyRegular,
                        ),
                      )),
            );
          } else {
            return Container();
          }
        });
  }
}
