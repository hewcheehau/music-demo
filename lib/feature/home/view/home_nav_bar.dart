import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_demo/core/utils/app_extension.dart';
import 'package:music_demo/feature/home/cubit/bottom_navigation_cubit.dart';

class HomeNavBar extends StatelessWidget {
  const HomeNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
      return CupertinoTabBar(
          backgroundColor: Colors.white70,
          onTap: (value) =>
              context.read<BottomNavigationCubit>().switchBtm(value),
          currentIndex: state.position,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.play_circle),
                label: context.loc.listenNowLabel),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.dot_radiowaves_left_right),
                label: context.loc.radioLabel),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.music_albums),
                label: context.loc.libraryLabel),
            BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.search),
                label: context.loc.searchLabel)
          ]);
    });
  }
}
