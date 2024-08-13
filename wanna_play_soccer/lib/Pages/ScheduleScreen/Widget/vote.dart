import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';

enum VoteOpt {
  attend,
  absent,
}

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
    return Column(
      children: [
        AnimatedContainer(
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
        ),
        // if (_showResult) const AttendingPlayers(),
      ],
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
  final List<Map<String, dynamic>> _voteOpts = [
    {'option': VoteOpt.attend, 'label': '참석'},
    {'option': VoteOpt.absent, 'label': '불참'},
  ];
  VoteOpt? _selectedOption;

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
                children: _voteOpts
                    .map(
                      (option) => Row(
                        children: [
                          Radio<VoteOpt>(
                            value: option['option'],
                            groupValue: _selectedOption,
                            activeColor: MyColors.primaryMint,
                            fillColor: WidgetStateProperty.resolveWith<Color>(
                              (Set<WidgetState> states) {
                                if (states.contains(WidgetState.selected)) {
                                  return MyColors.primaryMint;
                                }
                                return MyColors.myGrey;
                              },
                            ),
                            onChanged: (VoteOpt? value) {
                              setState(() {
                                _selectedOption = value;
                              });
                            },
                          ),
                          Text(option['label'], style: MyTheme.defaultText),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ElevatedButton(
              onPressed: () {
                debugPrint('$_selectedOption');
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

class VoteResult extends StatefulWidget {
  const VoteResult({
    super.key,
    required this.onEdit,
    required this.onTap,
  });

  final VoidCallback onEdit;
  final Function(String) onTap;

  @override
  State<VoteResult> createState() => _VoteResultState();
}

class _VoteResultState extends State<VoteResult> {
  final bool _isAttending = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_isAttending ? "참석" : "불참", style: MyTheme.defaultText),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 250),
            padding: const EdgeInsets.only(top: 10, right: 10),
            child: ElevatedButton(
              onPressed: () {
                debugPrint('edit');
                widget.onEdit();
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

class AttendingPlayers extends StatefulWidget {
  const AttendingPlayers({super.key});

  @override
  State<AttendingPlayers> createState() => _AttendingPlayersState();
}

class _AttendingPlayersState extends State<AttendingPlayers> {
  final _attendingPlayers = ["user1", "user2", "user3"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
          child: Row(
            children: [
              Container(
                width: 3,
                height: 20,
                margin: const EdgeInsets.only(right: 10),
                decoration: MyTheme.pipeDecoration,
              ),
              const Text('참여자', style: MyTheme.header3),
            ],
          ),
        ),
        Container(
          // height: 300,
          padding: const EdgeInsets.all(30),
          decoration: MyTheme.widgetDecoration,
          child: Column(
            children:
                List.generate((_attendingPlayers.length / 2).ceil(), (index) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    if (index * 2 < _attendingPlayers.length)
                      Expanded(
                        child: Text(
                          _attendingPlayers[index * 2],
                          style: MyTheme.voteResult,
                        ),
                      ),
                    const SizedBox(width: 20),
                    if (index * 2 + 1 < _attendingPlayers.length)
                      Expanded(
                        child: Text(
                          _attendingPlayers[index * 2 + 1],
                          style: MyTheme.voteResult,
                        ),
                      ),
                  ],
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}


// class VoteResultBar extends StatelessWidget {
//   const VoteResultBar({
//     super.key,
//     required this.date,
//     required this.result,
//     required this.maxResult,
//     required this.onTap,
//   });

//   final String date;
//   final int result;
//   final int maxResult;
//   final Function(String) onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 90,
//           child: Text(date, style: MyTheme.defaultText),
//         ),
//         Expanded(
//           child: Container(
//             height: 8,
//             decoration: BoxDecoration(
//               color: MyColors.myDarkGrey,
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: FractionallySizedBox(
//               alignment: Alignment.centerLeft,
//               widthFactor: result / maxResult,
//               child: Container(
//                 decoration: MyTheme.pipeDecoration,
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(width: 10),
//         GestureDetector(
//           onTap: () {
//             onTap(date);
//           },
//           child: Row(
//             children: [
//               SizedBox(
//                 width: 40,
//                 child: Text(
//                   '$result명',
//                   style: const TextStyle(color: MyColors.myWhite, fontSize: 14),
//                   textAlign: TextAlign.right,
//                 ),
//               ),
//               const Icon(
//                 Icons.chevron_right_rounded,
//                 color: MyColors.myWhite,
//                 size: 14,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
