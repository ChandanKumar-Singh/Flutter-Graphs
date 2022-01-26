import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LiveCharts extends StatefulWidget {
  const LiveCharts({Key? key}) : super(key: key);

  @override
  _LiveChartsState createState() => _LiveChartsState();
}

class _LiveChartsState extends State<LiveCharts> {
  late List<LiveData> chartData;
  late ChartSeriesController chartSeriesController;

  @override
  void initState() {
    super.initState();
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
  }

  List<LiveData> getChartData() {
    return <LiveData>[
      LiveData(time: 0, speed: 42),
      LiveData(time: 1, speed: 42),
      LiveData(time: 2, speed: 52),
      LiveData(time: 3, speed: 12),
      LiveData(time: 4, speed: 46),
      LiveData(time: 5, speed: 49),
      LiveData(time: 6, speed: 54),
      LiveData(time: 7, speed: 88),
      LiveData(time: 8, speed: 38),
      LiveData(time: 9, speed: 77),
    ];
  }

  int time = 10;
  updateDataSource(Timer timer) {
    chartData.add(LiveData(time: time++, speed: (Random().nextInt(60))));
    chartData.removeAt(0);
    chartSeriesController.updateDataSource(
        addedDataIndex: chartData.length - 1, removedDataIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Charts'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SfCartesianChart(
            primaryXAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 1),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval: 2,
              title: AxisTitle(text: 'Time(seconds'),
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 1),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              interval: 2,
              title: AxisTitle(text: 'Speed(km/s)'),
            ),
            series: [
              LineSeries<LiveData, int>(
                  onRendererCreated: (ChartSeriesController controller) {
                    chartSeriesController = controller;
                  },
                  dataSource: chartData,
                  xValueMapper: (LiveData data, _) => data.time,
                  yValueMapper: (LiveData data, _) => data.speed),
            ],
          )
        ],
      ),
    );
  }
}

class LiveData {
  LiveData({required this.time, required this.speed});

  final int time;
  final int speed;
}
