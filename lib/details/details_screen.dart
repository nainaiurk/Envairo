
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../constants.dart';
import '../map/map_screen.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(background,height: maxHeight,width: maxWidth,fit: BoxFit.fill,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/logo1.png',scale:1.3,),
              Row(
                children: [
                  Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lime),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    child: const Center(child: Text('explore',style: TextStyle(fontFamily: 'Kollektif',fontSize: 20))),
                  ),
                  const SizedBox(width: 30,),
                  Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lime,width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    child: const Center(child: Text('blog',style: TextStyle(fontFamily: 'Kollektif',fontSize: 20))),
                  ),
                  const SizedBox(width: 30,),
                  Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.lime),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                    ),
                    child: const Center(child: Text('details',style: TextStyle(fontFamily: 'Kollektif',fontSize: 20))),
                    
                  ),
                  const SizedBox(width: 30,),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(50,20,50,20),
            child: Row(
              children: [
                Container(
                  width: 400,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SfCartesianChart(
                        title: ChartTitle(text: 'Air Polution Index'),
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<ChartData, String>(
                            dataSource: [
                              ChartData('Jan', 35),
                              ChartData('Feb', 28),
                              ChartData('Mar', 34),
                              ChartData('Apr', 32),
                              ChartData('May', 40)
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y
                          )
                        ]
                      ),
                      SfCartesianChart(
                        title: ChartTitle(text: 'CO2 emission'),
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<ChartData, String>(
                            dataSource: [
                              ChartData('Jan', 35),
                              ChartData('Feb', 28),
                              ChartData('Mar', 34),
                              ChartData('Apr', 32),
                              ChartData('May', 40)
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y
                          )
                        ]
                      ),
                      SfCartesianChart(
                        title: ChartTitle(text: 'Sea Level Rise'),
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<ChartData, String>(
                            dataSource: [
                              ChartData('Jan', 35),
                              ChartData('Feb', 28),
                              ChartData('Mar', 34),
                              ChartData('Apr', 32),
                              ChartData('May', 40)
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y
                          )
                        ]
                      ),
                    ],
                  ),
                ),

                Text(
                  'BANGLADESH',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 30,)
              ],
            ),
          )
        ],
      ),
    );
  }
}