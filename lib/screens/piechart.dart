import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeStats extends StatefulWidget {
  @override
  _HomeStatsState createState() => _HomeStatsState();
}

class _HomeStatsState extends State<HomeStats> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(
        'Energy',
        270,
        Color(0xff),
      ),
      ChartData(
        'Temperature',
        200,
        Color(0xff345d7d),
      ),
      ChartData(
        'Water',
        150,
        Color(0xfff7b295),
      ),
    ];
    return SfCircularChart(
      series: <CircularSeries>[
        RadialBarSeries<ChartData, String>(
          dataSource: chartData,
          xValueMapper: (ChartData data, _) => data.x,
          yValueMapper: (ChartData data, _) => data.y,
          // Radius of the radial bar's inner circle
          innerRadius: '60%',
          gap: '20%',

          cornerStyle: CornerStyle.endCurve,
        )
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}
