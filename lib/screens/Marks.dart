import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy/theme.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MarksChart extends StatefulWidget {
  const MarksChart({Key? key}) : super(key: key);

  @override
  State<MarksChart> createState() => _MarksChartState();
}

class _MarksChartState extends State<MarksChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('David', 25),
      ChartData('Steve', 38),
      ChartData('Jack', 34),
      ChartData('Others', 52),
      ChartData('Others', 52),
    ];
    return Container(
      // color: AppColors.primary,
      height: MediaQuery.of(context).size.width * 0.45,
      width: MediaQuery.of(context).size.width * 0.45,
      child: SfCircularChart(
        borderColor: AppColors.primary,
        palette: [Colors.black, Colors.blue, Colors.red, Colors.green],
        series: <CircularSeries>[
          // Renders radial bar chart
          RadialBarSeries<ChartData, String>(
              trackColor: AppColors.greyLight,

              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y)
        ],
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);

  final String x;
  final double y;
}
