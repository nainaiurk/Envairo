import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SideGraph extends StatelessWidget {
  SideGraph({
    Key? key,
    required Future<List<List<String>>> future,
    required this.graphNo,
    required this.title,
  }) : _future = future, super(key: key);

  final Future<List<List<String>>> _future;
  final String title;
  final int graphNo;

  List<Data> co2_data = [];
  List<Data> sea_data = [];
  List<Data> temp_data = [];
  List<Data> api_data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      width: 700,
      height: 300,
      child: FutureBuilder<List>(
        future: _future,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.green,));
          } 
          else if (snapshot.connectionState == ConnectionState.done || snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasError) {
              return const Center(child: Text('Something is wrong',style: TextStyle(color: Colors.red),));
            } 
            else if (snapshot.hasData || !snapshot.hasError) {
              var data = snapshot.data;
              var len = data?.length;
              var xaxis;
              var yaxis;
              List.generate(len-1, (i) {
                xaxis = data[i+1][0];
                yaxis = double.parse(data[i+1][graphNo+1]);
                co2_data.add(Data(xaxis, yaxis,int.parse(xaxis) < 2023? Colors.green:Colors.red));
                // sea_data.add(Data(xaxis, yaxis,int.parse(xaxis) < 2023? Colors.green:Colors.red));
                // temp_data.add(Data(xaxis, yaxis,int.parse(xaxis) < 2023? Colors.green:Colors.red));
                // api_data.add(Data(xaxis, yaxis,int.parse(xaxis) < 2023? Colors.green:Colors.red));
              });
              return SfCartesianChart(
                title: ChartTitle(text: title),
                legend: Legend(
                  isVisible: true,
                  isResponsive: true,
                  alignment: ChartAlignment.center,
                  position: LegendPosition.bottom
                ),
                enableMultiSelection: true,
                zoomPanBehavior: ZoomPanBehavior(
                  enableMouseWheelZooming: true,
                  enablePinching: true,
                  enablePanning: true
                ),
                primaryXAxis: CategoryAxis(borderColor: Colors.green),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  borderColor: Colors.red,
                  borderWidth: 5,
                  color: Colors.lightBlue
                ),
                series: <ChartSeries>[
                  LineSeries<Data, String>(
                    color: Colors.red,
                    legendItemText: 'Forecast',
                    dataSource: co2_data,
                    xValueMapper: (Data data, _) => data.x,
                    yValueMapper: (Data data, _) => data.y,
                    pointColorMapper: (Data data, _) => data.color
                  )
                ]
              );
            } 
            else {
              return const Center(child: Text('Empty data',style: TextStyle(color: Colors.red),));
            }
          } 
          else {
            return Center(child: Text('State: ${snapshot.connectionState}',style: const TextStyle(color: Colors.red),));
          }
        },
      ),
    );
  }
}
class Data {
  Data(this.x, this.y,this.color);
  final String x;
  final double y;
  final Color color;
}