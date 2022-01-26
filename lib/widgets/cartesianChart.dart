import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_graphs/widgets/LiveChart.dart';
import 'package:flutter_graphs/widgets/pieChart.dart';
import 'package:flutter_graphs/widgets/radialCharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianCharts extends StatefulWidget {
  const CartesianCharts({Key? key}) : super(key: key);

  @override
  _CartesianChartsState createState() => _CartesianChartsState();
}

class _CartesianChartsState extends State<CartesianCharts> {
  List<SalesData> chartData = [
    SalesData(year: 2001, sales: 34000, color: Colors.red),
    SalesData(year: 2002, sales: 32000, color: Colors.blue),
    SalesData(year: 2003, sales: 35000, color: Colors.orange),
    SalesData(year: 2004, sales: 33000, color: Colors.purple),
    SalesData(year: 2005, sales: 33000, color: Colors.green),
  ];

  ///TODO: Flutter Chart Series

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Charts'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            child: SfCartesianChart(
              // onZoomStart: (ZoomPanArgs args) =>
              //     axisDirectionToAxis(AxisDirection.down),
              // onZooming: (ZoomPanArgs args) =>
              //     axisDirectionToAxis(AxisDirection.left),
              // onZoomEnd: (ZoomPanArgs args) =>
              //     axisDirectionToAxis(AxisDirection.up),
              title: ChartTitle(text: 'Line Chart'),
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                LineSeries<SalesData, int>(
                  dashArray: [10, 5],
                  dataSource: chartData,

                  // pointColorMapper(SalesData sales,_)=>Sales.color,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            child: SfCartesianChart(
              title: ChartTitle(text: 'Bar Chart'),
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                BarSeries<SalesData, int>(
                  dashArray: [10, 5],
                  dataSource: chartData,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            child: SfCartesianChart(
              title: ChartTitle(text: 'Spine Chart'),
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                SplineSeries<SalesData, int>(
                  dashArray: [10, 5],
                  dataSource: chartData,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            child: SfCartesianChart(
              title: ChartTitle(text: 'Area Chart'),
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                AreaSeries<SalesData, int>(
                  color: Colors.green,
                  dashArray: [10, 5],
                  dataSource: chartData,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            child: SfCartesianChart(
              title: ChartTitle(text: 'Column Chart'),
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                ColumnSeries<SalesData, int>(
                  color: Colors.green,
                  dashArray: [10, 5],
                  dataSource: chartData,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.all(10),
            child: SfCartesianChart(
              title: ChartTitle(text: 'WaterFall Data'),
              legend: Legend(isVisible: true),
              series: <ChartSeries>[
                WaterfallSeries<SalesData, int>(
                  color: Colors.green,
                  dashArray: [10, 5],
                  dataSource: chartData,
                  pointColorMapper: (SalesData sales, _) => sales.color,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PieCharts())),
              child: const Icon(Icons.pie_chart),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => RadialChart())),
              child: const Icon(Icons.bubble_chart_outlined),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LiveCharts())),
              child: const Icon(Icons.live_tv_outlined),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}

class SalesData {
  SalesData({
    required this.year,
    required this.sales,
    required this.color,
  });
  final int year;
  final double sales;
  final Color color;
}
