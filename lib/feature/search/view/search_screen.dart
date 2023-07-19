import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_demo/core/utils/app_extension.dart';
import 'package:music_demo/feature/search/bloc/bloc/search_bloc.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(
              context.loc.searchLabel,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          SliverAppBar(
            pinned: true,
            toolbarHeight: 0,
            flexibleSpace: FlexibleSpaceBar(
                title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CupertinoSearchTextField(
                placeholder: context.loc.searchDesc,
                onSubmitted: (value) {
                  context.read<SearchBloc>().add(SearchByKeyword(text: value));
                },
              ),
            )),
          ),
          BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
            if (state.status == SearchStatus.searching) {
              return const SliverToBoxAdapter(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state.status == SearchStatus.empty) {
              return SliverToBoxAdapter(
                child: "No results found.".customText(color: Colors.grey),
              );
            }
            return SliverList.builder(
              itemBuilder: (context, index) {
                var data = state.data[index];
                return CupertinoListTile(
                  trailing: data.isSong
                      ? const Icon(CupertinoIcons.list_bullet)
                      : const Icon(CupertinoIcons.forward),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  leadingSize: 60,
                  leading: AspectRatio(
                    aspectRatio: 1,
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: data.artworkUrl100 ?? "",
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: (data.collectionName ?? "").mediumText,
                  subtitle: ("${data.kind ?? ""} - ${data.artistName ?? ""}")
                      .normalText,
                );
              },
              itemCount: state.data.length,
            );
          }),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: (kBottomNavigationBarHeight * 2),
            ),
          )
        ],
      ),
    );
  }
}
