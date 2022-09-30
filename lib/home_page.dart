import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:envairo/constants.dart';
import 'package:envairo/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'map/map_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> country = ["America","Argentina","Brazil","Bangladesh","Italia", "Tunisia", 'Canada'];
  final TextEditingController textEditingController = TextEditingController();
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(background,height: maxHeight,width: maxWidth,fit: BoxFit.fill,),
          Container(
            padding: const EdgeInsets.fromLTRB(50,20,50,20),
            child: Column(
              children: [
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
                            color: Colors.white,
                            
                          ),
                          child: Center(child: Text('details',style: TextStyle(fontFamily: 'Kollektif',fontSize: 20))),
                          
                        ),
                        const SizedBox(width: 30,),
                      ],
                    )
                  ],
                ),
                SizedBox(height: maxHeight*0.2,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(title,scale: 0.8,),
                        SizedBox(height: maxHeight*0.05,),
                        Container(
                          width: maxWidth*0.4,
                          // padding: const EdgeInsets.only(),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              buttonPadding: const EdgeInsets.all(10),
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey)
                              ),
                              // isExpanded: true,
                              icon: const Icon(Icons.search),
                              hint: Text(
                                'Select your Location',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Theme.of(context).hintColor,
                                ),
                              ),
                              items: country
                                      .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                                      .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as String;
                                });
                              },
                              buttonHeight: 50,
                              buttonWidth: maxWidth*0.75,
                              // itemHeight: 40,
                              dropdownMaxHeight: 300,
                              searchController: textEditingController,
                              searchInnerWidget: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  controller: textEditingController,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 15,
                                    ),
                                    hintText: 'Search a country...',
                                    hintStyle: const TextStyle(fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              searchMatchFn: (item, searchValue) {
                                return (item.value.toString().contains(searchValue));
                              },
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  textEditingController.clear();
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: maxHeight*0.03,),
                        Container(
                          padding: const EdgeInsets.only(left: 450),
                          child: MaterialButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Details(countryName: selectedValue.toString(),)));
                            },
                            height: 50,
                            minWidth: 150,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Colors.green,
                            elevation: 20,
                            child: const Text('browse',style: TextStyle(fontFamily: 'Kollektif',color: Colors.white,fontSize: 15),),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      // padding: const EdgeInsets.all(40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              FeatureCard(name: 'CO2 Emission', image: co2,),
                              const SizedBox(width: 20,),
                              FeatureCard(name: 'Air Polution Index', image: api,),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              FeatureCard(name: 'Global Temparature',image: global,),
                              const SizedBox(width: 20,),
                              FeatureCard(name: 'Sea Level Rising',image: sea,),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class FeatureCard extends StatefulWidget {
  const FeatureCard({
    Key? key,
    required this.name, required this.image,
    // required this.Height,
  }) : super(key: key);
  final String name;
  final String image;
  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool tapped = false;
  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        setState(() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const MapScreen()));
        });
      },
      child: Material(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5)
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.lime)
          ),   
          height: 180,
          // height: tapped? maxHeight*0.35:maxHeight*0.35-20,
          width: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(widget.image,height: 40,),
              Text(
                widget.name,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.green
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}