import "package:flutter/material.dart";
import "package:wanna_play_soccer/Component/AppBar/my_tab_bar.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";
import "package:wanna_play_soccer/Theme/my_theme.dart";

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    required this.tabController,
    required this.innerBoxIsScrolled,
  });

  final TabController tabController;
  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        title: Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            '안녕하세요 User 님👏',
            style: TextStyle(
              color: MyColors.myPointWhite,
              fontSize: 24,
            ),
          ),
        ),
        flexibleSpace: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              gradient: MyTheme.tabBarGradient,
            ),
          ),
        ),
        centerTitle: false,
        pinned: true,
        floating: true,
        forceElevated: innerBoxIsScrolled,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kTextTabBarHeight + 40),
          child: Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            height: kTextTabBarHeight + 40,
            child: MyTabBar(tabController: tabController),
          ),
        ),
      ),
    );
  }
}
