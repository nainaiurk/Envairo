import 'package:envairo/constants.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key, required this.mainHeight,required this.drawer, 

  }) : super(key: key);
  final double mainHeight;
  final bool drawer;

  @override
  Widget build(BuildContext context) {
    var maxHeight = MediaQuery.of(context).size.height;
    var maxWidth = MediaQuery.of(context).size.width;
    return Container(
      height: mainHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: mainHeight*0.7,
                width: maxWidth*0.3,
                constraints: const BoxConstraints(
                  minWidth: 200
                ),
                color: green1,
                child: Text(
                  'Climate Enquiry',style: TextStyle(
                    color: Colors.white,
                    fontSize: maxWidth>960?30:maxWidth*0.05,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Container(
                height: mainHeight*0.3,
                width: maxWidth*0.3,
                constraints: const BoxConstraints(
                  minWidth: 200
                ),
                color: green2,
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: mainHeight,
            width: maxWidth>960 ?maxWidth*0.7:maxWidth*0.59,
            constraints: const BoxConstraints(
              minWidth: 200,
            ),
            // color: green3,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                colors:[
                    Color(0xFF92d7b1),
                    Color(0xFF3a9162),
                ],
                begin:  FractionalOffset(0.0, 0.0),
                end:  FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 25,
                  width: maxWidth>960?70:50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: const Center(child: Text('Facts',style: TextStyle(color: Colors.white,))),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: 25,
                  width: maxWidth>960?70:50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:const Center(child: Text('Article',style: TextStyle(color: Colors.white))),
                ),
                const SizedBox(width: 10,),
                Container(
                  height: 25,
                  width: maxWidth>960?70:60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child:const Center(child: Text('Explore',style: TextStyle(color: Colors.white))),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}