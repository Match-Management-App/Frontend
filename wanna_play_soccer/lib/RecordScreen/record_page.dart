import 'package:flutter/material.dart';
import 'package:wanna_play_soccer/Component/subtitle.dart';
import 'package:wanna_play_soccer/RecordScreen/Widget/hall_of_fame.dart';
import 'package:wanna_play_soccer/Theme/my_colors.dart';
import 'package:wanna_play_soccer/Theme/my_theme.dart';
import 'package:fl_chart/fl_chart.dart';

class RecordPage extends StatefulWidget {
  const RecordPage({super.key});

  @override
  State<RecordPage> createState() => _RecordPageState();
}

class _RecordPageState extends State<RecordPage> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: screenHeight * 0.14, bottom: 40, left: 30, right: 30),
        child: Column(
          children: [
            const Subtitle(icon: "📊", subtitle: "나의 기록"),
            Container(
              height: 300,
              padding: const EdgeInsets.fromLTRB(20, 40, 40, 20),
              decoration: MyTheme.widgetDecoration,
              child: const _LineChart(),
            ),
            const Subtitle(icon: "👑", subtitle: "명예의 전당"),
            const HallOfFame(),
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  const _LineChart({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      duration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 3,
        maxY: 5,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => MyColors.myBlack.withOpacity(0.7),
          tooltipRoundedRadius: 8,
          fitInsideHorizontally: true,
          fitInsideVertically: true,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              final flSpot = barSpot;
              Color color;
              switch (barSpot.barIndex) {
                case 0:
                  color = MyColors.primaryMint;
                  break;
                case 1:
                  color = MyColors.secondaryBlue;
                  break;
                case 2:
                  color = MyColors.tertiaryCyan;
                  break;
                default:
                  color = MyColors.myBlack;
              }
              return LineTooltipItem(
                '${flSpot.y.round()}',
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

  FlTitlesData get titlesData1 => FlTitlesData(
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

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData_1,
        lineChartBarData_2,
        lineChartBarData_3,
      ];

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: MyColors.myGrey,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 1:
        text = '1';
        break;
      case 2:
        text = '2';
        break;
      case 3:
        text = '3';
        break;
      case 4:
        text = '4';
        break;
      case 5:
        text = '5';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontSize: 14,
      color: MyColors.myGrey,
    );

    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('0708', style: style);
        break;
      case 1:
        text = const Text('0712', style: style);
        break;
      case 2:
        text = const Text('0721', style: style);
        break;
      case 3:
        text = const Text('0725', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => const FlGridData(show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(color: MyColors.myDarkGrey),
          left: BorderSide(color: MyColors.myDarkGrey),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get lineChartBarData_1 => LineChartBarData(
        isCurved: true,
        color: MyColors.primaryMint,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 3),
          FlSpot(1, 1),
          FlSpot(2, 3),
          FlSpot(3, 2),
        ],
      );

  LineChartBarData get lineChartBarData_2 => LineChartBarData(
        isCurved: true,
        color: MyColors.secondaryBlue,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
          color: MyColors.secondaryBlue.withOpacity(0),
        ),
        spots: const [
          FlSpot(0, 1),
          FlSpot(1, 2),
          FlSpot(2, 0),
          FlSpot(3, 1),
        ],
      );

  LineChartBarData get lineChartBarData_3 => LineChartBarData(
        isCurved: true,
        color: MyColors.tertiaryCyan,
        barWidth: 5,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 0),
          FlSpot(1, 4),
          FlSpot(2, 3),
          FlSpot(3, 4),
        ],
      );
}
