import 'package:flutter/material.dart';

import '../constants.dart';

class WhatToDo extends StatefulWidget {
  const WhatToDo({Key? key}) : super(key: key);

  @override
  State<WhatToDo> createState() => _WhatToDoState();
}

class _WhatToDoState extends State<WhatToDo> {
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
            // child: ,
          )
        ],
      ),
    );
  }
}