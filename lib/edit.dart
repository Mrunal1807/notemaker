import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button.dart';
import 'home.dart';
import 'myinput.dart';
import 'myinput2.dart';

class EditTaskPage extends StatefulWidget {
  const EditTaskPage({Key? key,required this.title,required this.description,required this.date,required this.id}) : super(key: key);
  final String title;
  final String description;
  final String date;
  final String id;
  @override
  State<EditTaskPage> createState() => _EditTaskPageState();
}

class _EditTaskPageState extends State<EditTaskPage> {

  late final TextEditingController _titleController;
  late final TextEditingController _noteController;




  @override
  Widget build(BuildContext context) {

    _titleController=TextEditingController(text:widget.title);
    _noteController=TextEditingController(text:widget.description);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(context),
        body:Container(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Edit Note's Details",
                  style: GoogleFonts.abhayaLibre(
                      textStyle: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                  ),
                ),
                MyInputFeild(title: "Title", hint: "Enter title name",controller:_titleController ,),

                MyInputFeild2(title: "Description", hint: "Enter Description",controller: _noteController,),

                SizedBox(height: 30,),


                Row(
                  children: [
                    SizedBox(
                      width: 230,
                    ),
                    MyButton(label: "Edit"+"\n"+"Note",
                        onTap:() async {
                          if(_titleController.text.isNotEmpty ){

                            FirebaseFirestore.instance.collection("note").doc(widget.id).update({
                              "Date":DateTime.now().day.toString() +"-"+ DateTime.now().month.toString()+"-"+DateTime.now().year.toString(),
                              "Title":_titleController.text,
                              "description":_noteController.text,


                            });
                            await Navigator.push(context,MaterialPageRoute(builder: (builder)=>Home(),));
                          }
                          else if(_titleController.text.isEmpty && _noteController.text.isEmpty){
                            Get.snackbar("Required","   All details are required!");
                            snackPosition:SnackPosition.BOTTOM;
                            backgroundColor:Colors.white;
                            colorText:Color(0xFFff4667);
                            icon:Icon(Icons.warning_amber_rounded);
                          }

                        }
                    ),

                  ],
                ),

              ],


            ),
          ),
        )
    );
  }




  _appBar(BuildContext context){
    return AppBar(
      elevation: 0,
      backgroundColor:Colors.white,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios,
            size:20,
            color: Colors.black
        ),
      ),

    );
  }




}
