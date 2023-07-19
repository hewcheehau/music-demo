import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_demo/core/utils/app_extension.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.person_circle,
                    size: 30,
                  )),
            ],
            elevation: 5,
            title: Text(
              context.loc.listenNowLabel,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5)
              ),
              child: Image.asset("banner".toPng())),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 1000,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
