import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:wanna_play_soccer/API/User/user.dart";
import "package:wanna_play_soccer/API/User/rest_user.dart";
import "package:wanna_play_soccer/Component/AppBar/my_tab_bar.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";
import "package:wanna_play_soccer/Theme/my_theme.dart";
import "package:wanna_play_soccer/env.dart";

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
  static const storage = FlutterSecureStorage();
  late final token;

  @override
  void initState() {
    super.initState();
    _initializeRestUser();
    _loadUserName();
  }

  void _initializeRestUser() {
    final dio = Dio();
    _restUser = RestUser(dio, baseUrl: Env.baseUrl);
  }

  Future<void> _loadUserName() async {
    try {
      token = await storage.read(key: 'accessToken');

      User user = await _restUser.getUser(token: token);
      setState(() {
        _userName = user.userName;
      });
    } catch (e) {
      print('Failed to load user name: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        title: Container(
          padding: const EdgeInsets.all(20),
          child: const Text(
            // $_userName
            '안녕하세요 USER 님👏',
            style: TextStyle(
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
}
