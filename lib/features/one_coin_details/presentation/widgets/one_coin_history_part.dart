import 'package:crypto_currency/common/presentation/utils/context_ext.dart';
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
  HistoryPart _selectedHistoryPart = HistoryPart.minute;

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CupertinoSlidingSegmentedControl<HistoryPart>(
              thumbColor: Colors.white,
              groupValue: _selectedHistoryPart,
              children: {
                HistoryPart.minute: buildSegment(context.lang.minute,
                    _selectedHistoryPart == HistoryPart.minute),
                HistoryPart.hour: buildSegment(context.lang.hour,
                    _selectedHistoryPart == HistoryPart.hour),
                HistoryPart.day: buildSegment(
                    context.lang.day, _selectedHistoryPart == HistoryPart.day),
              },
              onValueChanged: (HistoryPart? value) {
                if (value != null) {
                  setState(() {
                    _selectedHistoryPart = value;
                  });
                }
              }),
          const Gap(24),
          AnimatedCrossFade(
              firstChild: historyLoading(),
              secondChild: AspectRatio(
                  aspectRatio: 2, child: buildHistoryCharts(context)),
              crossFadeState: widget.state.isLoadingHistory
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 350))
        ],
      );

  Widget buildHistoryCharts(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
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
      );

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
      case HistoryPart.minute:
        return state.historyInfoMinute
            .map((item) => FlSpot(item.time.toDouble(), item.high))
            .toList();
      case HistoryPart.hour:
        return state.historyInfoHour
            .map((item) => FlSpot(item.time.toDouble(), item.high))
            .toList();
      case HistoryPart.day:
        return state.historyInfoDay
            .map((item) => FlSpot(item.time.toDouble(), item.high))
            .toList();
    }
  }

  Widget historyLoading() => const Center(
        child: CircularProgressIndicator.adaptive(),
      );
}

enum HistoryPart { minute, hour, day }
