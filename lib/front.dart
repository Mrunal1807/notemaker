import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Front extends StatefulWidget {
  const Front({Key? key}) : super(key: key);

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds:5),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>Home())));

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      //backgroundColor: Colors.lightGreen,
        body: Container(
          width:double.infinity,
          height:double.infinity,
          //alignment: Alignment.center,
          //padding: const EdgeInsets.all(32),
          decoration:  BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/front1.png'),
              fit:BoxFit.cover,


            ),
          ),
          child:Center(
              child:Text("NOTES"+"\n""       MAKER",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 54,fontStyle:FontStyle.italic,color: Colors.black54),
              )




          ),


        )

    );
  }
}
