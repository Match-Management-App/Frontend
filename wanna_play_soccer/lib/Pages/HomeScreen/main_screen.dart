import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Pages/HomeScreen/home_page.dart';
import 'package:wanna_play_soccer/Component/AppBar/my_app_bar.dart';
import 'package:wanna_play_soccer/Pages/ScheduleScreen/schedule_page.dart';
import 'package:wanna_play_soccer/Pages/RecordScreen/record_page.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
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
                SchedulePage(),
                RecordPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
