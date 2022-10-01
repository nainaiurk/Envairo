import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../constants.dart';
import '../map/map_screen.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.countryName, required this.countryIndex}) : super(key: key);
  final String countryName;
  final int countryIndex;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List<double> veg = [2.33,30.2,1.85,19.8,53.4,28.8,34,2.81,4.47,10.4,11.5,85.7,18.5,17.4,47.3,13.7,10.9,22.8,27.8,22.7,14.5,35.9,0.89,50.9,42.7,43.2,56,18.5,46.9,59.4,14.7,72.1,71.4,26.9,35.8,38.7,34.6,32.1,24.5,23.3,8.92,43,55.6,64.3,53.3,17.7,11.3,59.4,89.8,31.2,0.16,53,18.7,34.7,32.7,0.25,63.8,15.7,44.4,0.82,30.4,22.8,27.1,39.5,38.5,50.3,0.05,38.7,8.72,37.2,57,15.1,39.8,23,73.7,62.4,31.5,0.06,92,91.3,13.2,40.6,35.1,0,25.2,24,70.4,87.3,30.3,52.1,0,32.9,51.9,93.6,29.3,56.8,27.1,34.7,12.6,22.5,33.9,31.8,25.6,29.8,49.1,24.7,6.07,24.3,11.4,6.63,1.9,0.51,6.47,32.3,55.1,1.1,68.4,1.28,6.34,6.86,45.7,1.46,42.3,64.4,0.35,47.4,71.9,14,79.1,0.12,34,46.5,26.2,22.3,41.9,34.2,25.2,31.7,1.14,39.5,35.1,34.5,54.8,24.8,12.9,0,11.8,21.4,2.73,2.05,33.8,52.2,33.6,39.7,10.9,1.44,43.7,2.5,61.5,9.1,53,46.7,0.3,19.1,23.8,58.2,36.3,8.06,45.8,0.85,23.7,28.3,11,33.4,41.6,0,37.6,32.8,0.01,28.7,4.83,56.8,56.5,24.1,90,79.2,31,25.8,56,50.1,36.2,40.5,1.68,68.5,32.1,43.1,0,30.1,49.8,11.2,18.8,0.45,9.83,41.9,21.7,90.1,35.1,28.2,16.7,9.53,31.1,26.3,11.3,26.3,39.6,54.1,97.4,40.1,61.5,68.7,28.9,10.9,73.3,2.84,11.1,3.43,30.3,39.3,22.2,38.9,3.05,8.78,46.6,61.9,2.5,12.4,18.8,26.3,44.5,4.52,28.9,33.3,51.6,11.7,16.7,37.4,11.6,33.9,8.37,73.2,52.4,24.1,56.9,46.7,36.3,58.2,1.04,14.1,60.3,45.1];
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
            padding: const EdgeInsets.fromLTRB(100,100,100,20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 600,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SfCartesianChart(
                        title: ChartTitle(text: 'Air Polution Index'),
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<ChartData, String>(
                            dataSource: [
                              ChartData('2010', 0.15),
                              ChartData('2011', 0.16),
                              ChartData('2012', 0.165),
                              ChartData('2013', 0.167),
                              ChartData('2014', 0.18),
                              ChartData('2015', 0.182),
                              ChartData('2016', 0.19),
                              ChartData('2017', 0.2),
                              ChartData('2018', 0.18),
                              ChartData('2019', 0.19),
                              ChartData('2020', 0.197),
                              ChartData('2021', 0.18),
                              ChartData('2022', 0.22),
                              ChartData('2023', 0.23),
                              ChartData('2024', 0.24),
                              ChartData('2025', 0.25),
                              ChartData('2026', 0.24),
                              ChartData('2027', 0.245),
                              ChartData('2028', 0.246),
                              ChartData('2029', 0.247),
                              ChartData('2030', 0.26),
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) => double.parse(data.x) > 2022? Colors.red:Colors.green
                          )
                        ]
                      ),
                      SfCartesianChart(
                        title: ChartTitle(text: 'CO2 emission'),
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<ChartData, String>(
                            dataSource: [
                              ChartData('2010', 364.00),
                              ChartData('2011', 369.96),
                              ChartData('2012', 371.08),
                              ChartData('2013', 376.00),
                              ChartData('2014', 377.70),
                              ChartData('2015', 379.98),
                              ChartData('2016', 387.81),
                              ChartData('2017', 398.93),
                              ChartData('2018', 409.07),
                              ChartData('2019', 419.68),
                              ChartData('2020', 424.55),
                              ChartData('2021', 425.87),
                              ChartData('2022', 427.97),
                              ChartData('2023', 437.65),
                              ChartData('2024', 440.3),
                              ChartData('2025', 445.65),
                              ChartData('2026', 450.85),
                              ChartData('2027', 460.65),
                              ChartData('2028', 470.65),
                              ChartData('2029', 471.65),
                              ChartData('2030', 475.65),
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) => double.parse(data.x) > 2022? Colors.red:Colors.green
                          )
                        ]
                      ),
                      SfCartesianChart(
                        title: ChartTitle(text: 'Sea Level Rise'),
                        primaryXAxis: CategoryAxis(),
                        series: <ChartSeries>[
                          LineSeries<ChartData, String>(
                            dataSource: [
                              ChartData('2010', 12.55),
                              ChartData('2011', 13.99),
                              ChartData('2012', 23.62),
                              ChartData('2013', 27.87),
                              ChartData('2014', 30.34),
                              ChartData('2015', 38.58),
                              ChartData('2016', 43.42),
                              ChartData('2017', 45.02),
                              ChartData('2018', 49.23),
                              ChartData('2019', 53.58),
                              ChartData('2020', 56.51),
                              ChartData('2021', 60.56),
                              ChartData('2022', 64.82),
                              ChartData('2023', 68.79),
                              ChartData('2024', 72.75),
                              ChartData('2025', 76.72),
                              ChartData('2026', 80.68),
                              ChartData('2027', 84.64),
                              ChartData('2028', 88.61),
                              ChartData('2029', 92.57),
                              ChartData('2030', 96.54),
                            ],
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) => double.parse(data.x) > 2022? Colors.red:Colors.green
                          )
                        ]
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50,bottom: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.countryName,
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(height: 40,),
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(vegetation,height: 50,),
                                const SizedBox(width: 20,),
                                Text('Current : ${veg[widget.countryIndex]}%',style: GoogleFonts.roboto(fontSize: 25,color: Colors.red),),
                                const SizedBox(width: 20,),
                                Text('Required : 33%',style: GoogleFonts.roboto(fontSize: 25,color: Colors.green),),
                              ],
                            ),
                            Text('Vegetation',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 50,),
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(transport,height: 50,),
                                const SizedBox(width: 20,),
                                Text('Current : 27 MT',style: GoogleFonts.roboto(fontSize: 25,color: Colors.red),),
                                const SizedBox(width: 20,),
                                Text('Acceptable : 37 MT',style: GoogleFonts.roboto(fontSize: 25,color: Colors.green),),
                              ],
                            ),
                            Text('Carbon from Transport',style: GoogleFonts.poppins(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.teal),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40,),
                      MaterialButton(
                        onPressed: (){},
                        color: Colors.green,
                        height: 40,
                        minWidth: 100,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: [
                            Image.asset(confused,height:60),
                            Text(
                              'What to do now??',
                              style: GoogleFonts.roboto(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            const Icon(Icons.keyboard_arrow_right,size: 40,)
                          ],
                        )
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}