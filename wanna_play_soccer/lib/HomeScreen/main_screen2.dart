import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanna_play_soccer/HomeScreen/home_page.dart';
import 'package:wanna_play_soccer/RecordScreen/record_page.dart';
import 'package:wanna_play_soccer/ScheduleScreen/schedule_page.dart';
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
              return <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverAppBar(
                    title: const Text('test'),
                    pinned: true,
                    floating: true,
                    forceElevated: innerBoxIsScrolled,
                    bottom: TabBar(
                      controller: _tabController,
                      tabs: const [
                        Tab(text: '홈'),
                        Tab(text: '일정'),
                        Tab(text: '기록'),
                      ],
                    ),
                  ),
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

// class _TabContent extends StatelessWidget {
//   final String tabName;

//   const _TabContent({super.key, required this.tabName});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       top: false,
//       bottom: false,
//       child: Builder(
//         builder: (BuildContext context) {
//           return CustomScrollView(
//             key: PageStorageKey<String>(tabName),
//             slivers: <Widget>[
//               SliverOverlapInjector(
//                 handle:
//                     NestedScrollView.sliverOverlapAbsorberHandleFor(context),
//               ),
//               SliverPadding(
//                 padding: const EdgeInsets.all(8.0),
//                 sliver: SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                     (BuildContext context, int index) {
//                       return Container(
//                         color:
//                             Colors.primaries[index % Colors.primaries.length],
//                         height: 100,
//                         child: Center(
//                           child: Text(
//                             'Item $index',
//                             style: const TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       );
//                     },
//                     childCount: 20,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
