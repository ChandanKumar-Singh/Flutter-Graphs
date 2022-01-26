import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PieCharts extends StatelessWidget {
  PieCharts({Key? key}) : super(key: key);

  List<PieData> chartData = [
    PieData(yData: 90000, xData: 'Chandan'),
    PieData(yData: 20000, xData: 'Aditya'),
    PieData(yData: 50000, xData: 'Pradeep'),
  ];
  List<ChkraData> chkraData = [
    ChkraData(yData: 1, xData: 'Chandan'),
    ChkraData(yData: 1, xData: 'Aditya'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Chandan'),
    ChkraData(yData: 1, xData: 'Aditya'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
    ChkraData(yData: 1, xData: 'Pradeep'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pie Charts'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 300,
                width: MediaQuery.of(context).size.width / 1.5,
                child: SfCircularChart(
                  backgroundColor: Colors.blue[200],
                  title: ChartTitle(text: ('Sales Data')),
                  legend: Legend(isVisible: true),
                  palette: [Color(0xffff7700), Colors.white, Colors.green],
                  series: [
                    PieSeries<PieData, String>(

                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      dataLabelMapper: (PieData data, _) => data.xData,
                      radius: '55',
                      explode: true,
                      explodeIndex: 1,
                      strokeColor: Colors.white,
                      strokeWidth: 1,
                      dataSource: chartData,
                      xValueMapper: (PieData data, _) => data.xData,
                      yValueMapper: (PieData data, _) => data.yData,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 45,
                bottom: 0,
                right: 175,
                child: SfCircularChart(
                  palette: const [
                    Colors.white,
                  ],
                  series: [
                    PieSeries<ChkraData, String>(

                      radius: '20',
                      explode: true,
                      strokeColor: Colors.black87,
                      strokeWidth: 1,
                      dataSource: chkraData,
                      xValueMapper: (ChkraData data, _) => data.xData,
                      yValueMapper: (ChkraData data, _) => data.yData,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ChkraData {
  ChkraData({required this.yData, required this.xData});
  final num yData;
  final String xData;
}

class PieData {
  PieData({required this.yData, required this.xData});
  final num yData;
  final String xData;
}
