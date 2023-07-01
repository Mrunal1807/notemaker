import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyInputFeild2 extends StatefulWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget? widget;



  const MyInputFeild2({Key? key,
    required this.title,
    required this.hint,
    this.controller,
    this.widget,


  }) : super(key: key);

  @override
  State<MyInputFeild2> createState() => _MyInputFeild2State();
}

class _MyInputFeild2State extends State<MyInputFeild2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              widget.title,
              style:GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black
                  )
              ),
          ),
          Container(
              height:400,
              margin: EdgeInsets.only(top:8.0),
              padding:EdgeInsets.only(left: 14),
              //color: Colors.grey,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Row(
                  children:[
                    Expanded(
                        child:TextFormField(
                          maxLines: 1000,
                          readOnly: widget.widget==null?false:true,
                          autofocus: true,
                          cursorColor: Colors.grey[700],
                          controller: widget.controller,
                          //keyboardType: TextInputType.text,
                          style: GoogleFonts.lato(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey[600]
                              )
                          ),
                          decoration: InputDecoration(
                              hintText:widget.hint,
                              hintStyle: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color:Colors.grey[600]
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width:0,

                                  )
                              )
                          ),
                        )
                    ),
                    widget.widget==null?Container():Container(child:widget.widget),
                  ]
              )
          ),
        ],

      ),
    );
  }
}
