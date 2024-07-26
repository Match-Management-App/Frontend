import "package:flutter/material.dart";
import "package:wanna_play_soccer/Component/AppBar/my_tab.dart";
import "package:wanna_play_soccer/Theme/my_colors.dart";

class MyTabBar extends StatefulWidget implements PreferredSizeWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;

  @override
  State<MyTabBar> createState() => _MyTabBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kTextTabBarHeight);
}

class _MyTabBarState extends State<MyTabBar> {
  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.6,
        child: TabBar(
          onTap: (_) {
            FocusScope.of(context).unfocus();
          },
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          controller: widget.tabController,
          labelColor: MyColors.myPointWhite,
          unselectedLabelColor: MyColors.myGrey,
          dividerColor: Colors.transparent,
          indicatorColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          tabs: [
            // SizedBox(width: 20.0),
            MyTab(text: '홈', isSelected: widget.tabController.index == 0),
            MyTab(text: '일정', isSelected: widget.tabController.index == 1),
            MyTab(text: '기록', isSelected: widget.tabController.index == 2),
            // SizedBox(width: 20.0),
          ],
        ),
      ),
    );
  }
}
