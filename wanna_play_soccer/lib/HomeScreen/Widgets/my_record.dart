import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class MyRecordWidget extends StatefulWidget {
  const MyRecordWidget({super.key});

  @override
  State<MyRecordWidget> createState() => _MyRecordWidgetState();
}

class _MyRecordWidgetState extends State<MyRecordWidget> {
  final List<Widget> _pages = [
    Container(
      margin: const EdgeInsets.all(20),
      color: MyColors.myBlack,
    ),
    Container(
      margin: const EdgeInsets.all(20),
      color: MyColors.myWhite,
    ),
  ];

  late final PageController _controller;

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

  Widget itemBuilder(BuildContext context, int index) {
    // for infinite loop
    return _pages[index % _pages.length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: MyColors.widgetGrey,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [MyTheme.defaultShadow],
      ),
      child: Column(
        children: [
          SizedBox(
            height: 270,
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
