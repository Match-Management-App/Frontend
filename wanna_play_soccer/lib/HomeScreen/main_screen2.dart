import 'package:flutter/material.dart';
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
        expandedHeight: 120,
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
        bottom: MyTabBar(
          tabController: tabController,
        ),
      ),
    );
  }
}

class MyTabBar extends StatefulWidget implements PreferredSizeWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<MyTabBar> createState() => _MyTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TabBar(
          controller: widget.tabController,
          labelColor: MyColors.myPointWhite,
          unselectedLabelColor: MyColors.myGrey,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          tabs: [
            // SizedBox(width: 20.0),
            MyTab(text: '홈', isSelected: widget.tabController.index == 0),
            MyTab(text: '일정', isSelected: widget.tabController.index == 1),
            MyTab(text: '기록', isSelected: widget.tabController.index == 2),
            // SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}

class MyTab extends StatefulWidget {
  const MyTab({
    super.key,
    required this.text,
    required this.isSelected,
  });

  final String text;
  final bool isSelected;

  @override
  State<MyTab> createState() => _MyTabState();
}

class _MyTabState extends State<MyTab> {
  @override
  Widget build(BuildContext context) {
    return Tab(
      // text: text,
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.isSelected ? MyColors.primaryMint : MyColors.myDarkGrey,
          boxShadow: [
            BoxShadow(
              color: MyColors.myBlack.withOpacity(0.7),
              blurRadius: 7,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? MyColors.myPointWhite : MyColors.myGrey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
