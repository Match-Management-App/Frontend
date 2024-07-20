// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:wanna_play_soccer/Theme/my_colors.dart';

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
//   const MyAppBar({super.key});

//   // v1/users/name

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       scrolledUnderElevation: 0,
//       backgroundColor: MyColors.myBlack,
//       title: Container(
//         padding: const EdgeInsets.all(20.0),
//         child: const Text(
//           '반갑습니다 User님 👏',
//           style: TextStyle(color: MyColors.myWhite),
//         ),
//       ),
//       centerTitle: false,
//       flexibleSpace: ClipRRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//           child: Container(
//             color: Colors.transparent,
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
