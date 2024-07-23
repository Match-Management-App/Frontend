import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class VoteWidget extends StatefulWidget {
  const VoteWidget({
    super.key,
  });

  @override
  State<VoteWidget> createState() => _VoteWidgetState();
}

// TODO: 경기 투표 API 수정 여부 논의 필요!!!!
// TODO: 여기 초기 화면 투표 위젯 띄울지 결과 위젯 띄울지 API로 받아야 할 듯
class _VoteWidgetState extends State<VoteWidget> {
  bool _showResult = false;

  void _onSubmit() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _showResult = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: MyTheme.widgetDecoration,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child:
            _showResult ? VoteResult() : VoteForNextMatch(onSubmit: _onSubmit),
      ),
    );
  }
}

class VoteForNextMatch extends StatefulWidget {
  const VoteForNextMatch({
    super.key,
    required this.onSubmit,
  });

  final VoidCallback onSubmit;

  @override
  State<VoteForNextMatch> createState() => _VoteForNextMatchState();
}

class _VoteForNextMatchState extends State<VoteForNextMatch> {
  final List<String> _voteOptions = [
    "7월 30일",
    "8월 1일",
    "8월 1일",
  ];
  late List<bool> _checkedStates;

  @override
  void initState() {
    super.initState();
    _checkedStates = List.generate(_voteOptions.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                children: List.generate(
                  _voteOptions.length,
                  (index) => Row(
                    children: [
                      Checkbox(
                        value: _checkedStates[index],
                        activeColor: MyColors.primaryMint,
                        checkColor: MyColors.myDarkGrey,
                        side: MaterialStateBorderSide.resolveWith(
                          (Set<MaterialState> states) {
                            if (states.contains(MaterialState.selected)) {
                              return const BorderSide(
                                  color: MyColors.primaryMint);
                            }
                            return const BorderSide(
                                width: 1.7, color: MyColors.myGrey);
                          },
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            _checkedStates[index] = value ?? false;
                          });
                        },
                      ),
                      Text(_voteOptions[index], style: MyTheme.defaultText),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              onPressed: () {
                print(_checkedStates);
                widget.onSubmit();
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size.zero),
                fixedSize: MaterialStateProperty.all(const Size(50, 25)),
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor:
                    MaterialStateProperty.all(MyColors.primaryMint),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              child: const Text(
                "제출",
                style: TextStyle(
                  color: MyColors.myPointWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VoteResult extends StatelessWidget {
  VoteResult({super.key});

  final Map<String, int> _voteResults = {
    "7월 30일": 10,
    "8월 1일": 15,
    "8월 2일": 20,
  };

  @override
  Widget build(BuildContext context) {
    int maxResult =
        _voteResults.values.reduce((max, value) => max > value ? max : value);

    return Container(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: _voteResults.entries.map((entry) {
          return Column(
            children: [
              VoteResultBar(
                date: entry.key,
                result: entry.value,
                maxResult: maxResult,
              ),
              SizedBox(height: entry.key == _voteResults.keys.last ? 0 : 15),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class VoteResultBar extends StatelessWidget {
  const VoteResultBar({
    super.key,
    required this.date,
    required this.result,
    required this.maxResult,
  });

  final String date;
  final int result;
  final int maxResult;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 90,
          child: Text(date, style: MyTheme.defaultText),
        ),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: MyColors.myDarkGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: result / maxResult,
              child: Container(
                decoration: MyTheme.pipeDecoration,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 40,
          child: Text(
            '$result명',
            style: const TextStyle(color: MyColors.myWhite, fontSize: 14),
            textAlign: TextAlign.right,
          ),
        ),
      ],
    );
  }
}
