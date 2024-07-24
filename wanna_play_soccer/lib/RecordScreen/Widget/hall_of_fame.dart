import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wanna_play_soccer/FindPartner/Widget/partner_rank.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class HallOfFame extends StatefulWidget {
  const HallOfFame({super.key});

  @override
  State<HallOfFame> createState() => _HallOfFameState();
}

class _HallOfFameState extends State<HallOfFame> {
  late final PageController _controller;

  final List<Widget> _pages = [
    const HOF(title: "득점"),
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
