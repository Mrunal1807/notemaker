import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'edit.dart';

class details extends StatefulWidget{
  details({Key,key,required this.document,required this.id}):super(key:key);
  final Map<String,dynamic>document;
  final String id;


  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {


  @override
  Widget build(BuildContext context) {

  
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [

          TaskBar(),

        ],
      ),
    );
  }
  _appBar(){
    return AppBar(
      elevation: 0,
      backgroundColor:Colors.blueGrey.shade700,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,
            size:20,
            color: Colors.white
        ),
      ),


      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () async {
                await Future.delayed(Duration(seconds: 0));
                await Navigator.push(context,MaterialPageRoute(builder: (builder)=>EditTaskPage(
                  title:widget.document["Title"],
                  description:widget.document["description"],
                  date:widget.document["Date"],
                  id:widget.id,
                )));
              },
              icon: Icon(Icons.edit,size: 40,),
              color:Colors.white,),
            SizedBox(width: 20,),
            IconButton(
              onPressed: (){
                FirebaseFirestore.instance.collection("note").doc(widget.id).delete().then((value){
                  Navigator.pop(context);
                });
              },
              icon: Icon(Icons.delete,size: 40,),
              color:Colors.white,),
          ],
        )
      ],
    );
  }
  TaskBar(){

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height:150 ,
          width:380,

          margin: EdgeInsets.only(top:25.0),
          padding:EdgeInsets.only(left:50.0,right: 50.0),


          decoration: BoxDecoration(borderRadius:BorderRadius.circular(12.0 ),

            boxShadow:[BoxShadow(
              color:Colors.blueGrey.shade500,

              offset: const Offset(5.0, 5.0),



            )],),
          child:Row(
            children: [
              Image.asset('images/notes.png',scale: 6,),
              SizedBox(width:30),
              Flexible(

                  child:
              Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.only(top:50.0),
                    child: Text(widget.document["Title"],style: GoogleFonts.actor(
                        textStyle: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )
                    ),),
                  ),
                 Text(widget.document["Date"],style:  GoogleFonts.lato(
                      textStyle: TextStyle(
                        fontSize: 17,
                        color:Colors.white,
                      )
                  ),),
                ],
              )
              ),
            ],
          ),


        ),
       // SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left:15.0,right:15.0,top:5),
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width:360,
              decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomRight:Radius.circular(25),bottomLeft: Radius.circular(25)),color: Colors.black12),
           child:Padding(
             padding: const EdgeInsets.all(15.0),
             child: Text(widget.document["description"],style:  GoogleFonts.lato(
                 textStyle: TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.w400,
                     color: Colors.black,
                 )
             ),),
           ),
            ),
          ),
        )
      ],
    );





  }


}