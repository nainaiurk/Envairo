// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:envairo/constants.dart';
// import 'package:envairo/map/map_screen.dart';
// import 'package:flutter/material.dart';
// import 'background.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   List<String> country = ["America","Argentina","Brazil","Bangladesh","Italia", "Tunisia", 'Canada'];
//   final TextEditingController textEditingController = TextEditingController();
//   String? selectedValue;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     var maxHeight = MediaQuery.of(context).size.height;
//     var maxWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Background(mainHeight: maxHeight*0.5,drawer: false,),
//             Center(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(height: maxHeight*0.15,),
//                   Text(
//                     'Explore Your Climate Condition',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: maxWidth>1000? maxWidth*0.04:maxHeight*0.06
//                     ),
//                   ),
//                   SizedBox(height: maxHeight*0.05,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       FeatureCard(name: 'Air Polution Index',image: api,),
//                       FeatureCard(name: 'C02 Emission',image: co2,),
//                       FeatureCard(name: 'Particulate Matter',image: matter,),
//                     ],
//                   ),
//                   SizedBox(height: maxHeight*0.05,),
//                   DropdownButtonHideUnderline(
//                     child: DropdownButton2(
//                       buttonPadding: const EdgeInsets.all(10),
//                       buttonDecoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: Colors.grey)
//                       ),
//                       // isExpanded: true,
//                       icon: const Icon(Icons.search),
//                       hint: Text(
//                         'Select your Location',
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Theme.of(context).hintColor,
//                         ),
//                       ),
//                       items: country
//                               .map((item) => DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(
//                           item,
//                           style: const TextStyle(
//                             fontSize: 14,
//                           ),
//                         ),
//                       ))
//                               .toList(),
//                       value: selectedValue,
//                       onChanged: (value) {
//                         setState(() {
//                           selectedValue = value as String;
//                         });
//                       },
//                       buttonHeight: 50,
//                       buttonWidth: maxWidth*0.75,
//                       // itemHeight: 40,
//                       dropdownMaxHeight: 300,
//                       searchController: textEditingController,
//                       searchInnerWidget: Padding(
//                         padding: const EdgeInsets.only(
//                           top: 8,
//                           bottom: 4,
//                           right: 8,
//                           left: 8,
//                         ),
//                         child: TextFormField(
//                           controller: textEditingController,
//                           decoration: InputDecoration(
//                             isDense: true,
//                             contentPadding: const EdgeInsets.symmetric(
//                               horizontal: 10,
//                               vertical: 15,
//                             ),
//                             hintText: 'Search a country...',
//                             hintStyle: const TextStyle(fontSize: 12),
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         ),
//                       ),
//                       searchMatchFn: (item, searchValue) {
//                         return (item.value.toString().contains(searchValue));
//                       },
//                       onMenuStateChange: (isOpen) {
//                         if (!isOpen) {
//                           textEditingController.clear();
//                         }
//                       },
//                     ),
//                   ),
//                   SizedBox(height: maxHeight*0.05,),
//                   MaterialButton(
//                     onPressed: (){
//                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const MapScreen()));
//                     },
//                     height: 50,
//                     minWidth: 250,
//                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                     color: green1,
//                     elevation: 20,
//                     child: const Text('Browse',style: TextStyle(color: Colors.white,fontSize: 20),),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FeatureCard extends StatefulWidget {
//   const FeatureCard({
//     Key? key,
//     required this.name, required this.image,
//     // required this.Height,
//   }) : super(key: key);

//   final String name;
//   final String image;

//   @override
//   State<FeatureCard> createState() => _FeatureCardState();
// }

// class _FeatureCardState extends State<FeatureCard> {
//   bool tapped = false;
//   @override
//   Widget build(BuildContext context) {
//     var maxHeight = MediaQuery.of(context).size.height;
//     var maxWidth = MediaQuery.of(context).size.width;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           tapped = !tapped;
//         });
//       },
//       child: Material(
//         color: green3,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20)
//         ),
//         elevation: tapped? 50:0,
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             color: tapped?Colors.black38:null,
//           ),   
//           height: maxWidth>1200? maxWidth*0.2 : maxHeight*0.2,
//           // height: tapped? maxHeight*0.35:maxHeight*0.35-20,
//           width: maxWidth>1200? maxWidth*0.2 : maxHeight*0.2,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 widget.name,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize:  maxWidth>1200? maxHeight*0.05 : maxHeight*0.022,
//                 ),
//               ),
//               Image.asset(widget.image,height:  maxWidth>1200? maxWidth*0.05 : maxHeight*0.05,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }