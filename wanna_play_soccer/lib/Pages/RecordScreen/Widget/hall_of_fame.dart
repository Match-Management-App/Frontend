import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wanna_play_soccer/API/HOF/hall_of_fame.dart';
import 'package:wanna_play_soccer/API/HOF/rest_hall_of_fame.dart';
import 'package:wanna_play_soccer/Component/rank.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';
import 'package:wanna_play_soccer/Utils/env.dart';
import 'package:wanna_play_soccer/Utils/global.dart';

class HallOfFameWidget extends StatefulWidget {
  const HallOfFameWidget({super.key});

  @override
  State<HallOfFameWidget> createState() => _HallOfFameWidgetState();
}

class _HallOfFameWidgetState extends State<HallOfFameWidget> {
  late final PageController _controller;

  final List<Widget> _pages = [
    const HOFGoal(title: "득점"),
    const HOF(title: "어시스트"),
    const HOF(title: "수비"),
    const HOF(title: "출석"),
  ];

  Widget itemBuilder(BuildContext context, int index) {
    // for infinite loop
    return _pages[index % _pages.length];
  }

  @override
  void initState() {
    super.initState();
    // for infinite loop
    _controller = PageController(initialPage: 500);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      // height: 200,
      padding: const EdgeInsets.all(20),
      decoration: MyTheme.widgetDecoration,
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _controller,
              itemBuilder: itemBuilder,
            ),
          ),
          SmoothPageIndicator(
            controller: _controller,
            count: _pages.length,
            effect: const SlideEffect(
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: MyColors.primaryMint,
              dotColor: MyColors.widgetGrey,
            ),
          ),
        ],
      ),
    );
  }
}

class HOF extends StatelessWidget {
  const HOF({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: WidgetTitle(title: title),
        ),
        const Ranking(first: "first", second: "second", third: "third"),
      ],
    );
  }
}

class HOFGoal extends StatefulWidget {
  const HOFGoal({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<HOFGoal> createState() => _HOFGoalState();
}

class _HOFGoalState extends State<HOFGoal> {
  late final String? token;
  late RestHOF _restGoals;
  List<HallOfFame> _goals = [
    HallOfFame(userName: "-", stats: 1),
    HallOfFame(userName: "-", stats: 2),
    HallOfFame(userName: "-", stats: 3),
  ];

  @override
  void initState() {
    super.initState();

    _initRestGoals();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadGoals();
    });
  }

  _initRestGoals() {
    _restGoals = RestHOF(dio, baseUrl: Env.baseUrl);
  }

  Future<void> _loadGoals() async {
    try {
      token = await storage.read(key: 'accessToken');

      List<HallOfFame> recentGoals =
          await _restGoals.getHOFGoals(token: 'Bearer $token');

      setState(() {
        _goals = recentGoals;
      });

      debugPrint("[LOG] Load Hall Of Fame <Goals>: ${_goals.first.userName}");
    } catch (e) {
      debugPrint("[ERR] Fail to load Hall Of Fame <Goals>: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final first = _goals.isNotEmpty ? _goals.first.userName : "-";
    final second = _goals.length > 1 ? _goals[1].userName : "-";
    final third = _goals.length > 2 ? _goals[2].userName : "-";
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: WidgetTitle(title: widget.title),
        ),
        Ranking(first: first, second: second, third: third),
      ],
    );
  }
}

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 10),
          width: 3,
          height: 20,
          decoration: MyTheme.pipeDecoration,
        ),
        Text(
          title,
          style: MyTheme.defaultText,
        ),
      ],
    );
  }
}
