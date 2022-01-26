import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialChart extends StatelessWidget {
  RadialChart({Key? key}) : super(key: key);

  List<RadialData> chartData = [
    RadialData(yData: 90000, xData: 'Chandan'),
    RadialData(yData: 20000, xData: 'Aditya'),
    RadialData(yData: 50000, xData: 'Pradeep'),
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
                  backgroundColor: Color(0x748D5855),
                  title: ChartTitle(text: ('Sales Data')),
                  legend: Legend(isVisible: true),
                  palette: [Color(0xffff7700), Colors.white, Colors.green],
                  series: [
                    RadialBarSeries<RadialData, String>(
                      trackColor : const Color.fromRGBO(158, 112, 161, 1.0),
                      gap: '5%',
                      cornerStyle: CornerStyle.bothCurve,

                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                      dataLabelMapper: (RadialData data, _) => data.xData,
                      radius: '55',
                      innerRadius: '20',
                      strokeColor: Colors.white,
                      strokeWidth: 1,
                      dataSource: chartData,
                      xValueMapper: (RadialData data, _) => data.xData,
                      yValueMapper: (RadialData data, _) => data.yData,
                    )
                  ],
                ),
              ),
              Positioned(
                top: 47,
                bottom: 0,
                right: 173,
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
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width / 1.5,
            child: SfCircularChart(
              backgroundColor: Color(0x748D5855),
              title: ChartTitle(text: ('Sales Data')),
              legend: Legend(isVisible: true),
              palette: [Color(0xffff7700), Colors.white, Colors.green],
              series: [
                DoughnutSeries<RadialData, String>(

                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  dataLabelMapper: (RadialData data, _) => data.xData,
                  radius: '55',
                  innerRadius: '20',
                  strokeColor: Colors.white,
                  strokeWidth: 1,
                  dataSource: chartData,
                  xValueMapper: (RadialData data, _) => data.xData,
                  yValueMapper: (RadialData data, _) => data.yData,
                )
              ],
            ),
          ),
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

class RadialData {
  RadialData({required this.yData, required this.xData});
  final num yData;
  final String xData;
}
