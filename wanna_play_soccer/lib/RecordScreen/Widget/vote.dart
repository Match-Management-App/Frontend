import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

class VoteWidget extends StatelessWidget {
  const VoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      decoration: MyTheme.widgetDecoration,
      child: const VoteForNextMatch(),
    );
  }
}

class VoteForNextMatch extends StatefulWidget {
  const VoteForNextMatch({
    super.key,
  });

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
                // 여기에 선택된 옵션을 처리하는 로직을 추가할 수 있습니다.
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
