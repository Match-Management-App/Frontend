import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/API/Chemistry/chemistry.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';
import 'package:wanna_play_soccer/Utils/global.dart';

class PartnerRank extends StatefulWidget {
  const PartnerRank({
    super.key,
    required this.fetchData,
  });

  final Future<TopThree> Function(String token) fetchData;

  @override
  State<PartnerRank> createState() => _PartnerRankState();
}

class _PartnerRankState extends State<PartnerRank> {
  late final String? token;
  late TopThree _data;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
      });

      token = await storage.read(key: 'accessToken');

      TopThree fetchedData = await widget.fetchData('Bearer $token');

      setState(() {
        _data = fetchedData;
        _isLoading = false;
      });
    } catch (e) {
      debugPrint("[ERR] Fail to load Hall Of Fame: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: MyTheme.widgetDecoration,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: MyColors.primaryMint,
              ),
            )
          : Ranking(
              first: _data.first,
              second: _data.second,
              third: _data.third,
            ),
    );
  }
}

class Ranking extends StatelessWidget {
  const Ranking({
    super.key,
    required this.first,
    required this.second,
    required this.third,
  });

  final String first;
  final String second;
  final String third;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "🥇",
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  first,
                  style: MyTheme.header3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: MyColors.myGrey,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🥈 $second",
                    style: MyTheme.defaultText,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "🥉 $third",
                    style: MyTheme.defaultText,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
