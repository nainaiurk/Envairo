import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../constants.dart';
import '../map/map_screen.dart';

class Details extends StatefulWidget {
  const Details({Key? key, required this.countryName}) : super(key: key);
  final String countryName;

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
                              ChartData('2021', 0.22),
                              ChartData('2022', 0.23),
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
                              ChartData('2021', 427.97),
                              ChartData('2022', 437.65),
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
                              ChartData('2021', 64.82),
                              ChartData('2022', 68.79),
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
                                Text('Current : 23%',style: GoogleFonts.roboto(fontSize: 25,color: Colors.red),),
                                const SizedBox(width: 20,),
                                Text('Required : 34%',style: GoogleFonts.roboto(fontSize: 25,color: Colors.green),),
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