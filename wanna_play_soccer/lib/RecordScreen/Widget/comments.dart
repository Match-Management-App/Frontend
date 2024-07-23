import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class CommentSection extends StatefulWidget {
  final DateTime date;

  const CommentSection({super.key, required this.date});

  @override
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 댓글 입력
            CommentInput(controller: _controller),
          ],
        ),
      ),
    );
  }
}

class CommentInput extends StatelessWidget {
  const CommentInput({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  void _onSubmit() {
    print('send comment: ${_controller.text}');
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 30,
        maxHeight: 150,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
              style: const TextStyle(
                fontSize: 16,
                color: MyColors.myWhite,
              ),
              decoration: InputDecoration(
                hintText: '댓글을 입력하세요.',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: MyColors.myGrey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                filled: true,
                fillColor: MyColors.widgetGrey,
                isCollapsed: true,
              ),
              maxLines: 5, // 최대 5줄까지 표시
              minLines: 1, // 최소 1줄
            ),
          ),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.only(left: 5),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyColors.primaryMint),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
                padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
              ),
              onPressed: () {
                _onSubmit();
              },
              child: const Icon(
                Icons.send_rounded,
                color: MyColors.myPointWhite,
                size: 15,
              ),
            ),
          )
        ],
      ),
    );
  }
}
