import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class VoteWidget extends StatefulWidget {
  const VoteWidget({
    super.key,
    required this.onTap,
  });

  final Function(String) onTap;

  @override
  State<VoteWidget> createState() => _VoteWidgetState();
}

// TODO: 결과에서 내가 어디 투표했는지 확인 필요할 듯 -> 색으로?? 투표 했으면 민트색 아니면 회색
class _VoteWidgetState extends State<VoteWidget> {
  bool _showResult = false;

  void _onSubmit() {
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _showResult = true;
      });
    });
  }

  void _onEdit() {
    setState(() {
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      // margin: const EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: MyTheme.widgetDecoration,
      child: AnimatedSize(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: _showResult
            ? VoteResult(onEdit: _onEdit, onTap: widget.onTap)
            : VoteForNextMatch(onSubmit: _onSubmit),
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
                        side: WidgetStateBorderSide.resolveWith(
                          (Set<WidgetState> states) {
                            if (states.contains(WidgetState.selected)) {
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
                debugPrint('$_checkedStates');
                widget.onSubmit();
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size.zero),
                fixedSize: WidgetStateProperty.all(const Size(50, 25)),
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                backgroundColor: WidgetStateProperty.all(MyColors.primaryMint),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
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
  VoteResult({
    super.key,
    required this.onEdit,
    required this.onTap,
  });

  final VoidCallback onEdit;
  final Function(String) onTap;

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
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: _voteResults.entries.map((entry) {
                return Column(
                  children: [
                    VoteResultBar(
                      date: entry.key,
                      result: entry.value,
                      maxResult: maxResult,
                      onTap: onTap,
                    ),
                    SizedBox(
                        height: entry.key == _voteResults.keys.last ? 0 : 20),
                  ],
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: ElevatedButton(
              onPressed: () {
                debugPrint('edit');
                onEdit();
              },
              style: ButtonStyle(
                minimumSize: WidgetStateProperty.all(Size.zero),
                fixedSize: WidgetStateProperty.all(const Size(50, 25)),
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                backgroundColor: WidgetStateProperty.all(MyColors.primaryMint),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )),
              ),
              child: const Text(
                "수정",
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

class VoteResultBar extends StatelessWidget {
  const VoteResultBar({
    super.key,
    required this.date,
    required this.result,
    required this.maxResult,
    required this.onTap,
  });

  final String date;
  final int result;
  final int maxResult;
  final Function(String) onTap;

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
        GestureDetector(
          onTap: () {
            onTap(date);
          },
          child: Row(
            children: [
              SizedBox(
                width: 40,
                child: Text(
                  '$result명',
                  style: const TextStyle(color: MyColors.myWhite, fontSize: 14),
                  textAlign: TextAlign.right,
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: MyColors.myWhite,
                size: 14,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
