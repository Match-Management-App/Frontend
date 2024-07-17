import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanna_play_soccer/HomeScreen/home_page.dart';
import 'package:wanna_play_soccer/RecordScreen/record_page.dart';
import 'package:wanna_play_soccer/ScheduleScreen/schedule_page.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: MyTheme.backgroundColor,
        child: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return [
                MyAppBar(
                  tabController: _tabController,
                  innerBoxIsScrolled: innerBoxIsScrolled,
                ),
              ];
            },
            body: TabBarView(
              controller: _tabController,
              children: const [
                HomePage(),
                RecordPage(),
                SchedulePage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
          padding: const EdgeInsets.all(10),
          child: const Text(
            '안녕하세요 User 님👏',
            style: TextStyle(
              color: MyColors.myPointWhite,
              fontSize: 24,
            ),
          ),
        ),
        centerTitle: false,
        pinned: true,
        floating: true,
        forceElevated: innerBoxIsScrolled,
        scrolledUnderElevation: 0,
        backgroundColor: MyColors.myBlack,
        bottom: MyTabBar(
          tabController: tabController,
        ),
      ),
    );
  }
}

class MyTabBar extends StatelessWidget implements PreferredSizeWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TabBar(
          controller: tabController,
          labelColor: MyColors.myPointWhite,
          unselectedLabelColor: MyColors.myGrey,
          // indicator: const BoxDecoration(
          //   color: MyColors.primaryMint,
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          dividerColor: Colors.transparent,
          tabs: const [
            // SizedBox(width: 20.0),
            MyTab(text: '홈'),
            Tab(text: '일정'),
            Tab(text: '기록'),
            // SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}

class MyTab extends StatelessWidget {
  const MyTab({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Tab(
      text: text,
    );
  }
}
