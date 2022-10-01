import 'package:envairo/constants.dart';
import 'package:envairo/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_maps/maps.dart';
import 'components/left_column.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late MapShapeSource dataSource;
  late List<Model> data;
  late MapZoomPanBehavior _zoomPanBehavior;
  List<MapColorMapper> mapColorMaper = [
    const MapColorMapper(from: 0, to: 100, color: Color.fromARGB(255, 22, 162, 237), text: '{0ppm},{100 ppm}'),
    const MapColorMapper(from: 101, to: 200, color: Color.fromARGB(255, 130, 183, 208), text: '200ppm'),
    const MapColorMapper(from: 201, to: 300, color: Color.fromARGB(255, 224, 227, 230), text: '300ppm'),
    const MapColorMapper(from: 301, to: 400, color: Color.fromARGB(255, 236, 182, 100), text: '400ppm'),
    const MapColorMapper(from: 401, to: 500, color: Color.fromARGB(255, 210, 98, 7), text: '500ppm'),
  ];
  int selectedIndex = 0;
  int toolIndex = 0;
  bool tooltip = false;
  String dataName = 'CO2';
  late Future<List<String>> _futureData ;
  @override
  void initState() {
    // gsheetdata();
    data = <Model>[
      const Model('United States of America', 190),
      const Model('India', 350),
      const Model('Kazakhstan', 37),
      const Model('Italy', 201),
      const Model('Japan', 335),
      const Model('Cuba', 103),
      const Model('China', 148),
      const Model('Bangladesh', 500),
      const Model('Russia', 200),
      const Model('China', 250),
      const Model('Australia', 100),
      const Model('Afganistan', 400),
      const Model('Qatar', 150),
      const Model('Pakistan', 50),
      const Model('Myanmar', 500),
      const Model('Thailand', 400),
    ];
    // List.generate(239, (index) => data.add(Model(country[index+1].toString(), double.parse(apivalue[index+1]))));
    dataSource = MapShapeSource.asset(
      "assets/json/world_map.json",
      shapeDataField: "name",
      dataCount: data.length,
      primaryValueMapper: (int index) {
        return data[index].country;
      },
      shapeColorValueMapper: (int index) {
        return data[index].count;
      },
      shapeColorMappers: mapColorMaper
    );
    _zoomPanBehavior = MapZoomPanBehavior(enableMouseWheelZooming: true,enableDoubleTapZooming: true,enablePanning: true,enablePinching: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(background,height: maxHeight,width: maxWidth,fit: BoxFit.fill,),
          // Background(mainHeight: maxHeight*0.1,drawer: true,),
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  // color: const Color.fromARGB(255, 173, 231, 173),
                  height: maxHeight*0.7,
                  width: maxWidth*0.7,
                  child: SfMaps(
                    layers: <MapLayer>[
                      MapShapeLayer(
                        source: dataSource,
                        color: Colors.blue[100],
                        loadingBuilder: (BuildContext context) {
                          return Container(
                            height: 25,
                            width: 25,
                            child: const CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.black,
                            ),
                          );
                        },
                        strokeColor: Colors.blue,
                        strokeWidth: 1,
                        zoomPanBehavior: _zoomPanBehavior,
                        selectedIndex: selectedIndex,
                        showDataLabels: true,
                        dataLabelSettings: const MapDataLabelSettings(
                          overflowMode: MapLabelOverflow.hide,
                          // textStyle: 
                        ),
                        onSelectionChanged: (int index) {
                          setState(() {
                            selectedIndex = index;
                            // tooltip = !tooltip;
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Details(countryName: data[index].country,countryIndex: index,)));
                          });
                        },
                        tooltipSettings: const MapTooltipSettings(
                          hideDelay: double.infinity,
                          color: Colors.green,
                          strokeColor: Colors.red
                        ),
                        selectionSettings: MapSelectionSettings(
                            color: Colors.white30,
                            strokeColor: Colors.red[900],
                            strokeWidth: 2,
                        ),
                        legend: const MapLegend.bar(
                          MapElement.shape,
                          position: MapLegendPosition.bottom,
                          overflowMode: MapLegendOverflowMode.scroll,
                          
                          labelsPlacement: MapLegendLabelsPlacement.betweenItems,
                          edgeLabelsPlacement: MapLegendEdgeLabelsPlacement.center,
                          segmentPaintingStyle: MapLegendPaintingStyle.gradient,
                          showPointerOnHover: true,
                          pointerSize: Size(20, 20),
                          pointerColor: Colors.deepPurple,
                        ),
                        shapeTooltipBuilder: (BuildContext context, int index) {
                          setState(() {
                            tooltip = !tooltip;
                            toolIndex = index;
                          });
                          return Container(
                            height: 200,
                            width: 200,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  data[index].country,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border:Border.all(color: data[index].count>220?  Colors.red:Colors.green)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      data[index].count>220
                                      ? const Icon(Icons.dangerous,size: 30,color: Colors.red,)
                                      : const Icon(Icons.done,size: 30,color: Colors.green,),
                                      Text(
                                        data[index].count>220 ?'Unhealthy Stage':'Healthy Stage',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: (data[index].count>220?  Colors.red:Colors.green)
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Center(
                                  child: dataName == 'CO2'
                                  ? Text('CO2: ${data[index].count} \n metric tons/capita',textAlign: TextAlign.center,style: GoogleFonts.roboto(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold))
                                  : dataName == 'API'
                                  ? Text('API: ${data[index].count} \n micrograms/cubic meter',textAlign: TextAlign.center,style: GoogleFonts.roboto(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold))
                                  : Text('Sea Level: ${data[index].count}',textAlign: TextAlign.center,style: GoogleFonts.roboto(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold)),
                                ),                         
                              ],
                            ),
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
              maxWidth>960? const RightColumn(): const SizedBox(width: 0,height: 0,),             
            ],
          ),
          tooltip == true
            ? Padding(
              padding: const EdgeInsets.fromLTRB(20,100,0,0),
              child: Container(
                height: 400,
                width: 300,
                color: Colors.white,
                child: Column(
                  children: [
                    Text(data[toolIndex].country),
                    SfCartesianChart(
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
            )
            : const SizedBox(height: 0,width: 0,),
        ],
      ),
    );
  }
}
class Model {
  const Model(this.country, this.count);
  final String country;
  final double count;
}
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}