import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/HomeScreen/home_page.dart';
import 'package:wanna_play_soccer/Component/main_icon.dart';
import 'package:wanna_play_soccer/unused/my_app_bar.dart';
import 'package:wanna_play_soccer/RecordScreen/record_page.dart';
import 'package:wanna_play_soccer/ScheduleScreen/schedule_page.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedPageIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    SchedulePage(),
    RecordPage()
  ];

  void _onIconTapped(int index) {
    setState(() {
      _selectedPageIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // 배경색 설정
        decoration: MyTheme.backgroundColor,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height * 0.15,
                  bottom: 10.0,
                  left: 20.0,
                  right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(width: 10.0),
                  MainIcon(
                      title: '홈',
                      onTap: () => _onIconTapped(0),
                      isSelected: _selectedPageIndex == 0),
                  MainIcon(
                      title: '일정',
                      onTap: () => _onIconTapped(1),
                      isSelected: _selectedPageIndex == 1),
                  MainIcon(
                      title: '기록',
                      onTap: () => _onIconTapped(2),
                      isSelected: _selectedPageIndex == 2),
                  const SizedBox(width: 10.0),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _selectedPageIndex = index;
                  });
                },
                children: _pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
