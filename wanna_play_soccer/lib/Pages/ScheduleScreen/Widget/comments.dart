import 'package:flutter/material.dart';
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

  final List<Comment> commentHistory = [
    Comment(
        userName: "김철수", comment: "오늘 경기 정말 재미있었어요!", date: "2024-07-20 20:20"),
    Comment(
        userName: "이영희",
        comment: "다음 경기도 기대됩니다. 화이팅!",
        date: "2024-07-20 21:15"),
    Comment(
        userName: "박민준", comment: "선수들 모두 수고하셨습니다.", date: "2024-07-21 09:30"),
    Comment(
        userName: "정수연",
        comment: "경기장 분위기가 너무 좋았어요.",
        date: "2024-07-21 14:45"),
    Comment(
        userName: "강지훈",
        comment: "다음에는 꼭 직접 가서 응원하고 싶네요!",
        date: "2024-07-22 10:05"),
  ];

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
            // * Text(widget.date.toString().split(' ')[0]),
            // 댓글 목록
            Container(
              padding: const EdgeInsets.only(top: 20),
              // Column으로 commentHistory를 뿌려줌
              child: Column(
                children: commentHistory
                    .map((comment) => CommentTile(
                          name: comment.userName,
                          comment: comment.comment,
                          date: comment.date,
                        ))
                    .toList(),
              ),
            ),
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
                backgroundColor: WidgetStateProperty.all(MyColors.primaryMint),
                shape: WidgetStateProperty.all(
                  const CircleBorder(),
                ),
                padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
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

class CommentTile extends StatelessWidget {
  const CommentTile({
    super.key,
    required this.name,
    required this.comment,
    required this.date,
  });

  final String name;
  final String comment;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 14,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: MyColors.myGrey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            comment,
            style: const TextStyle(
              fontSize: 16,
              color: MyColors.myWhite,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class Comment {
  final String userName;
  final String comment;
  final String date;

  Comment({
    required this.userName,
    required this.comment,
    required this.date,
  });
}
