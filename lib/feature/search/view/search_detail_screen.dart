import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_demo/core/utils/app_extension.dart';
import 'package:music_demo/feature/search/model/music_item.dart';
import 'package:music_demo/widgets/episode_detail_widget.dart';

@RoutePage()
class SearchDetailScreen extends StatelessWidget {
  const SearchDetailScreen({super.key, required this.item});
  final MusicItem item;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(CupertinoIcons.add_circled),
            const SizedBox(
              width: 15,
            ),
            Icon(CupertinoIcons.list_dash),
          ],
        ),
      ),
      child: CustomScrollView(
        anchor: 0.15,
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 80,
              width: double.maxFinite,
              child: Card(
                color: const Color.fromARGB(255, 241, 48, 34),
                child: Column(
                  children: [
                    const SizedBox(height: 8,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.apple,
                          color: Colors.white,
                        ),
                        "Music".customText(
                            color: Colors.white,
                            size: 26,
                            fontWeight: FontWeight.bold)
                      ],
                    ),
                    "Try 3 months free this summer".customText(
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: EpisodeDetailWidget(
              imgUrl: item.artworkUrl100 ?? "",
              title: item.collectionCensoredName ?? "",
              subTitle2: item.trackCensoredName ?? "",
              subTitle: item.artistName ?? "",
            ),
          )
        ],
      ),
    );
  }
}
