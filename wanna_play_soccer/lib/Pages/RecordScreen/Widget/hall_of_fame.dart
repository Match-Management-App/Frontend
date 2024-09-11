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
    HOFWidget(
      title: "득점",
      fetchData: (token) =>
          RestHOF(dio, baseUrl: Env.baseUrl).getHOFGoals(token: token),
    ),
    HOFWidget(
      title: "어시스트",
      fetchData: (token) =>
          RestHOF(dio, baseUrl: Env.baseUrl).getHOFAssists(token: token),
    ),
    HOFWidget(
      title: "수비",
      fetchData: (token) =>
          RestHOF(dio, baseUrl: Env.baseUrl).getHOFDefences(token: token),
    ),
    HOFWidget(
      title: "수비",
      fetchData: (token) =>
          RestHOF(dio, baseUrl: Env.baseUrl).getHOFAttendance(token: token),
    ),
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

class HOFWidget extends StatefulWidget {
  const HOFWidget({
    super.key,
    required this.title,
    required this.fetchData,
  });

  final String title;
  final Future<List<HallOfFame>> Function(String token) fetchData;

  @override
  State<HOFWidget> createState() => _HOFWidgetState();
}

class _HOFWidgetState extends State<HOFWidget> {
  late final String? token;
  List<HallOfFame> _data = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      token = await storage.read(key: 'accessToken');

      // Fetch data using the provided function
      List<HallOfFame> fetchedData = await widget.fetchData('Bearer $token');

      setState(() {
        _data = padList(fetchedData);
        _isLoading = false;
      });
    } catch (e) {
      debugPrint("[ERR] Fail to load Hall Of Fame: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<HallOfFame> padList(List<HallOfFame> list) {
    return List.generate(3, (index) {
      if (index < list.length) return list[index];
      return HallOfFame(userName: "-", stats: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: WidgetTitle(title: widget.title),
        ),
        _isLoading
            ? const Padding(
                padding: EdgeInsets.only(top: 50),
                child: CircularProgressIndicator(
                  color: MyColors.primaryMint,
                ),
              )
            : Ranking(
                first: _data[0].userName,
                second: _data[1].userName,
                third: _data[2].userName,
              ),
      ],
    );
  }
}
