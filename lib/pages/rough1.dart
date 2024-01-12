// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Syncfusion Line Chart'),
//         ),
//         body: Center(
//           child: LineChart(),
//         ),
//       ),
//     );
//   }
// }

// class LineChart extends StatelessWidget {
//   // Sample data
//   final List<DateTime> xData = [
//     DateTime(2022, 1, 1),
//     DateTime(2022, 2, 1),
//     DateTime(2022, 3, 1),
//     // Add more DateTime values as needed
//   ];

//   final List<double> yData = [10, 25, 18];

//   const LineChart({super.key});
//   // Add more double values as needed

//   @override
//   Widget build(BuildContext context) {
//     return SfCartesianChart(
//       primaryXAxis: DateTimeAxis(
//         title: AxisTitle(text: 'Date'),
//       ),
//       primaryYAxis: NumericAxis(
//         title: AxisTitle(text: 'Value'),
//       ),
//       series: <ChartSeries>[
//         LineSeries<double, DateTime>(
//           dataSource: _getData(),
//           xValueMapper: (double sales, _) => xData[_],
//           yValueMapper: (double sales, _) => sales,
//           dataLabelSettings: DataLabelSettings(isVisible: true),
//         ),
//       ],
//     );
//   }

//   List<ChartData> _getData() {
//     List<ChartData> data = [];
//     for (int i = 0; i < xData.length; i++) {
//       data.add(ChartData(xData[i], yData[i]));
//     }
//     return data;
//   }
// }

// class ChartData {
//   ChartData(this.x, this.y);

//   final DateTime x;
//   final double y;
// }
