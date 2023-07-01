import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'button.dart';
import 'myinput.dart';
import 'myinput2.dart';

class AddTaskPage2 extends StatefulWidget {
  const AddTaskPage2({Key? key}) : super(key: key);

  @override
  State<AddTaskPage2> createState() => _AddTaskPage2State();
}

class _AddTaskPage2State extends State<AddTaskPage2> {

  final TextEditingController _titleController=TextEditingController();
  final TextEditingController _noteController=TextEditingController();
//  final TextEditingController _nameController=TextEditingController();




  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(context),
        body:Container(
          padding: const EdgeInsets.only(left:20,right: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add Note's Details",
                  style: GoogleFonts.abhayaLibre(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )
                  ),
                ),
                MyInputFeild(title: "Title", hint: "Enter title name",controller:_titleController ,),

                MyInputFeild2(title: "Description", hint: "Enter Description",controller: _noteController,),

               const SizedBox(height: 30,),


                Row(
                  children: [
                    const SizedBox(
                      width: 230,
                    ),
                    MyButton(label: "Add"+"\n"+"Note",
                        onTap:(){
                          if(_titleController.text.isNotEmpty ){

                            FirebaseFirestore.instance.collection("note").doc().set({
                              "Date": "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                              "Title":_titleController.text,
                              "description":_noteController.text,



                            });
                            Navigator.pop(context);
                          }
                          else if(_titleController.text.isEmpty){
                            Get.snackbar("Required"," Title is required!");
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
        child: const Icon(Icons.arrow_back_ios,
            size:20,
            color: Colors.black
        ),
      ),

    );
  }




}
