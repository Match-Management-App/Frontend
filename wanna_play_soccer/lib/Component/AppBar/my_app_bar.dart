import "package:flutter/material.dart";
import "package:wanna_play_soccer/API/User/user.dart";
import "package:wanna_play_soccer/API/User/rest_user.dart";
import "package:wanna_play_soccer/Component/AppBar/my_tab_bar.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";
import "package:wanna_play_soccer/Theme/my_theme.dart";
import "package:wanna_play_soccer/Utils/global.dart";
import "package:wanna_play_soccer/Utils/env.dart";

class MyAppBar extends StatefulWidget {
  const MyAppBar({
    super.key,
    required this.tabController,
    required this.innerBoxIsScrolled,
  });

  final TabController tabController;
  final bool innerBoxIsScrolled;

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  late RestUser _restUser;
  String _userName = 'User';
  late final String? token;

  @override
  void initState() {
    super.initState();
    _initializeRestUser();
    _loadUserName();
  }

  void _initializeRestUser() {
    _restUser = RestUser(dio, baseUrl: Env.baseUrl);
  }

  Future<void> _loadUserName() async {
    try { 
      token = await storage.read(key: 'accessToken');

      User user = await _restUser.getUser(token: 'Bearer $token');

      setState(() {
        _userName = user.userName;
      });
    } catch (e) {
      debugPrint('Failed to load user name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        title: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            '안녕하세요 $_userName님👏',
            style: const TextStyle(
              color: MyColors.myWhite,
              fontSize: 24,
            ),
          ),
        ),
        flexibleSpace: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              gradient: MyTheme.tabBarGradient,
            ),
          ),
        ),
        centerTitle: false,
        pinned: true,
        floating: true,
        forceElevated: widget.innerBoxIsScrolled,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kTextTabBarHeight + 40),
          child: Container(
            padding: const EdgeInsets.only(bottom: 20.0),
            height: kTextTabBarHeight + 40,
            child: MyTabBar(tabController: widget.tabController),
          ),
        ),
      ),
    );
  }

//   @override
//   Widget build(BuildContext context) {
//     return SliverAppBar(
//       title: Container(
//         padding: const EdgeInsets.all(20),
//         child: Text(
//           '안녕하세요 $_userName 님👏',
//           style: const TextStyle(
//             color: MyColors.myWhite,
//             fontSize: 24,
//           ),
//         ),
//       ),
//       flexibleSpace: ClipRRect(
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: MyTheme.tabBarGradient,
//           ),
//         ),
//       ),
//       centerTitle: false,
//       pinned: true,
//       floating: true,
//       forceElevated: widget.innerBoxIsScrolled,
//       scrolledUnderElevation: 0,
//       backgroundColor: Colors.transparent,
//       bottom: PreferredSize(
//         preferredSize: const Size.fromHeight(kTextTabBarHeight + 40),
//         child: Container(
//           padding: const EdgeInsets.only(bottom: 20.0),
//           height: kTextTabBarHeight + 40,
//           child: MyTabBar(tabController: widget.tabController),
//         ),
//       ),
//     );
//   }
}
