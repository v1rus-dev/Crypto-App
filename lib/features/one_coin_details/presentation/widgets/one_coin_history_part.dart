import 'package:crypto_currency/features/one_coin_details/domain/bloc/one_coin_details_bloc.dart';
import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fl_chart/fl_chart.dart';

class OneCoinHistoryPart extends StatefulWidget {
  const OneCoinHistoryPart({super.key, required this.state});

  final OneCoinDetailsState state;

  @override
  State<OneCoinHistoryPart> createState() => OneCoinHistoryPartState();
}

class OneCoinHistoryPartState extends State<OneCoinHistoryPart> {
  HistoryPart _selectedHistoryPart = HistoryPart.Minute;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const controllerTextStyle = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
    );
    return Column(
      children: [
        CupertinoSlidingSegmentedControl<HistoryPart>(
            thumbColor: Colors.white,
            groupValue: _selectedHistoryPart,
            children: {
              HistoryPart.Minute: buildSegment(
                  "Minute", _selectedHistoryPart == HistoryPart.Minute),
              HistoryPart.Hour: buildSegment(
                  "Hour", _selectedHistoryPart == HistoryPart.Hour),
              HistoryPart.Day:
                  buildSegment("Day", _selectedHistoryPart == HistoryPart.Day),
            },
            onValueChanged: (HistoryPart? value) {
              if (value != null) {
                setState(() {
                  _selectedHistoryPart = value;
                });
              }
            }),
        const Gap(24),
        AspectRatio(
          aspectRatio: 2,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: LineChart(
              LineChartData(
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  lineTouchData: LineTouchData(
                      enabled: true,
                      touchTooltipData: LineTouchTooltipData(
                          tooltipRoundedRadius: 8,
                          getTooltipColor: (LineBarSpot touchedSpot) =>
                              HexColor.fromHex('#727272'),
                          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                            return defaultLineTooltipItem(touchedBarSpots)
                                .map((item) {
                              return LineTooltipItem(item.text,
                                  item.textStyle.copyWith(color: Colors.white));
                            }).toList();
                          })),
                  lineBarsData: [
                    LineChartBarData(
                        dotData: const FlDotData(show: false),
                        isCurved: true,
                        barWidth: 2,
                        color: HexColor.fromHex("#14BB25"),
                        curveSmoothness: 0.1,
                        spots: getSpots(widget.state))
                  ]),
              curve: Curves.linear,
              duration: const Duration(milliseconds: 200),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSegment(String text, bool isSelected) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: Text(text,
            style: TextStyle(
                fontSize: 12,
                color:
                    isSelected ? Colors.black : HexColor.fromHex("#727272"))),
      );

  List<FlSpot> getSpots(OneCoinDetailsState state) {
    switch (_selectedHistoryPart) {
      case HistoryPart.Minute:
        final res = state.historyInfoMinute.map((item) {
          return FlSpot(item.time.toDouble(), item.high);
        }).toList();
        return res;
      case HistoryPart.Hour:
        return state.historyInfoHour.map((item) {
          return FlSpot(item.time.toDouble(), item.high);
        }).toList();
      case HistoryPart.Day:
        return state.historyInfoDay.map((item) {
          return FlSpot(item.time.toDouble(), item.high);
        }).toList();
    }
  }
}

enum HistoryPart { Minute, Hour, Day }
