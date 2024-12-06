import 'package:crypto_currency/utils/color_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fl_chart/fl_chart.dart';

class OneCoinHistoryPart extends StatefulWidget {
  const OneCoinHistoryPart({super.key});

  @override
  State<OneCoinHistoryPart> createState() => OneCoinHistoryPartState();
}

class OneCoinHistoryPartState extends State<OneCoinHistoryPart> {
  HistoryPart _selectedHistoryPart = HistoryPart.Day;

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
              HistoryPart.Day:
                  buildSegment("1D", _selectedHistoryPart == HistoryPart.Day),
              HistoryPart.Week:
                  buildSegment("7D", _selectedHistoryPart == HistoryPart.Week),
              HistoryPart.Month:
                  buildSegment("1M", _selectedHistoryPart == HistoryPart.Month),
              HistoryPart.Year:
                  buildSegment("1Y", _selectedHistoryPart == HistoryPart.Year),
              HistoryPart.All:
                  buildSegment("All", _selectedHistoryPart == HistoryPart.All),
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
              mainLineChartData(),
              curve: Curves.linear,
              duration: const Duration(milliseconds: 300),
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

  LineChartData mainLineChartData() => switch (_selectedHistoryPart) {
        HistoryPart.Day => dayLineData(),
        HistoryPart.Week => weekLineData(),
        HistoryPart.Month => monthLineData(),
        // TODO: Handle this case.
        HistoryPart.Year => yearLineData(),
        // TODO: Handle this case.
        HistoryPart.All => allLineData()
      };

  LineChartData dayLineData() {
    return LineChartData(
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(show: false),
        lineBarsData: [
          LineChartBarData(
            dotData: FlDotData(show: false),
            isCurved: true,
            color: HexColor.fromHex("#14BB25"),
            curveSmoothness: 0,
            spots: const [
              FlSpot(0, 3),
              FlSpot(3, 5),
              FlSpot(6, 10),
              FlSpot(9, 18),
              FlSpot(12, 15),
              FlSpot(15, 20)
            ],
          )
        ]);
  }

  LineChartData weekLineData() {
    return LineChartData(
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            dotData: FlDotData(show: false),
            spots: const [
              FlSpot(0, 3),
              FlSpot(3, 5),
              FlSpot(6, 10),
              FlSpot(9, 3),
              FlSpot(12, 15),
              FlSpot(15, 20)
            ],
          )
        ]);
  }

  LineChartData monthLineData() {
    return LineChartData(
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            dotData: FlDotData(show: false),
            spots: const [
              FlSpot(0, 3),
              FlSpot(3, 5),
              FlSpot(6, 10),
              FlSpot(9, 18),
              FlSpot(12, 15),
              FlSpot(15, 20)
            ],
          )
        ]);
  }

  LineChartData yearLineData() {
    return LineChartData(
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            dotData: FlDotData(show: false),
            spots: const [
              FlSpot(0, 3),
              FlSpot(3, 5),
              FlSpot(6, 10),
              FlSpot(9, 18),
              FlSpot(12, 15),
              FlSpot(15, 20)
            ],
          )
        ]);
  }

  LineChartData allLineData() {
    return LineChartData(
        gridData: const FlGridData(show: false),
        lineBarsData: [
          LineChartBarData(
            dotData: FlDotData(show: false),
            spots: const [
              FlSpot(0, 3),
              FlSpot(3, 5),
              FlSpot(6, 10),
              FlSpot(9, 18),
              FlSpot(12, 15),
              FlSpot(15, 20)
            ],
          )
        ]);
  }
}

enum HistoryPart { Day, Week, Month, Year, All }
