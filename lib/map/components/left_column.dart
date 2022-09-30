import 'package:envairo/map/components/side_graph.dart';
import 'package:envairo/sheet/sheetdata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RightColumn extends StatefulWidget {
  const RightColumn({
    Key? key,
  }) : super(key: key);

  @override
  State<RightColumn> createState() => _RightColumnState();
}

class _RightColumnState extends State<RightColumn> {
  int graph = 0;
  List<String> graphName = [
    'Carbon Di-Oxide',
    'Global Temparature',
    'Sea Level',
    'Air Polution Index'
  ];
  late Future<List<List<String>>> _future ;
  @override
  void initState() {
    _future = gsheets('Table 1');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    // print(maxHeight.toString() + " "+ maxWidth.toString());
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: maxWidth*0.3,
        height: maxHeight*0.9,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(color: Colors.black26)),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              'Global Climate Data',
              style: GoogleFonts.gideonRoman(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.lime)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MaterialButton(
                    color: graph == 0? Colors.lime:Colors.green,
                    onPressed: (){
                      setState(() {
                        graph = 0;
                      });
                    },
                    elevation: graph == 0?20:0,
                    height: 30,
                    minWidth: 80,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'CO2',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      )
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        graph = 1;
                      });
                    },
                    elevation: graph == 1?20:0,
                    color: graph == 1? Colors.lime:Colors.green,
                    height: 30,
                    minWidth: 80,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'Global Warming',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      )
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        graph = 2;
                      });
                    },
                    elevation: graph == 2?20:0,
                    color: graph == 2? Colors.lime:Colors.green,
                    height: 30,
                    minWidth: 80,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'Sea Level',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      )
                    ),
                  ),
                  MaterialButton(
                    onPressed: (){
                      setState(() {
                        graph = 3;
                      });
                    },
                    elevation: graph == 2?20:0,
                    color: graph == 3? Colors.lime:Colors.green,
                    height: 30,
                    minWidth: 80,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                    child: const Center(
                      child: Text(
                        'API',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            SideGraph(future: _future, graphNo: graph, title: graphName[graph]),
            const SizedBox(height: 40,),
            const Text(
              'NASA Global Information Browse Services',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              'European Centre for Medium-Range Weather Forecasting',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Search',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)
                )
              ),
            ),
          ],
        )
      ),
    );
  }
}