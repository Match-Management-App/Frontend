import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/API/Stat/rest_stat.dart';
import 'package:wanna_play_soccer/API/Stat/stat.dart';
import 'package:wanna_play_soccer/API/date_utils.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';
import 'package:wanna_play_soccer/Utils/env.dart';
import "package:wanna_play_soccer/Utils/global.dart";
import 'package:wanna_play_soccer/Theme/my_colors.dart';

class RecordChart extends StatefulWidget {
  const RecordChart({super.key});

  @override
  State<RecordChart> createState() => _RecordChartState();
}

class _RecordChartState extends State<RecordChart> {
  late RestStat _restStat;
  late final String? token;
  late final List<RecentRecord> recentRecords;
  late List<Record> paddedRecords = [];
  late int maxValue = 0;

  @override
  void initState() {
    super.initState();
    _initializeRestStat();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadStat();
    });
  }

  void _initializeRestStat() {
    _restStat = RestStat(dio, baseUrl: Env.baseUrl);
  }

  Future<void> _loadStat() async {
    try {
      token = await storage.read(key: 'accessToken');

      recentRecords = await _restStat.getRecentRecord(token: 'Bearer $token');

      setState(() {
        paddedRecords = _padRecords(recentRecords);
        maxValue = _findMaxValue(paddedRecords);
      });

      debugPrint('[LOG] recentRecords: ${recentRecords.length}');
    } catch (e) {
      debugPrint('Failed to load recent records: $e');
    }
  }

  List<Record> _padRecords(List<RecentRecord> records) {
    List<Record> result = records
        .map((r) => Record(
              date: MyDateUtils.dateTimeToString(r.date),
              goals: r.goals.toString(),
              assist: r.assist.toString(),
              defence: r.defence.toString(),
            ))
        .toList();

    while (result.length < 4) {
      result.insert(0, Record(date: '', goals: '0', assist: '0', defence: '0'));
    }

    debugPrint('[LOG] padded records: ${result.length}');
    debugPrint('[LOG] padded records: ${result.first}');

    return result;
  }

  final List<Record> records = [
    Record(date: "", goals: "0", assist: "0", defence: "0"),
    Record(date: "", goals: "0", assist: "0", defence: "0"),
    Record(date: "", goals: "0", assist: "0", defence: "0"),
    Record(date: "", goals: "0", assist: "0", defence: "0"),
  ];

  int _findMaxValue(List<Record> records) {
    int max = 0;
    for (var record in records) {
      if (record.date.isNotEmpty) {
        max = [
          max,
          int.parse(record.goals),
          int.parse(record.assist),
          int.parse(record.defence)
        ].reduce((curr, next) => curr > next ? curr : next);
      }
    }
    return max + 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 범례 추가
        Container(
          margin: const EdgeInsets.only(left: 20, bottom: 30),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Label(color: MyColors.primaryMint, text: '득점'),
              SizedBox(width: 20),
              Label(color: MyColors.secondaryBlue, text: '어시스트'),
              SizedBox(width: 20),
              Label(color: MyColors.tertiaryCyan, text: '수비'),
            ],
          ),
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                  LineChart(
                    sampleData,
                    duration: const Duration(milliseconds: 250),
                  ),
                  if (paddedRecords.isEmpty ||
                      paddedRecords.every((record) => record.date.isEmpty))
                    Positioned(
                      left: constraints.maxWidth / 2,
                      top: constraints.maxHeight / 2,
                      child: Transform.translate(
                        offset: const Offset(-50, -33), // 메시지 위치 조정
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: MyColors.myBlack.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            "기록이 없습니다",
                            style: MyTheme.defaultText,
                          ),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  LineChartData get sampleData => LineChartData(
        lineTouchData: lineTouchData,
        gridData: gridData,
        titlesData: titlesData,
        borderData: borderData,
        lineBarsData: lineBarsData,
        minX: 0,
        maxX: 3,
        maxY: maxValue.toDouble(),
        minY: 0,
      );

  LineTouchData get lineTouchData => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => MyColors.myBlack.withOpacity(0.8),
          tooltipRoundedRadius: 8,
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              Color color;
              String text = '';
              switch (barSpot.barIndex) {
                case 0:
                  color = MyColors.primaryMint;
                  text = '득점';
                  break;
                case 1:
                  color = MyColors.secondaryBlue;
                  text = '어시스트';
                  break;
                case 2:
                  color = MyColors.tertiaryCyan;
                  text = '수비';
                  break;
                default:
                  color = MyColors.myBlack;
              }
              return LineTooltipItem(
                textAlign: TextAlign.start,
                '$text: ${flSpot.y.round()}',
                TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              );
            }).toList();
          },
        ),
      );

  FlTitlesData get titlesData => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData => [
        lineChartBarData(0, MyColors.primaryMint),
        lineChartBarData(1, MyColors.secondaryBlue),
        lineChartBarData(2, MyColors.tertiaryCyan),
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: MyColors.myGrey,
    );

    if (value % 2 == 1 && value >= 0 && value <= maxValue) {
      return Text(value.toInt().toString(),
          style: style, textAlign: TextAlign.center);
    }

    return Container();
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 30,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: MyColors.myGrey,
    );

    Widget text;
    if (value.toInt() >= 0 && value.toInt() < paddedRecords.length) {
      String date = paddedRecords[value.toInt()].date;
      if (date.isNotEmpty) {
        String formattedDate =
            "${date.substring(5, 7)}/${date.substring(8, 10)}";
        text = Text(formattedDate, style: style);
      } else {
        text = const Text('');
      }
    } else {
      text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 30,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: MyColors.myDarkGrey),
          left: BorderSide(color: MyColors.myDarkGrey),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData lineChartBarData(int index, Color color) => LineChartBarData(
        isCurved: true,
        color: color,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: true),
        spots: getSpots(index),
      );

  List<FlSpot> getSpots(int index) {
    return records.asMap().entries.map((entry) {
      int i = entry.key;
      Record record = entry.value;

      if (record.date.isEmpty) {
        return FlSpot.nullSpot;
      }

      double value;
      switch (index) {
        case 0:
          value = double.parse(record.goals);
          break;
        case 1:
          value = double.parse(record.assist);
          break;
        case 2:
          value = double.parse(record.defence);
          break;
        default:
          value = 0;
      }
      return FlSpot(i.toDouble(), value);
    }).toList();
  }
}

class Record {
  final String date;
  final String goals;
  final String assist;
  final String defence;

  Record({
    required this.date,
    required this.goals,
    required this.assist,
    required this.defence,
  });
}

class Label extends StatelessWidget {
  const Label({
    super.key,
    required this.color,
    required this.text,
  });

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: const TextStyle(color: MyColors.myGrey, fontSize: 14),
        ),
      ],
    );
  }
}
